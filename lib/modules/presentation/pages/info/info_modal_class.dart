// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../../../domain/model/task.dart';
import '../../controller/home_page_controller.dart';
import '../edit/edit_modal_class.dart';
import 'widget/info_modal.dart';

class InfoNewTaskClass {
  init({
    required BuildContext context,
    required HomePageController controller,
    required Task task,
  }) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            scrollable: true,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            contentPadding: const EdgeInsets.all(0),
            content: InfoTask(
              title: task.title,
              description: task.description,
              excluir: () async {
                controller.delete(task.id!);
                Navigator.pop(context);
                controller.getAllTaks();
              },
              editar: () async {
                Navigator.pop(context);
                controller.titleController.text = task.title;
                controller.descriptionController.text = task.description;
                EditNewTaskClass().init(
                    context: context, id: task.id, controller: controller);
              },
            ));
      },
    );
  }
}
