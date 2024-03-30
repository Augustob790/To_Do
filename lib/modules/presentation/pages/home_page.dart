// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/modules/presentation/widgets/todo_tile.dart';
import '../../../core/const/api.dart';
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
  @override
  void initState() {
    super.initState();
    final controller = Provider.of<HomePageController>(context, listen: false);
    controller.getAllTaks();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageController>(
    builder: (context, controller, child) {
      final tasksList = controller.tasks;
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
        body: ListView.builder(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
          shrinkWrap: true,
          itemCount: tasksList.length,
          itemBuilder: (context, index) {
            final tasks = tasksList[index];
            return ToDoTile(
            controller: controller,
              task: tasks,
              onTap: () async {
                InfoNewTaskClass().init(
                  context: context,
                  controller: controller,
                  task: tasks,
                );
              },
            );
          },
        ),
        floatingActionButton: AddNewTaskButton(
          onTap: () async {
            controller.inicialize();
            AddNewTaskClass().init(context: context, controller: controller);
          },
        ),
      );
    });
  }
}
