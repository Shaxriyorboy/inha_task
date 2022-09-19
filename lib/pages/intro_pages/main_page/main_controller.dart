import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController{
  PageController pageController = PageController();
  int pageIndex = 0;

  void moveToNextPage(){
    pageIndex==3?pageIndex:pageIndex++;
    update();
    pageIndex!=4?pageController.jumpToPage(pageIndex):null;
  }

  void changeIndex(int index){
    pageIndex = index;
    update();
  }
}