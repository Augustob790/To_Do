import 'package:flutter_modular/flutter_modular.dart';
import 'modules/data/repositories/task_repository.dart';
import 'modules/domain/usecases/delete_task.dart';
import 'modules/domain/usecases/get_all_task.dart';
import 'modules/domain/usecases/insert_task.dart';
import 'modules/domain/usecases/update_task.dart';
import 'modules/presentation/bloc/task_bloc.dart';
import 'modules/presentation/controller/home_page_controller.dart';
import 'modules/presentation/pages/home_page.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<TaskRepository>(TaskRepositoryImpl.new);
    i.addLazySingleton<GetAllTaskUsecase>(GetAllTaskUsecaseImpl.new);
    i.addLazySingleton<DeleteTaskUsecase>(DeleteTaskUsecaseImpl.new);
    i.addLazySingleton<InsertTaskUsecase>(InsertTaskUsecaseImpl.new);
    i.addLazySingleton<UpdateTaskUsecase>(UpdateTaskUsecaseImpl.new);
    i.add(TaskBloc.new);
    i.add(HomePageController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const NoteListScreen());
  }
}
