import 'dart:io';

import 'package:flutter/material.dart';
import '/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items]; // 기존의 _items를 변경하지 않고 데이터를 복사함
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: pickedTitle,
      location: null,
    );
    _items.add(newPlace);
    print(items.length);
    notifyListeners();
  }
}
