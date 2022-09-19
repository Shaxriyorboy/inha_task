import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inha_task/pages/intro_pages/main_page/main_page.dart';
import 'package:inha_task/services/di_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 762),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) => GetMaterialApp(
        title: 'Introduction',
        theme: ThemeData(fontFamily: "Mont"),
        debugShowCheckedModeBanner: false,
        initialBinding: DIService(),
        home: const MainPage(),
      ),
    );
  }
}
