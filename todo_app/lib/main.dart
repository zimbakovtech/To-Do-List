import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    ));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Color primaryColor = Colors.blueAccent;
  final Color secondaryColor = Colors.white;
  List todos = List();
  String value;

  @override
  void initState() {
    super.initState();
    todos.add('Item1');
    todos.add('Item2');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text(
          'To-Do List',
          style: TextStyle(
            fontSize: 27.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: 80.0,
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: FloatingActionButton(
          backgroundColor: secondaryColor,
          child: Icon(
            Icons.add,
            color: primaryColor,
          ),
          onPressed: () {
            return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      'Add new task',
                      style: TextStyle(color: Colors.blue),
                    ),
                    content: Container(
                      height: 110.0,
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Add new task...',
                            ),
                            onChanged: (String result) {
                              setState(() {
                                value = result;
                              });
                            },
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FlatButton(
                                color: secondaryColor,
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              FlatButton(
                                color: secondaryColor,
                                child: Text(
                                  'Add',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    todos.add(value);
                                    Navigator.of(context).pop();
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(todos[index]),
              ),
            );
          }),
    );
  }
}
