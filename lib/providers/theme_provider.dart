import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  int radio_value = 0;
  Color currentColorPrimary = Colors.pink;
  Color currentColorAccent = Colors.amberAccent;
  bool switch_lan = false;

  Map<String, String> mapAr = {
    "d_title": "عالم الطبخ",
    "d_meal": "الوجبات",
    "d_filter": "التصنيف المخصص",
    "d_theme": "شكل التطبيق",
    "d_arabic": "العربية",
    "d_englis": "الانجليزيه",
    "c_app_bar": "الوجبات",
    "c_cat": "التصنيفات",
    "c_fav": "المفضلة",
  };
  Map<String, String> mapEn = {
    "d_title": "Cooking Up!",
    "c_app_bar": "Meal Category!",
    "c_cat": "Categories",
    "c_fav": "My favourites",
    "d_meal": "Meal",
    "d_filter": "Filters",
    "d_theme": "Theme",
    "d_arabic": "Arabic",
    "d_englis": "English",
  };

  void setSwitchLAn(bool switch_lan) async {
    this.switch_lan = switch_lan;
    notifyListeners();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("is_en", switch_lan);
  }

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
    notifyListeners();
  }

  void getFavLan() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool switch_lan2 = sharedPreferences.getBool("is_en") ?? false;
    switch_lan = switch_lan2;
    notifyListeners();
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
    notifyListeners();
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
