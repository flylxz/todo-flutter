import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  // const AddTaskScreen({
  //   Key? key,
  // }) : super(key: key);

  final void Function(String) addTaskCallback;

  const AddTaskScreen(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return Container(
      color: const Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.only(
            top: 20.0, left: 20.0, right: 20.0, bottom: 30.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.lightBlueAccent),
              textAlign: TextAlign.center,
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.lightBlue,
                fontSize: 20.0,
              ),
              onChanged: (newText) {
                // print(newTaskTitle);
                newTaskTitle = newText;
              },
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              padding: const EdgeInsets.all(10.0),
              color: Colors.lightBlueAccent,
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              onPressed: () => addTaskCallback(newTaskTitle),
            ),
          ],
        ),
      ),
    );
  }
}
