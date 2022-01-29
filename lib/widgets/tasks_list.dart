import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

//   @override
//   State<TasksList> createState() => _TasksListState();
// }
//
// class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: context.read<TaskData>().taskCount,
          itemBuilder: (BuildContext context, int index) {
            final task = taskData.tasks[index];
            return Dismissible(
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                taskData.deleteTask(task);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${task.name} deleted'),
                  ),
                );
              },
              key: Key(task.name),
              background: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20.0),
                color: Colors.red,
                child: Text('Delete',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    )),
              ),
              child: TaskTile(
                  label: task.name,
                  isChecked: task.isDone,
                  checkboxCallback: (bool checkboxState) {
                    taskData.updateTask(task);
                  }),
            );
          },
        );
      },
    );
  }
}
