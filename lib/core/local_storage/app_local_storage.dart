
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  // Save data to local storage

  static const String jwt = "jwt";
  Future<void> saveData(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  // Delete data from local storage
  Future<void> deleteData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  // Read data from local storage
  Future<String?> readData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  // Update data in local storage
  Future<void> updateData(String key, String value) async {
    await saveData(key, value);
  }
}
