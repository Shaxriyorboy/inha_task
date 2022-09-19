import 'package:flutter/material.dart';
import 'package:inha_task/pages/intro_pages/first_page/first_page.dart';
import 'package:inha_task/pages/intro_pages/fourth_page/fourth_page.dart';
import 'package:inha_task/pages/intro_pages/main_page/main_controller.dart';
import 'package:inha_task/pages/intro_pages/second_page/second_page.dart';
import 'package:inha_task/pages/intro_pages/third_page/third_page.dart';
class MainBody extends StatelessWidget {
  const MainBody({Key? key,required this.controller}) : super(key: key);
  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        physics: const BouncingScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.changeIndex(index);
        },
        children: const [
          FirstPage(),
          SecondPage(),
          ThirdPage(),
          FourthPage(),
        ],
      ),
    );
  }
}
