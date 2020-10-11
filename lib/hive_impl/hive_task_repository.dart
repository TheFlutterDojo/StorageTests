import 'package:StorageTests/data/interfaces/task_repository_interface.dart';
import 'package:StorageTests/data/models/task.dart';
import 'package:hive/hive.dart';

class HiveTaskRepository implements ITaskRepository {
  @override
  Future<List<Task>> getAllTasks() async {
    var box = await Hive.openBox<Task>("tasks");
    return box.values.toList();
  }
}
