// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/modules/presentation/widgets/todo_tile.dart';
import '../../../core/const/api.dart';
import '../bloc/bloc_task.dart';
import '../bloc/task_events.dart';
import '../bloc/task_states.dart';
import '../controller/home_page_controller.dart';
import '../widgets/add_new_task.dart';
import 'add/add_modal_class.dart';
import 'info/info_modal_class.dart';
import '../widgets/manrope.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<TaskListPage> {
  final controller = Modular.get<HomePageController>();

  late final TaskFlutterBloc bloc;

  @override
  void initState() {
    super.initState();
    Apis();
    bloc = TaskFlutterBloc();
    bloc.add(LoadTaskEvents());
    controller.getAllTaks();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }


  late List<bool> _isCheckedList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Center(
          child: const Manrope(
            text: "TO DO",
            color: Color.fromARGB(255, 12, 11, 11),
            font: FontWeight.w500,
            size: 22,
          ),
        ),
      ),
      body: BlocBuilder<TaskFlutterBloc, TaskState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is TaskInitialState) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              ));
            } else if (state is TasksLoadSucessState) {
              final tasksList = state.tasks;
              return ListView.builder(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                shrinkWrap: true,
                itemCount: tasksList.length,
                itemBuilder: (context, index) {
                  final tasks = tasksList[index];
                  return ToDoTile(
                    task: tasks,
                    onTap: () async {
                      InfoNewTaskClass().init(
                        context: context,
                        controller: controller,
                        task: tasks,
                        bloc: bloc,
                      );
                    },
                  );
                },
              );
            } else {
              return Container();
            }
          }),
      floatingActionButton: AddNewTaskButton(
        onTap: () async {
          controller.inicialize();
          AddNewTaskClass()
              .init(context: context, controller: controller, bloc: bloc);
        },
      ),
    );
  }
}
