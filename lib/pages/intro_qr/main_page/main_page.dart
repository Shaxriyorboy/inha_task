import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inha_task/pages/intro_qr/views/main_body.dart';
import 'package:inha_task/pages/intro_qr/views/main_footer.dart';
import 'main_vm.dart';

final mainQrNotifier = ChangeNotifierProvider((ref) => MainVM());

class MainQrPage extends StatelessWidget {
  const MainQrPage({Key? key}) : super(key: key);

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
