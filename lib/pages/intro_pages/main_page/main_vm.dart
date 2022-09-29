import 'package:flutter/material.dart';

class MainVM extends ChangeNotifier{
  PageController pageController = PageController();
  int pageIndex = 0;

  void moveToNextPage(){
    pageIndex==3?pageIndex:pageIndex++;
    notifyListeners();
    pageIndex!=4?pageController.jumpToPage(pageIndex):null;
  }

  void changeIndex(int index){
    pageIndex = index;
    notifyListeners();
  }
}