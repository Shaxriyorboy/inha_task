import 'dart:async';

import 'package:flutter/material.dart';

class WaitingVM extends ChangeNotifier {
  double value = 1.0;
  int time = 60;
  bool isRed = false;
  double index = 0;
  PageController pageController = PageController();

  changeValue() {
    Timer.periodic(const Duration(milliseconds: 15), (timer) {
      value = value - 1/(60000/15);
      notifyListeners();
      if(value < 0){
        timer.cancel();
      }
    });

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if(timer.tick !=1){
        time = time - 1;
        notifyListeners();
      }
      index = timer.tick % 3;
      notifyListeners();

      if(timer.tick == 61){
        isRed = true;
        notifyListeners();
        timer.cancel();
      }
    });
  }
}
