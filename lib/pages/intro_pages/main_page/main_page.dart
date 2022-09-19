import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:inha_task/pages/intro_pages/main_page/main_controller.dart';
import 'package:inha_task/pages/intro_pages/views/main_body.dart';
import 'package:inha_task/pages/intro_pages/views/main_footer.dart';
import 'package:inha_task/pages/intro_pages/views/main_header.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
              actions: [
                MainHeader(controller: controller),
              ],
            ),
            body: Column(
              children: [
                MainBody(controller: controller),
                MainFooter(controller: controller),
              ],
            ),
          );
        });
  }
}
