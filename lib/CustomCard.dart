import 'package:flutter/material.dart';

class CustomCard {
  Widget showCard(
      {@required String user_id,
      @required String id,
      @required String title,
      @required String body}) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "User Id: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    user_id.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Id: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    id.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(
              "Title: ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      width: 370,
                      child: Text(
                        title.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                    ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(
              "Body: ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      width: 370,
                      child: Text(
                        body.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
