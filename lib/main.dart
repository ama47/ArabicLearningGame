import 'package:flutter/material.dart';
import 'package:arabic_learning_game/views/main_menu_view.dart';
import 'package:arabic_learning_game/db_servieces.dart';
import 'package:shared_preferences/shared_preferences.dart';

late DatabaseService databaseService;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  databaseService = DatabaseService();
  await databaseService.prepareDatabases();
  setInitialWorldValue();
  runApp(const MyApp());
}

void setInitialWorldValue() async {
  final prefs = await SharedPreferences.getInstance();
  if (!prefs.containsKey('worldCount')) {
    await prefs.setInt('worldCount', 110);
  }
}
