import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inha_task/pages/intro_pages/views/background_image.dart';
import 'package:inha_task/pages/intro_pages/views/text_widget.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
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
              BackgroundImage(image: "assets/images/third_im.png"),
              TextWidget(
                  title: "Наслаждайтесь  вашей покупкой с приятными бонусами от ZPAY",
                  subTitle:
                  "Совершайте покупки у наших партнеров и с приятным кешбеком от ZPAY",),
            ],
          ),
        ),
      ),
    );
  }
}
