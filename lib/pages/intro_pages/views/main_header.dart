import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inha_task/pages/intro_pages/main_page/main_controller.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({Key? key,required this.controller}) : super(key: key);
  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide.none),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {
          controller.moveToNextPage();
        },
        child: Text(
          "Пропустить",
          style: TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.w700,decoration: TextDecoration.underline,),
        ));
  }
}
