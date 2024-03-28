import '../../data/repositories/task_repository.dart';
import '../exception/task_exception.dart';
import '../model/task.dart';

abstract class InsertTaskUsecase {
  Future<void> call(Task task);
}

class InsertTaskUsecaseImpl implements InsertTaskUsecase {
  final TaskRepository repository;

  InsertTaskUsecaseImpl({required this.repository});

  @override
  Future<void> call(Task task) async {
    try {
      return repository.addTask(task);
    } on TaskException {
      rethrow;
    }
  }
}
