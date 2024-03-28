import '../../data/repositories/task_repository.dart';
import '../exception/task_exception.dart';

abstract class DeleteTaskUsecase {
  Future<void> call(int task);
}

class DeleteTaskUsecaseImpl implements DeleteTaskUsecase {
  final TaskRepository repository;

  DeleteTaskUsecaseImpl({required this.repository});

  @override
  Future<void> call(int id) async {
    try {
      return repository.deleteTask(id);
    } on TaskException {
      rethrow;
    }
  }
}
