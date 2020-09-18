import 'package:flutter/material.dart';
import 'package:fortec_prince/ItemCard.dart';
import 'package:fortec_prince/Items.dart';
import 'package:fortec_prince/TaskScreen2.dart';

class CartView extends StatefulWidget {
  List<Items> cart_list = [];
  CartView({@required List<Items> cart_list}) {
    this.cart_list = cart_list;
  }
  @override
  _CartViewState createState() => _CartViewState(cart_list: cart_list);
}

class _CartViewState extends State<CartView> {
  List<Items> cart_list = [];

  _CartViewState({@required List<Items> cart_list}) {
    this.cart_list = cart_list;
  }

  double total_amount = 0;

  int getCartNumber() {
    return cart_list.length;
  }

  @override
  Widget build(BuildContext context) {
    total_amount = 0;
    for (int i = 0; i < cart_list.length; i++) {
      total_amount = total_amount + cart_list[i].price;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Out Cart"),
      ),
      body: Container(
          child: Column(
        children: [
          GestureDetector(
            child: Card(
              elevation: 10,
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        child: Text(
                          "Items in Cart",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 30,
                        ),
                        child: Text(
                          "${cart_list.length.toString()}",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart_list.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: [
                      GestureDetector(
                        child: ItemCard(1,
                                name: cart_list[index].item_name,
                                description: cart_list[index].item_descrption,
                                price: cart_list[index].price,
                                isShowCart: true)
                            .showItemCard(),
                        onTap: () {
                          setState(() {
                            cart_list.removeAt(index);
                          });

                          print(cart_list.toList());
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                final snackBar = SnackBar(
                                  content: Text("Item remove to the cart: " +
                                      cart_list[index].item_name),
                                  backgroundColor: Colors.red,
                                );

                                // Find the Scaffold in the widget tree and use
                                // it to show a SnackBar.
                                Scaffold.of(context).showSnackBar(snackBar);

                                setState(() {
                                  total_amount =
                                      total_amount - cart_list[index].price;
                                  cart_list.removeAt(index);

                                  // TaskScreen2State.products.add(new Items(
                                  //     item_name: cart_list[index].item_name,
                                  //     item_description:
                                  //         cart_list[index].item_descrption,
                                  //     item_price: cart_list[index].price));
                                });
                              },
                              icon: Icon(Icons.remove_circle),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      // print(cart_list[index].numbers);
                                      // cart_list[index].numbers =
                                      //     cart_list[index].numbers + 1;

                                      cart_list.add(
                                        new Items(
                                            item_name:
                                                cart_list[index].item_name,
                                            item_description: cart_list[index]
                                                .item_descrption,
                                            item_price: cart_list[index].price),
                                      );
                                    });
                                  }),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Card(
            elevation: 10,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: Text(
                        "Total Amount",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 30,
                      ),
                      child: Text(
                        "₹  ${total_amount}",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      )),
    );
  }
}
