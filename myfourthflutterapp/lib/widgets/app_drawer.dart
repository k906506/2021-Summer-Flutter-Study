import 'package:flutter/material.dart';
import '/screens/user_product.dart';
import '/screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("안녕하세요, 고도현님"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('상품 확인'),
            onTap : () {
              Navigator.of(context).pushReplacementNamed('/');
            }
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('주문 내역'),
              onTap : () {
                Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
              }
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.edit),
              title: Text('상품 관리'),
              onTap : () {
                Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
              }
          ),
        ],
      ),
    );
  }
}
