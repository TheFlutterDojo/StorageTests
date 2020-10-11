import 'package:StorageTests/data/interfaces/task_repository_interface.dart';
import 'package:StorageTests/data/models/task.dart';
import 'package:StorageTests/widgets/add_task_input.dart';
import 'package:StorageTests/widgets/task_list.dart';
import 'package:flutter/material.dart';

class TaskApp extends StatefulWidget {
  final ITaskRepository taskRepository;

  TaskApp({this.taskRepository});

  @override
  State<StatefulWidget> createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {
  Future<List<Task>> taskFuture;

  @override
  void initState() {
    taskFuture = widget.taskRepository.getAllTasks();
    super.initState();
  }

  Future<bool> addTask(String taskText) async {
    var added = await widget.taskRepository.addTask(taskText);
    if (added) {
      setState(() {
        taskFuture = widget.taskRepository.getAllTasks();
      });
    }

    return added;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: taskFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            children: [
              AddTaskInput(onTaskAdded: addTask),
              TaskList(tasks: snapshot.data),
            ],
          );
        });
  }
}
