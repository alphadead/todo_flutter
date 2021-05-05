import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/screen/addPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPage())),
          backgroundColor: Colors.yellow[700],
          child: Icon(
            CupertinoIcons.add,
            size: 30.0,
            color: Colors.white,
          ),
          elevation: 3.0,
        ),
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
                            "Arbeit-Spur",
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
                                  Icons.settings,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "Settings",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Row(
                      children: [
                        Flexible(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search...",
                              hintStyle: TextStyle(color: Colors.grey.shade600),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey.shade600,
                                size: 20,
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              contentPadding: EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade100)),
                            ),
                          ),
                        ),
                        Container(
                          child: FloatingActionButton(
                            onPressed: () => _addItem(),
                            backgroundColor: Colors.yellow[800],
                            child: Icon(
                              CupertinoIcons.add,
                              size: 30.0,
                              color: Colors.black,
                            ),
                            elevation: 3.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 1000,
                      width: 800,
                      child: AnimatedList(
                          key: _key,
                          initialItemCount: _todos.length,
                          itemBuilder: (context, index, animation) {
                            return _builderItem(
                                _todos[index], animation, index);
                          }),
                    ),
                  ),
                ])));
  }

  Widget _builderItem(String item, Animation animation, int index) {
    return SizeTransition(
        sizeFactor: animation,
        child: Card(
          elevation: 2,
          child: ListTile(
            title: Text(
              item,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text("data"),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.yellow[800],
              ),
              onPressed: () {
                _removeItem(index);
              },
            ),
          ),
        ));
  }

  void _removeItem(int i) {
    String removeTask = _todos.removeAt(i);
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      return _builderItem(removeTask, animation, i);
    };
    _key.currentState.removeItem(i, builder);
  }

  void _addItem() {
    int i = _todos.length > 0 ? _todos.length : 0;
    _todos.insert(i, 'Task ${_todos.length + 1}');
    _key.currentState.insertItem(i);
  }
}
