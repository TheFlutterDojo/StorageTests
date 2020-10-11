import 'package:StorageTests/data/interfaces/task_repository_interface.dart';
import 'package:StorageTests/data/models/task.dart';
import 'package:StorageTests/hive_impl/models/task_hive_model.dart';
import 'package:hive/hive.dart';

class HiveTaskRepository implements ITaskRepository {
  @override
  Future<List<Task>> getAllTasks() async {
    var box = await Hive.openBox<TaskHiveModel>("tasks");
    return box.values.map((tm) => Task(id: tm.key, text: tm.text)).toList();
  }

  @override
  Future<bool> addTask(String taskText) async {
    var box = await Hive.openBox<TaskHiveModel>("tasks");
    var id = await box.add(TaskHiveModel(text: taskText));

    return id >= 0;
  }

  @override
  Future<bool> deleteTask(Task task) async {
    var box = await Hive.openBox<TaskHiveModel>("tasks");
    try {
      await box.delete(task.id);
      return true;
    } catch (_) {
      return false;
    }
  }
}
