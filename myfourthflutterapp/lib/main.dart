import 'package:flutter/material.dart';
import 'package:myfourthflutterapp/providers/orders.dart';
import '/screens/cart_screen.dart';
import '/providers/cart.dart';
import 'package:provider/provider.dart';
import '/screens/products_overview_screen.dart';
import '/screens/product_detail_screen.dart';
import 'providers/products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // builder : (ctx) => Products(), -> 오류 발생
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          // builder : (ctx) => Products(), -> 오류 발생
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          // builder : (ctx) => Products(), -> 오류 발생
          create: (ctx) => Orders(),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName : (ctx) => CartScreen(),
          }),
    );
  }
}
