import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inha_task/pages/intro_qr/first_page/first_page.dart';
import 'package:inha_task/pages/intro_qr/second_page/second_page.dart';
import 'package:inha_task/pages/intro_qr/third_page/third_page.dart';
import '../main_page/main_page.dart';

class MainBody extends ConsumerWidget {
  const MainBody({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return PageView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      controller: ref.read(mainQrNotifier).pageController,
      onPageChanged: (index) {
        ref.read(mainQrNotifier).changeIndex(index);
      },
      children: const [
        FirstPage(),
        SecondPage(),
        ThirdPage(),
      ],
    );
  }
}
