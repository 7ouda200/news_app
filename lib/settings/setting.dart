import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';


class settingsProvider with ChangeNotifier {
  String language = 'en';
  // SharedPreferences? setdata;

  void changeLanguage(String selectedLanguage) {
    language = selectedLanguage;
    //setdata?.setString('lang',language);
    notifyListeners();
  }
}
