import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/repositories/task_repository.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/get_all_task.dart';
import '../../domain/usecases/insert_task.dart';
import '../../domain/usecases/update_task.dart';
import '../controller/home_page_controller.dart';

class DependecyInjectionsProvider extends StatelessWidget {
  final Widget? child;
  const DependecyInjectionsProvider({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TaskRepository>(
          create: (_) => TaskRepositoryImpl(),
        ),
        Provider<GetAllTaskUsecase>(
            create: (context) => GetAllTaskUsecaseImpl(
                repository: context.read<TaskRepository>())),
        Provider<InsertTaskUsecase>(
          create: (context) =>
              InsertTaskUsecaseImpl(repository: context.read<TaskRepository>()),
        ),
        Provider<UpdateTaskUsecase>(
          create: (context) =>
              UpdateTaskUsecaseImpl(repository: context.read<TaskRepository>()),
        ),
        Provider<DeleteTaskUsecase>(
          create: (context) =>
              DeleteTaskUsecaseImpl(repository: context.read<TaskRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) => HomePageController(
            getAllTaskUsecase: context.read<GetAllTaskUsecase>(),
            insertTaskUsecase: context.read<InsertTaskUsecase>(),
            updateTaskUsecase: context.read<UpdateTaskUsecase>(),
            deleteTaskUsecase: context.read<DeleteTaskUsecase>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
