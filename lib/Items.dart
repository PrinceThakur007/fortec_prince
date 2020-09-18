import 'package:flutter/foundation.dart';

class Items {
  String _item_name;
  String _item_descrption;
  double _price;
  int numbers;

  Items(
      {@required String item_name,
      @required String item_description,
      @required double item_price,
      int numbers}) {
    this._item_name = item_name;
    this.item_descrption = item_description;
    this.price = item_price;
    this.numbers = numbers;
  }
  String get item_name => _item_name;

  set item_name(String value) => _item_name = value;

  String get item_descrption => _item_descrption;

  set item_descrption(String value) => _item_descrption = value;

  double get price => _price;

  set price(double value) => _price = value;
}
