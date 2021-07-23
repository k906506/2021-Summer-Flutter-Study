import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final int price;

  CartItem({required this.id,
    required this.title,
    required this.quantity,
    required this.price});
}

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String productId, int price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (existingCartItem) =>
          CartItem(id: existingCartItem.id,
            title: existingCartItem.title,
            price: existingCartItem.price,
            quantity: existingCartItem.quantity + 1,),);
    } else {
      _items.putIfAbsent(productId, () =>
          CartItem(id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: 1,),);
    }
    notifyListeners();
  }
}