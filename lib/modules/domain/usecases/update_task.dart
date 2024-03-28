import '../../data/repositories/task_repository.dart';
import '../exception/task_exception.dart';
import '../model/task.dart';

abstract class UpdateTaskUsecase {
  Future<void> call(Task task);
}

class UpdateTaskUsecaseImpl implements UpdateTaskUsecase {
  final TaskRepository repository;

  UpdateTaskUsecaseImpl({required this.repository});

  @override
  Future<void> call(Task task) async {
    try {
      return repository.updateTask(task);
    } on TaskException {
      rethrow;
    }
  }
}
