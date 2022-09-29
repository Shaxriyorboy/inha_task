import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inha_task/pages/intro_qr/views/background_image.dart';
import 'package:inha_task/pages/intro_qr/views/text_widget.dart';

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
          padding: EdgeInsets.only(top: 130.h),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: const [
              BackgroundImage(image: "assets/images/first_qr_im.png"),
              TextWidget(
                  title: "Добавление карты",
                  subTitle:
                  "Для начала начисления Кешбека вам необходимо добавить в нашу платежную систему ваши карты еще раз.",),
            ],
          ),
        ),
      ),
    );
  }
}
