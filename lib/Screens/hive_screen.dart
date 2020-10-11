import 'package:StorageTests/data/interfaces/task_repository_interface.dart';
import 'package:StorageTests/hive_impl/hive_task_repository.dart';
import 'package:StorageTests/widgets/task_app.dart';
import 'package:StorageTests/widgets/task_list.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HiveScreenState();
}

class _HiveScreenState extends State<HiveScreen> {
  Future<ITaskRepository> loaderFuture;

  Future<ITaskRepository> loadHive() async {
    await Hive.initFlutter();
    return new HiveTaskRepository();
  }

  @override
  void initState() {
    loaderFuture = loadHive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hive"),
        ),
        body: FutureBuilder(
          future: loaderFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    Text("Loading Hive..")
                  ],
                ),
              );
            }

            return TaskApp(taskRepository: snapshot.data);
          },
        ));
  }
}
