import 'package:StorageTests/data/models/task.dart';
import 'package:flutter/material.dart';

typedef Future<void> DeleteTaskFunction(Task task);

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final DeleteTaskFunction onDeleteTask;

  TaskList({this.tasks, this.onDeleteTask});

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
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () => onDeleteTask(task),
      ),
    );
  }
}
