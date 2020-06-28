import 'package:flutter/material.dart';

class SeedProvider extends ChangeNotifier {
  int seeds = 42;

  void increase(int value) {
    seeds += value;

    notifyListeners();
  }

  void decrease(int value) {
    seeds -= value;
    notifyListeners();
  }

  bool isEnoughSeed(int value) {
    if (value > seeds) {
      return false;
    }

    return true;
  }
}
