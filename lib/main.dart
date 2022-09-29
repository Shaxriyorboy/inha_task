import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inha_task/pages/card_scanner_page/card_scanner_page.dart';
import 'package:inha_task/pages/create_pincode_page/create_pin_code_page.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) => MaterialApp(
        title: 'Introduction',
        theme: ThemeData(fontFamily: "Mont"),
        debugShowCheckedModeBanner: false,
        home: const CardScannerPage(),
      ),
    );
  }
}
