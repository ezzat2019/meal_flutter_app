import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  int radio_value = 0;
  Color currentColorPrimary = Colors.pink;
  Color currentColorAccent = Colors.amberAccent;

  void sercurrentColorPrimary(Color color) async {
    currentColorPrimary = color;

    notifyListeners();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("a_color", currentColorPrimary.value);
  }

  void seThemeMode(ThemeMode themeMode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    this.themeMode = themeMode;
    if (themeMode == ThemeMode.system) {
      sharedPreferences.setString("theme_mode", "sys");
    } else if (themeMode == ThemeMode.light) {
      sharedPreferences.setString("theme_mode", "light");
    } else if (themeMode == ThemeMode.dark) {
      sharedPreferences.setString("theme_mode", "dark");
    }

    notifyListeners();
  }

  void getPrefColor() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey("a_color")) {
      int a_color = sharedPreferences.getInt("a_color");
      currentColorPrimary = Color(a_color);
    } else if (sharedPreferences.containsKey("b_color")) {
      int b_color = sharedPreferences.getInt("b_color");
      currentColorAccent = Color(b_color);
    }
  }

  void getModePref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String mode = sharedPreferences.getString("theme_mode") ?? "sys";
    if (mode == "sys") {
      themeMode = ThemeMode.system;
      radio_value = 0;
    } else if (mode == "light") {
      themeMode = ThemeMode.light;
      radio_value = 1;
    } else if (mode == "dark") {
      themeMode = ThemeMode.dark;
      radio_value = 2;
    }
  }

  void setcurrentColorAccent(Color color) async {
    currentColorAccent = color;
    notifyListeners();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("b_color", currentColorAccent.value);
  }

  void serRaidoValue(int val) {
    radio_value = val;
    notifyListeners();
  }
}
