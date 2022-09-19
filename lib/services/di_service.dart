import 'package:get/get.dart';
import 'package:inha_task/pages/intro_pages/main_page/main_controller.dart';

class DIService implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController(),fenix: true);
  }
}