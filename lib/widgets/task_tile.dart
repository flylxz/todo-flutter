import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile({
    Key? key,
    required this.label,
    required this.isChecked,
    required this.checkboxCallback,
  }) : super(key: key);

  final String label;
  final void Function(bool) checkboxCallback;

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          label,
          style: TextStyle(
            fontSize: 22.0,
            color: Colors.blue,
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: (newValue) => checkboxCallback(newValue!),
        ));
  }
}
