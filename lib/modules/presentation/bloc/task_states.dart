import '../../domain/model/task.dart';

abstract class TaskState {
  List<Task> tasks;
  dynamic task;
  bool isDone;

  TaskState({
    this.task,
    this.isDone = false,
    required this.tasks,
  });
}

class TaskInitialState extends TaskState {
  TaskInitialState() : super(tasks: []);
}

class TasksLoadSucessState extends TaskState {
  TasksLoadSucessState({required List<Task> tasks}) : super(tasks: tasks);
}

class TasksAddSucessState extends TaskState {
  TasksAddSucessState({required task}) : super(task: task, tasks: task);
}

class TasksUpdateSucessState extends TaskState {
  TasksUpdateSucessState({required task}) : super(task: task, tasks: task);
}

class TasksDeleteSucessState extends TaskState {
  TasksDeleteSucessState({required id}) : super(task: id, tasks: []);
}

class TasksIsDoneSucessState extends TaskState {
  TasksIsDoneSucessState({required task}) : super(task: task, tasks: []);
}
