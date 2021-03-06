import 'package:flutter/material.dart';
import '/providers/auth.dart';
import '/screens/edit_product_screen.dart';
import '/screens/user_product.dart';
import '/providers/orders.dart';
import '/screens/orders_screen.dart';
import '/screens/cart_screen.dart';
import '/providers/cart.dart';
import 'package:provider/provider.dart';
import '/screens/products_overview_screen.dart';
import '/screens/product_detail_screen.dart';
import 'providers/products.dart';
import '/screens/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          // builder : (ctx) => Products(), -> 오류 발생
          update : (context, auth, previous) => Products(auth.token, previous.items),
          create : (ctx) => Products(null, []),
        ),
        ChangeNotifierProvider(
          // builder : (ctx) => Products(), -> 오류 발생
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          // builder : (ctx) => Products(), -> 오류 발생
          update : (context, auth, previous) => Orders(auth.token, previous.orders),
          create : (ctx) => Orders(null, []),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, authData, _) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: authData.isAuth ? ProductsOverviewScreen() : AuthScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
            },
        ),
      ),
    );
  }
}
