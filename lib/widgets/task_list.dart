import 'package:StorageTests/data/interfaces/task_repository_interface.dart';
import 'package:StorageTests/data/models/task.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  TaskList({this.tasks});

  @override
  Widget build(BuildContext context) {
    if (tasks.length == 0) {
      return Center(child: Text("No tasks, add one!"));
    }

    return ListView.builder(
      itemBuilder: (context, idx) => _renderTask(context, tasks[idx]),
      itemCount: tasks.length,
      shrinkWrap: true,
    );
  }

  Widget _renderTask(BuildContext context, Task task) {
    return ListTile(
      title: Text(task.text),
    );
  }
}
