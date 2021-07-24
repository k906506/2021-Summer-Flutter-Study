import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final int price;
  final int quantity;
  final String title;
  final String imageUrl;

  CartItem(this.id, this.price, this.quantity, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              imageUrl,
              height: 70,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(title),
          subtitle: Text('합계 : ${price * quantity}'),
          trailing: Text('${quantity}'),
        ),
      ),
    );
  }
}
