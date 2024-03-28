import '../../data/repositories/task_repository.dart';
import '../exception/task_exception.dart';
import '../model/task.dart';

abstract class UpdatePeriodUsecase {
  Future<void> call(Task task);
}

class UpdatePeriodUsecaseImpl implements UpdatePeriodUsecase {
  final TaskRepository repository;

  UpdatePeriodUsecaseImpl({required this.repository});

  @override
  Future<void> call(Task task) async {
    try {
      return repository.updatePeriod(task);
    } on PeriodException {
      rethrow;
    }
  }
}
