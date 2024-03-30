// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../../../domain/model/task.dart';
import '../../controller/home_page_controller.dart';
import 'widget/add_modal.dart';

class AddNewTaskClass {
  init({
    required BuildContext context,
    required HomePageController controller,
  }) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          contentPadding: const EdgeInsets.all(0),
          content: AddNewTask(
              controller: controller,
              add: () async {
                final Task task = Task(
                    title: controller.titleController.text,
                    description: controller.descriptionController.text,
                    dataInit: controller.dateInit.toIso8601String());

                if (controller.titleController.text.isNotEmpty) {
                  await controller.insert(task);
                  await controller.getAllTaks();
                  Navigator.pop(context);
                }
              }),
        );
      },
    );
  }
}
