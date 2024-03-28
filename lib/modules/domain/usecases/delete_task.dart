import '../../data/repositories/task_repository.dart';
import '../exception/task_exception.dart';

abstract class DeletePeriodUsecase {
  Future<void> call(int task);
}

class DeletePeriodUsecaseImpl implements DeletePeriodUsecase {
  final TaskRepository repository;

  DeletePeriodUsecaseImpl({required this.repository});

  @override
  Future<void> call(int id) async {
    try {
      return repository.deletePeriod(id);
    } on PeriodException {
      rethrow;
    }
  }
}
