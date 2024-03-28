import 'package:dio/dio.dart';
import 'package:sqflite/sqlite_api.dart';
import '../../domain/model/ period_model.dart';
import '../helpers/database_helper.dart';

abstract class PeriodRepository {
  Future<List<Period>> getAllPeriods();
  Future<void> addPeriod(Period period);
  Future<void> updatePeriod(Period period);
  Future<void> deletePeriod(int id);
  // Future<void> testeDatabase(String title);
}

class PeriodRepositoryImpl implements PeriodRepository {
  String tableName = DB.instance.tableName;
  late Database _database;
  Dio dio = Dio();

  @override
  Future<List<Period>> getAllPeriods() async {
    _database = await DB.instance.database;

    try {
      final List<Map<String, dynamic>> maps = await _database.query(tableName);
      List<Period> periods = List.generate(maps.length, (i) {
        return Period.fromMap(maps[i]);
      });
      return periods;
    } catch (e) {
      throw Exception("Error retrieving periods: $e");
    }
  }

  @override
  Future<void> addPeriod(Period period) async {
    try {
      _database = await DB.instance.database;
      await _database.insert(tableName, period.toMap());
    } catch (e) {
      throw Exception("Error insert period: $e");
    }
  }

  @override
  Future<void> updatePeriod(Period period) async {
    try {
      _database = await DB.instance.database;
      await _database.update(
        tableName,
        period.toMap(),
        where: 'id = ?',
        whereArgs: [period.id],
      );
    } catch (e) {
      throw Exception("Error updating period: $e");
    }
  }

  @override
  Future<void> deletePeriod(int id) async {
    try {
      _database = await DB.instance.database;
      await _database.delete(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
      //usar essa url para update
      // String url =
      //     "https://task-c8b0a-default-rtdb.firebaseio.com/period/${"name"}.json";
      // Map params = {
      //   "title": "Teste do DataBase",
      // };
      // await dio.delete(url);
    } catch (e) {
      throw Exception("Error deleting period: $e");
    }
  }

  // @override
  // Future<void> testeDatabase(String title) async {
  //   String url = "https://task-c8b0a-default-rtdb.firebaseio.com/period.json";
  //   Map params = {
  //     "tile": "Teste do DataBase",
  //   };
  //   try {
  //     await dio.post(url, data: params);
  //   } on DioException catch (e) {
  //     if (e.type == DioExceptionType.connectionTimeout ||
  //         e.type == DioExceptionType.receiveTimeout) {
  //       throw "Por favor, verifique sua conexão e tente novamente.";
  //     } else if (e.type == DioExceptionType.connectionError) {
  //       throw "Erro de conexão: $e";
  //     } else {
  //       throw e.toString();
  //     }
  //   } catch (e) {
  //     throw Exception("Error deleting period: $e");
  //   }
  // }
}
