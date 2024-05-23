import 'package:flutter/material.dart';
class ToDoList extends StatelessWidget {
  const ToDoList({super.key,
  required this.taskName,
  required this.taskCompleted,
  this.myonChanged
  });
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? myonChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.purple.shade600,
            borderRadius: BorderRadius.circular(10)
        ),

        child: Row(
          children: [
            Checkbox(value: taskCompleted,
                onChanged: myonChanged,
              checkColor: Colors.purple.shade600,
              activeColor: Colors.white,
              side: BorderSide(color: Colors.white),
            ),
            Text(taskName,
              style: TextStyle(
                color: Colors.white,fontSize: 15,
                decoration: taskCompleted?
                TextDecoration.lineThrough:
                TextDecoration.none,
                decorationColor: Colors.white,
                decorationThickness: 2
            ),),

          ],
        ),
      ),
    );
  }
}
