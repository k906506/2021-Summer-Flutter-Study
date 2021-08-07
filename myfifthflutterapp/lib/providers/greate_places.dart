import 'package:flutter/material.dart';
import '/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    return [...items]; // 기존의 _items를 변경하지 않고 데이터를 복사함
  }
}