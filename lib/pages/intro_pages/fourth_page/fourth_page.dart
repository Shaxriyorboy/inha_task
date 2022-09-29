import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inha_task/pages/intro_pages/views/background_image.dart';
import 'package:inha_task/pages/intro_pages/views/text_widget.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BounceInDown(
        duration: const Duration(seconds: 1),
        child: Padding(
          padding: EdgeInsets.only(top: 130.h),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: const [
              BackgroundImage(image: "assets/images/fourth_im.png"),
              TextWidget(
                  title: "Просматривайте и управляйте своими покупками!",
                  subTitle:
                      "Просматривайте свои прошлые и текущие договора, и платежи. Управляйте своими данными в едином приложении"),
            ],
          ),
        ),
      ),
    );
  }
}
