import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool isDartTheme = false;
  changeTheme() {
    isDartTheme = !isDartTheme;
    notifyListeners();
  }
}
