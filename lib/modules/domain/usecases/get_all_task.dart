
import '../../data/repositories/task_repository.dart';
import '../exception/task_exception.dart';
import '../model/task.dart';

abstract class GetAllPeriodUsecase {
  Future<List<Task>> call();
}

class GetAllPeriodUsecaseImpl implements GetAllPeriodUsecase {
  final TaskRepository repository;

  GetAllPeriodUsecaseImpl({required this.repository});

  @override
  Future<List<Task>> call() async {
    try {
      return repository.getAllTaks();
    } on PeriodException {
      rethrow;
    }
  }
}
