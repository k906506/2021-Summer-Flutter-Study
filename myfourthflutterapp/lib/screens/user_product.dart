import 'package:flutter/material.dart';
import 'package:myfourthflutterapp/widgets/user_product_item.dart';
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
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (_, index) => UserProductItem(
              productesData.items[index].title,
              productesData.items[index].imageUrl),
          itemCount: productesData.items.length,
        ),
      ),
    );
  }
}
