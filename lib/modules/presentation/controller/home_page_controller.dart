import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../../domain/model/task.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/get_all_task.dart';
import '../../domain/usecases/insert_task.dart';
import '../../domain/usecases/update_task.dart';

class HomePageController extends ChangeNotifier {
  final GetAllPeriodUsecase getAllPeriodUsecase;
  final DeletePeriodUsecase deletePeriodUsecase;
  final InsertPeriodUsecase insertPeriodUsecase;
  final UpdatePeriodUsecase updatePeriodUsecase;

  HomePageController({
    required this.getAllPeriodUsecase,
    required this.deletePeriodUsecase,
    required this.insertPeriodUsecase,
    required this.updatePeriodUsecase,
  });

  final TextEditingController titleController = TextEditingController();
  final TextEditingController meta1 = TextEditingController();
  final TextEditingController meta2 = TextEditingController();
  late Database db;
  static const String tableName = 'notes';
  String dropdownCategoryValue = "Categoria";
  DateTime dateFinal = DateTime.now();
  DateTime dateInit = DateTime.now();
  List<String> categoria = [
    'Categoria',
    'Categoria 1',
    'Categoria 2',
    'Categoria 3',
    'Categoria 4',
    'Categoria 5',
    'Categoria 6',
  ];
  List<Task> periods = [];

  inicialize() {
    titleController.text = "";
    meta1.text = "";
    meta2.text = "";
    dropdownCategoryValue = "Categoria";
    dateInit = DateTime.now();
    dateFinal = DateTime.now();
  }

  onSelectedCategory(String category) {
    dropdownCategoryValue = category;
    notifyListeners();
  }

  initializeInit(DateTime dateTime) async {
    dateInit = dateTime;
    notifyListeners();
  }

  initializeFinal(DateTime dateTime) async {
    dateFinal = dateTime;
    notifyListeners();
  }

  insert(Task task) async {
    try {
      await insertPeriodUsecase(task);
    } catch (e) {
      throw e.toString();
    }
    notifyListeners();
  }

  getAllTaks() async {
    try {
      periods = await getAllPeriodUsecase();
    } catch (e) {
      throw e.toString();
    }
    notifyListeners();
  }

  update(Task task) async {
    try {
      await updatePeriodUsecase(task);
    } catch (e) {
      throw e.toString();
    }
    notifyListeners();
  }

  delete(int id) async {
    try {
      await deletePeriodUsecase(id);
    } catch (e) {
      throw e.toString();
    }
    notifyListeners();
  }
}
