import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/providers/great_places.dart';
import 'package:provider/provider.dart';
import '/screens/add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("장소"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Center(
          child: Text("새로운 장소"),
        ),
        builder: (ctx, greatPlaces, child) => greatPlaces.items.length <= 0
            ? child
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          FileImage(greatPlaces.items[index].image),
                    ),
                    title: Text(greatPlaces.items[index].title),
                    subtitle: Text(
                      greatPlaces.items[index].location.toString(),
                    ),
                  );
                },
                itemCount: greatPlaces.items.length,
              ),
      ),
    );
  }
}
