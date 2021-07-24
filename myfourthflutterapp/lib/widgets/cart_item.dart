import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final int price;
  final int quantity;
  final String title;
  final String imageUrl;
  final String productId;

  CartItem(this.id, this.price, this.quantity, this.title, this.imageUrl,
      this.productId);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
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
      ),
    );
  }
}
