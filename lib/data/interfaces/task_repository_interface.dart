import 'package:StorageTests/data/models/task.dart';

abstract class ITaskRepository {
  Future<List<Task>> getAllTasks();
}
