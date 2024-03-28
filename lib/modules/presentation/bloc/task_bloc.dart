import 'dart:async';

import '../../data/repositories/task_repository.dart';
import '../../domain/model/task.dart';
import 'task_events.dart';
import 'task_states.dart';

class PeriodBloc {
  final TaskRepository repository;

  final StreamController<TaskEvents> _inputTasksController =
      StreamController<TaskEvents>();
  final StreamController<TaskState> _outputTasksController =
      StreamController<TaskState>();

  Sink<TaskEvents> get inputTasks => _inputTasksController.sink;
  Stream<TaskState> get stream => _outputTasksController.stream;

  PeriodBloc(this.repository) {
    _inputTasksController.stream.listen(_mapEventToState);
  }

  _mapEventToState(TaskEvents event) async {
    List<Task> tasks = [];
    if (event is LoadTaskEvents) {
      tasks = await repository.getAllTaks();
    } else if (event is AddTaskEvents) {
      await repository.addPeriod(event.task);
    } else if (event is UpdateTaskEvents) {
      await repository.updatePeriod(event.task);
    } else if (event is DeleteTaskEvents) {
      await repository.deletePeriod(event.id);
    }
    _outputTasksController.add(TasksLoadSucessState(tasks: tasks));
  }
}
