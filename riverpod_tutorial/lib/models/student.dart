import 'package:flutter/material.dart';

class Student extends ChangeNotifier {
  int counter;
  Student({required this.counter});

  void addC() {
    counter++;
    notifyListeners();
  }

  void removeC() {
    counter--;
    notifyListeners();
  }

  void changeTheValue(int newValue) {
    counter = newValue;
    notifyListeners();
  }
}
