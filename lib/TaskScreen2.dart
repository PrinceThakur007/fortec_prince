import 'package:flutter/material.dart';
import 'package:fortec_prince/CartView.dart';
import 'package:fortec_prince/ItemCard.dart';
import 'package:fortec_prince/Items.dart';

class TaskScreen2 extends StatefulWidget {
  TaskScreen2({Key key}) : super(key: key);

  @override
  _TaskScreen2State createState() => _TaskScreen2State();
}

class _TaskScreen2State extends State<TaskScreen2> {
  List<Items> products = [];

  List<Items> cart_list = [];
  bool value = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    products.add(new Items(
        item_name: "iphone 11",
        item_description: "This is an iphone",
        item_price: 50000));
    products.add(new Items(
        item_name: "Apple Macbook",
        item_description: "This is an Apple Macbook",
        item_price: 100000));
    products.add(new Items(
        item_name: "Air pods",
        item_description: "This is an Air Pods",
        item_price: 20000));
    products.add(new Items(
        item_name: "iwatch",
        item_description: "This is an iwatch",
        item_price: 300000));
    products.add(new Items(
        item_name: "Apple Macbook Pro",
        item_description: "This is an Apple Macbook pro",
        item_price: 200000));
    products.add(new Items(
        item_name: "Mac Pro",
        item_description: "This is a Mac Pro",
        item_price: 500000));
    products.add(new Items(
        item_name: "ipad pro",
        item_description: "This is an ipad pro",
        item_price: 50000));
    products.add(new Items(
        item_name: "Macbook Air",
        item_description: "This is a Macbook Air",
        item_price: 50000));
    products.add(new Items(
        item_name: "Mac Mini",
        item_description: "This is a Mac Mini",
        item_price: 30000));
  }

  @override
  Widget build(BuildContext context) {
    // if (CartView.cart_list != null) {
    //   cart_list = CartView.cart_list;
    // }
    return Scaffold(
      appBar: AppBar(
        title: Text("Task 2"),
      ),
      body: Container(
          child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartView(
                            cart_list: cart_list,
                          )));
            },
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
                          "Check out Cart",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 30,
                          ),
                          // child: Text(
                          //   "${cart_list.length.toString()}",
                          //   style: TextStyle(fontSize: 18),
                          // ),

                          child: Icon(Icons.shopping_cart)),
                    ],
                  )),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: [
                      GestureDetector(
                        child: ItemCard(1,
                                name: products[index].item_name,
                                description: products[index].item_descrption,
                                price: products[index].price,
                                isShowCart: false)
                            .showItemCard(),
                        onTap: () {
                          setState(() {
                            cart_list.add(
                              new Items(
                                  item_name: products[index].item_name,
                                  item_description:
                                      products[index].item_descrption,
                                  item_price: products[index].price),
                            );
                            products.removeAt(index);
                          });

                          print(cart_list.toList());
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: value
                              ? () {
                                  final snackBar = SnackBar(
                                    content: Text("Item added to the cart: " +
                                        products[index].item_name),
                                    backgroundColor: Colors.blue,
                                  );

                                  // Find the Scaffold in the widget tree and use
                                  // it to show a SnackBar.
                                  Scaffold.of(context).showSnackBar(snackBar);

                                  setState(() {
                                    cart_list.add(
                                      new Items(
                                          item_name: products[index].item_name,
                                          item_description:
                                              products[index].item_descrption,
                                          item_price: products[index].price),
                                    );
                                    // products.removeAt(index);
                                  });
                                }
                              : null,
                          color: Colors.blue,
                          child: Text(
                            "Add to cart",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
