import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/task_repository.dart';
import 'task_events.dart';
import 'task_states.dart';

class TaskFlutterBloc extends Bloc<TaskEvents, TaskState> {
  final repository = TaskRepositoryImpl();

  TaskFlutterBloc() : super(TaskInitialState()) {
    on<LoadTaskEvents>(((event, emit) async {
      emit(TasksLoadSucessState(tasks: await repository.getAllTaks()));
    }));

    on<AddTaskEvents>(((event, emit) async {
      emit(TasksAddSucessState(task: repository.addPeriod(event.task)));
    }));

    on<UpdateTaskEvents>(((event, emit) {
      emit(TasksUpdateSucessState(task: repository.updatePeriod(event.task)));
    }));

    on<DeleteTaskEvents>(((event, emit) {
      emit(TasksDeleteSucessState(id: repository.deletePeriod(event.id)));
    }));
  }
}
