import 'dart:convert';

import "package:flutter/material.dart";
import 'package:fortec_prince/CustomCard.dart';
import 'package:fortec_prince/Posts.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class TaskScreen1 extends StatefulWidget {
  TaskScreen1({Key key}) : super(key: key);

  @override
  _TaskScreen1State createState() => _TaskScreen1State();
}

class _TaskScreen1State extends State<TaskScreen1> {
  final String URL = "https://jsonplaceholder.typicode.com/posts";

  List list = List();
  var isLoading = false;
  Future<Posts> future_posts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();

    // future_posts = fetchPosts();

    print(future_posts.toString());
  }

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get("https://jsonplaceholder.typicode.com/posts");
    if (response.statusCode == 200) {
      list = json.decode(response.body) as List;
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        actions: [],
        title: Text("Task 1 Screen"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              width: 410,
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      new Card(
                        elevation: 10,
                        child: Container(
                          // child: Text("Jai Shree Ganesh"),

                          // child: Text(data[Index]['title']),

                          child: GestureDetector(
                            child: CustomCard().showCard(
                                user_id: list[index]['userId'].toString(),
                                id: list[index]['id'].toString(),
                                title: list[index]['title'],
                                body: list[index]['body']),
                            onTap: () {},
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
    );
  }
}
