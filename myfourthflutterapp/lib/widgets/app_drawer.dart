import 'package:flutter/material.dart';
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
            title: Text('Shop'),
            onTap : () {
              Navigator.of(context).pushReplacementNamed('/');
            }
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.shop),
              title: Text('Orders'),
              onTap : () {
                Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
              }
          ),
        ],
      ),
    );
  }
}