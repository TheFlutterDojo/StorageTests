import 'package:StorageTests/data/interfaces/task_repository_interface.dart';
import 'package:StorageTests/data/models/task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  Future<List<Task>> tasksFuture;

  @override
  void initState() {
    var taskRepository = Provider.of<ITaskRepository>(context);
    tasksFuture = taskRepository.getAllTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: tasksFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        }

        List<Task> tasks = snapshot.data;

        if (tasks.length == 0) {
          return Center(child: Text("No tasks, add one!"));
        }

        return ListView.builder(
          itemBuilder: (context, idx) => _renderTask(context, tasks[idx]),
          itemCount: tasks.length,
        );
      },
    );
  }

  Widget _renderTask(BuildContext context, Task task) {
    return ListTile(
      title: Text(task.text),
    );
  }
}
