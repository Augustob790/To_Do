import '../../domain/model/task.dart';

abstract class TaskEvents {}

class LoadTaskEvents extends TaskEvents {}

class AddTaskEvents extends TaskEvents {
  Task task;

  AddTaskEvents({
    required this.task,
  });
}

class UpdateTaskEvents extends TaskEvents {
  Task task;

  UpdateTaskEvents({
    required this.task,
  });
}

class DeleteTaskEvents extends TaskEvents {
  int id;

  DeleteTaskEvents({
    required this.id,
  });
}
