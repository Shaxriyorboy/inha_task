import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inha_task/pages/intro_pages/views/background_image.dart';
import 'package:inha_task/pages/intro_pages/views/text_widget.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
              BackgroundImage(image: "assets/images/first_im.png"),
              TextWidget(
                  title: "Приобретайте в рассрочку с ZPAY менее чем за 2 минуты",
                  subTitle:
                  "Покупайте сейчас и платите равными частями в срок до 6 месяцев! Пройдите быструю регистрацию, имея только Паспорт и платежную карту ",),
            ],
          ),
        ),
      ),
    );
  }
}
