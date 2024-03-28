// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../../../domain/model/task.dart';
import '../../bloc/bloc_task.dart';
import '../../bloc/task_events.dart';
import '../../controller/home_page_controller.dart';
import '../edit/edit_modal_class.dart';
import 'widget/info_modal.dart';

class InfoNewTaskClass {
  init({
    required BuildContext context,
    required HomePageController controller,
    required Task task,
    required TaskFlutterBloc bloc,
  }) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            scrollable: true,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            contentPadding: const EdgeInsets.all(0),
            content: InfoTask(
              controller: controller,
              excluir: () async {
                bloc.add(DeleteTaskEvents(id: task.id!));
                Navigator.pop(context);
                bloc.add(LoadTaskEvents());
              },
              editar: () async {
                Navigator.pop(context);
                controller.titleController.text = task.title;
                EditNewTaskClass().init(
                    context: context,
                    id: task.id,
                    controller: controller,
                    bloc: bloc);
              },
            ));
      },
    );
  }
}
