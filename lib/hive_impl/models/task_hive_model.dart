import 'package:hive/hive.dart';

part 'task_hive_model.g.dart';

@HiveType(typeId: 1)
class TaskHiveModel extends HiveObject {
  TaskHiveModel({this.text});

  @HiveField(1)
  String text;
}
