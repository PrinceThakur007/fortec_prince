import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ItemCard {
  String item_name;
  String item_description;
  double item_price;
  int number = 0;
  bool isCart = false;
  ItemCard(
    int i, {
    @required String name,
    @required String description,
    @required double price,
    @required bool isShowCart,
  }) {
    number = i;
    this.item_name = name;
    this.item_description = description;
    this.item_price = price;
    this.isCart = isShowCart;
  }

  Widget showItemCard() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(
            item_name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Text(
            item_description,
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Text(
            item_price.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: isCart
                ? Text(
                    "Number of units: " + number.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )
                : Container())
      ],
    );
  }
}
