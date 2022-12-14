import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inha_task/pages/intro_pages/views/main_body.dart';
import 'package:inha_task/pages/intro_pages/views/main_footer.dart';
import 'main_vm.dart';

final mainNotifier = ChangeNotifierProvider((ref) => MainVM());

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: const [
                MainBody(),
                MainFooter(),
              ],
            ),
          );
  }
}
