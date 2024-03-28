
import '../../data/repositories/task_repository.dart';
import '../exception/task_exception.dart';
import '../model/task.dart';

abstract class GetAllTaskUsecase {
  Future<List<Task>> call();
}

class GetAllTaskUsecaseImpl implements GetAllTaskUsecase {
  final TaskRepository repository;

  GetAllTaskUsecaseImpl({required this.repository});

  @override
  Future<List<Task>> call() async {
    try {
      return repository.getAllTaks();
    } on TaskException {
      rethrow;
    }
  }
}
