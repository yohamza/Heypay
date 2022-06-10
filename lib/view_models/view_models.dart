import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewModel extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;
  Future<bool?> getPrefBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.reload();
    return prefs.getBool(key);
  }

  setPrefBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
    prefs.reload();
  }

  setToDark() async {
    await getPrefBool('isDark').then((value) => _isDark = value ?? false);
    notifyListeners();
  }
}
