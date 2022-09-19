import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inha_task/pages/intro_pages/views/background_image.dart';
import 'package:inha_task/pages/intro_pages/views/text_widget.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BounceInDown(
        duration: const Duration(seconds: 1),
        child: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: const [
              BackgroundImage(image: "assets/images/second_im.png"),
              TextWidget(
                  title: "Откройте для себя множество партнерских магазинов с товарами именно для вас",
                  subTitle:
                  "Находите магазины по категориям, локациям и вдохновляйтесь на новые покупки!",),
            ],
          ),
        ),
      ),
    );
  }
}
