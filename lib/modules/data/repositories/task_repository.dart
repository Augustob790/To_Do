import 'package:dio/dio.dart';
import '../../../core/const/api.dart';
import '../../domain/model/task.dart';

abstract class TaskRepository {
  Future<List<Task>> getAllTaks();
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(int id);
}

class TaskRepositoryImpl implements TaskRepository {
  late Dio dio = Apis.dio;

  @override
  Future<List<Task>> getAllTaks() async {
    String url = "task";

    try {
      final response = await dio.get(url);
      List<Task> tasks = [];
      if (response.statusCode == Apis.statusCodeSuccess) {
        for (var satisfactionSurvey in response.data) {
          tasks.add(Task.fromMap(satisfactionSurvey));
        }
        return tasks;
      } else {
        throw "Não foi possível carregar a lista de NPS";
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw "Por favor, verifique sua conexão e tente novamente.";
      } else if (e.type == DioExceptionType.connectionError) {
        throw "Erro de conexão: $e";
      } else {
        throw e.toString();
      }
    } catch (e) {
      throw Exception("Error retrieving Tasks: $e");
    }
  }

  @override
  Future<void> addTask(Task task) async {
    try {
      String url = "task";
      await dio.post(url, data: task.toMap());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw "Por favor, verifique sua conexão e tente novamente.";
      } else if (e.type == DioExceptionType.connectionError) {
        throw "Erro de conexão: $e";
      } else {
        throw e.toString();
      }
    } catch (e) {
      throw Exception("Error insert task: $e");
    }
  }

  @override
  Future<void> updateTask(Task task) async {
    String url = "task?id=eq.${task.id}";
    try {
      await dio.patch(url, data: task.toMap());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw "Por favor, verifique sua conexão e tente novamente.";
      } else if (e.type == DioExceptionType.connectionError) {
        throw "Erro de conexão: $e";
      } else {
        throw e.toString();
      }
    } catch (e) {
      throw Exception("Error updating task: $e");
    }
  }

  @override
  Future<void> deleteTask(int id) async {
    String url = "task?id=eq.$id";
    Map params = {"id": 'eq.$id'};
    try {
      await dio.delete(url, data: params);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw "Por favor, verifique sua conexão e tente novamente.";
      } else if (e.type == DioExceptionType.connectionError) {
        throw "Erro de conexão: $e";
      } else {
        throw e.toString();
      }
    } catch (e) {
      throw Exception("Error deleting task: $e");
    }
  }
}
