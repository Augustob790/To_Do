
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/data/repositories/period_repository.dart';
import 'modules/domain/usecases/delete_period.dart';
import 'modules/domain/usecases/get_all_period.dart';
import 'modules/domain/usecases/insert_period.dart';
import 'modules/domain/usecases/update_period.dart';
import 'modules/presentation/bloc/period_bloc.dart';
import 'modules/presentation/controller/home_page_controller.dart';
import 'modules/presentation/pages/home_page.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<PeriodRepository>(PeriodRepositoryImpl.new);
    i.addLazySingleton<GetAllPeriodUsecase>(GetAllPeriodUsecaseImpl.new);
    i.addLazySingleton<DeletePeriodUsecase>(DeletePeriodUsecaseImpl.new);
    i.addLazySingleton<InsertPeriodUsecase>(InsertPeriodUsecaseImpl.new);
    i.addLazySingleton<UpdatePeriodUsecase>(UpdatePeriodUsecaseImpl.new);
    i.add(PeriodBloc.new);
    i.add(HomePageController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const NoteListScreen());
  }
}
