import 'dart:math';

import 'package:flutter/material.dart';
import '../../../core/const/colors.dart';
import '../../domain/model/task.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/get_all_task.dart';
import '../../domain/usecases/insert_task.dart';
import '../../domain/usecases/update_task.dart';

class Controller extends ChangeNotifier {
  final GetAllTaskUsecase getAllTaskUsecase;
  final DeleteTaskUsecase deleteTaskUsecase;
  final InsertTaskUsecase insertTaskUsecase;
  final UpdateTaskUsecase updateTaskUsecase;

  Controller({
    required this.getAllTaskUsecase,
    required this.deleteTaskUsecase,
    required this.insertTaskUsecase,
    required this.updateTaskUsecase,
  });

  DateTime dateInit = DateTime.now();
  List<Task> tasks = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();


  getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  void isDone(int index) {
    tasks[index].isDone = !tasks[index].isDone;
    update(tasks[index]);
    notifyListeners();
  }

  void onDismissed(int index) {
    delete(tasks[index].id!);
    tasks.removeAt(index);
    notifyListeners();
  }

  inicialize() {
    titleController.text = "";
    descriptionController.text = "";
    dateInit = DateTime.now();
  }

  insert(Task task) async {
    try {
      await insertTaskUsecase(task);
    } catch (e) {
      throw e.toString();
    }
    notifyListeners();
  }

  getAllTaks() async {
    try {
      tasks = await getAllTaskUsecase();
    } catch (e) {
      throw e.toString();
    }
    notifyListeners();
  }

  update(Task task) async {
    try {
      await updateTaskUsecase(task);
    } catch (e) {
      throw e.toString();
    }
    notifyListeners();
  }

  delete(int id) async {
    try {
      await deleteTaskUsecase(id);
    } catch (e) {
      throw e.toString();
    }
    notifyListeners();
  }
}
