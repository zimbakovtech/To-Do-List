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
  final Color primaryColor = Colors.blue;
  final Color secondaryColor = Colors.white;
  List todos = List();
  String value;
  List state = List();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(60.0))),
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'To-Do List',
                style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        toolbarHeight: 180.0,
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
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    content: Container(
                      height: 110.0,
                      child: Column(
                        children: [
                          TextField(
                            autofocus: true,
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
                                color: primaryColor,
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: secondaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              FlatButton(
                                color: primaryColor,
                                child: Text(
                                  'Add',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: secondaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    todos.add(value);
                                    Navigator.of(context).pop();
                                    state.add(false);
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
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text(
                    todos[index],
                    style: TextStyle(
                        decoration: (state[index] == true)
                            ? TextDecoration.lineThrough
                            : null,
                        color:
                            (state[index] == true) ? Colors.grey[600] : null),
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.check_box),
                    onPressed: () {
                      setState(() {
                        state[index] = !state[index];
                      });
                    },
                    color: (state[index] == true) ? Colors.blue : Colors.grey,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
