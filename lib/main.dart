import 'package:flutter/material.dart';
import 'package:arabic_learning_game/views/main_menu_view.dart';
import 'package:arabic_learning_game/db_servieces.dart';

late DatabaseService databaseService;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  databaseService = DatabaseService();
  await databaseService.prepareDatabases();
  runApp(const MyApp());
}
