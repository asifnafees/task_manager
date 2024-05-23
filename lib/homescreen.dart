import 'package:flutter/material.dart';
import 'package:task_manager/todo_list.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textFieldController =TextEditingController();
  List toDoList = [
    ['Asif Nafees',false],
  ];
  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }
  void saveTaskTodo() {
    setState(() {
      toDoList.add([textFieldController.text,false]);
      textFieldController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade300,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade600,
        foregroundColor: Colors.white, //title color
        title: Text('Todo Task'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoList(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            myonChanged: (value) => checkBoxChanged(index),
          );
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30,right: 20),
              child: TextField(
                controller:textFieldController,
                decoration: InputDecoration(
                    hintText: 'Enter your Task for remainds',
                    hintStyle: TextStyle(color: Colors.purple.shade600,
                    fontSize: 15,

                    ),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: saveTaskTodo,
            backgroundColor: Colors.white70,
            foregroundColor:  Colors.purple.shade600,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
