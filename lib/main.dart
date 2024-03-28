
// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app_module.dart';
import 'app_widget.dart';


void main() async {
  await dotenv.load();
  await initializeDateFormatting();
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}


