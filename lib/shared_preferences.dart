import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static String worldCount = 'worldCount';

// Write DATA
  static Future<bool> setWorldCount(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setInt(worldCount, value);
  }

// Read Data
  static Future getWorldCount() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(worldCount);
  }
}
