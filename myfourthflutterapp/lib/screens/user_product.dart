import 'package:flutter/material.dart';
import '/screens/edit_product_screen.dart';
import '/widgets/app_drawer.dart';
import '/widgets/user_product_item.dart';
import '/providers/products.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-product';

  @override
  Widget build(BuildContext context) {
    final productesData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("상품 관리"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () {
            Navigator.of(context).pushNamed(EditProductScreen.routeName);
          }),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (_, index) => Column(
            children: [
              UserProductItem(
                  productesData.items[index].title,
                  productesData.items[index].imageUrl),
              Divider(),
            ],
          ),
          itemCount: productesData.items.length,
        ),
      ),
    );
  }
}
