import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  List<String> _todos = [
    'Dance',
    'Drink',
    'Play',
    'Study',
    'Dance',
    'Drink',
    'Play',
    'Study',
    'Dance',
    'Drink',
    'Play',
    'Study',
    'Dance',
    'Drink',
    'Play',
    'Study',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.yellow[700],
            child: Icon(
              CupertinoIcons.checkmark_alt,
              size: 30.0,
              color: Colors.white,
            ),
            elevation: 3.0,
            onPressed: () {}),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Add Task",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 8, right: 8, top: 2, bottom: 2),
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.yellow[700],
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.alarm,
                              color: Colors.red,
                              size: 20,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "Add Timer",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(children: <Widget>[
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Divider(
                        color: Colors.black,
                        height: 50,
                        thickness: 2.0,
                      )),
                ),
              ]),
              SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 30,
                      decorationThickness: 0.0,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.w500),
                      hintText: "Title",
                      border: InputBorder.none),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    color: Colors.grey,
                    height: 0.0,
                    thickness: .5,
                  )),
              SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 22,
                      decorationThickness: 0.0),
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 22.0),
                      hintText: "Description..",
                      border: InputBorder.none),
                ),
              ),
            ],
          ),
        ));
  }
}
