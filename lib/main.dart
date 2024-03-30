// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'core/const/api.dart';
import 'modules/presentation/pages/home_page.dart';
import 'modules/presentation/provider/dependency_injections.provider.dart';

void main() async {
  await dotenv.load();
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {

@override
void initState() {
  super.initState();
      Apis();

}

  @override
  Widget build(BuildContext context) {
    return DependecyInjectionsProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TO DO',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const TaskListPage(),
      ),
    );
  }
}
