// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../../../domain/model/task.dart';
import '../../bloc/bloc_task.dart';
import '../../bloc/task_events.dart';
import '../../controller/home_page_controller.dart';
import 'widget/edit_modal.dart';

class EditNewTaskClass {
  init({
    required BuildContext context,
    required HomePageController controller,
    required int? id,
    // required TaskBloc bloc,
    required TaskFlutterBloc bloc,
  }) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          contentPadding: const EdgeInsets.all(0),
          content: EditNewTask(
              controller: controller,
              add: () async {
                if (controller.titleController.text.isNotEmpty &&
                    controller.dropdownCategoryValue.isNotEmpty) {
                  bloc.add(UpdateTaskEvents(
                      task: Task(
                    id: id,
                    title: controller.titleController.text,
                  )));
                }
                bloc.add(LoadTaskEvents());
                Navigator.pop(context);
              }),
        );
      },
    );
  }
}
