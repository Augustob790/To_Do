// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/modules/domain/model/task.dart';
import '../../../core/widgets/card_tile.dart';
import '../controller/controller.dart';
import '../../../core/widgets/add_new_task.dart';
import 'add/add_screen.dart';
import 'edit/edit_modal_screen.dart';
import '../../../core/widgets/manrope.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<TaskListPage> {
  @override
  void initState() {
    super.initState();
    final controller = Provider.of<Controller>(context, listen: false);
    controller.getAllTaks();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(builder: (context, controller, child) {
      final tasksList = controller.tasks;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: Align(
            alignment: Alignment.topLeft,
            child: const Manrope(
              text: 'To Do',
              size: 30,
              color: Colors.white,
            ),
          ), 
        ),
        backgroundColor: Colors.grey.shade900,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                  shrinkWrap: true,
                  itemCount: tasksList.length,
                  itemBuilder: (context, index) {
                    final tasks = tasksList[index];
                    return CardTile(
                      task: tasks,
                      controller: controller,
                      isCompleted: tasks.isDone,
                      onChanged: (value) {
                        controller.isDone(index);
                      },
                      onDelete: () {
                        controller.onDismissed(index);
                      },
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => EditTaskScreen(
                              task: tasks,
                              controller: controller,
                              add: () async {
                                if (controller
                                    .titleController.text.isNotEmpty) {
                                  await controller.insert(
                                    Task(
                                      title: controller.titleController.text,
                                      description:
                                          controller.descriptionController.text,
                                      dataInit:
                                          controller.dateInit.toIso8601String(),
                                    ),
                                  );
                                  await controller.getAllTaks();
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: AddNewTaskButton(
          onTap: () {
            controller.inicialize();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => AddTaskScreen(
                  controller: controller,
                  add: () async {
                    if (controller.titleController.text.isNotEmpty) {
                      await controller.insert(
                        Task(
                            title: controller.titleController.text,
                            description: controller.descriptionController.text,
                            dataInit: controller.dateInit.toIso8601String()),
                      );
                      await controller.getAllTaks();
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
