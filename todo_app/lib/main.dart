import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

// ToDoList App made by Zimbakov Tech

void main() => runApp(MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    ));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Color primaryColor = Colors.red[600];
  final Color secondaryColor = Colors.white;
  final Color thirdColor = Colors.grey[850];
  List todos = List();
  String value;
  List state = List();
  String date = DateFormat('dd-MM-yyyy').format(DateTime.now());

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(60.0))),
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'To-Do List',
                style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor,
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                date,
                style: TextStyle(
                  fontSize: 16.0,
                  color: secondaryColor,
                ),
              )
            ],
          ),
        ),
        toolbarHeight: 150.0,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: FloatingActionButton(
          tooltip: 'Add new task',
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
                          color: thirdColor, fontWeight: FontWeight.bold),
                    ),
                    content: Container(
                      height: 115.0,
                      width: 100.0,
                      child: Column(
                        children: [
                          TextField(
                            autocorrect: true,
                            textCapitalization: TextCapitalization.sentences,
                            maxLength: 30,
                            autofocus: true,
                            decoration: InputDecoration(
                              hintText: 'Add new task...',
                            ),
                            onChanged: (String result) {
                              setState(() {
                                value = result;
                              });
                            },
                            textInputAction: TextInputAction.go,
                            onSubmitted: (value) {
                              setState(() {
                                todos.add(value);
                                Navigator.of(context).pop();
                                state.add(false);
                              });
                            },
                          ),
                          SizedBox(
                            height: 10.0,
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
                        fontSize: 17.0,
                        decoration: (state[index] == true)
                            ? TextDecoration.lineThrough
                            : null,
                        color:
                            (state[index] == true) ? Colors.grey[600] : null),
                  ),
                  subtitle: Text(date),
                  leading: IconButton(
                    tooltip: 'Mark as done',
                    icon: Icon(Icons.check_box),
                    onPressed: () {
                      setState(() {
                        state[index] = !state[index];
                      });
                    },
                    color: (state[index] == true) ? primaryColor : Colors.grey,
                  ),
                  trailing: IconButton(
                      tooltip: 'Delete task',
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          todos.removeAt(index);
                        });
                      },
                      color: primaryColor),
                ),
              );
            }),
      ),
    );
  }
}
