import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectMenuOpt = 0;

  int get selectMenuOpt {
    return _selectMenuOpt;
  }

  set selectMenuOpt(int i) {
    _selectMenuOpt = i;
    notifyListeners();
  }
}
