import '../../data/repositories/task_repository.dart';
import '../exception/task_exception.dart';
import '../model/task.dart';

abstract class InsertPeriodUsecase {
  Future<void> call(Task task);
}

class InsertPeriodUsecaseImpl implements InsertPeriodUsecase {
  final TaskRepository repository;

  InsertPeriodUsecaseImpl({required this.repository});

  @override
  Future<void> call(Task task) async {
    try {
      return repository.addPeriod(task);
    } on PeriodException {
      rethrow;
    }
  }
}
