import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inha_task/pages/waiting_pages/waiting_vm.dart';

import 'waiting_views.dart';

final waitingNotifier = ChangeNotifierProvider((ref) => WaitingVM());

class WaitingPage extends ConsumerStatefulWidget {
  const WaitingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<WaitingPage> createState() => _WaitingPageState();
}

class _WaitingPageState extends ConsumerState<WaitingPage> {
  @override
  void initState() {
    super.initState();
    ref.read(waitingNotifier).changeValue();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(waitingNotifier.select((value) => value.isRed));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 192.h,left: 20.w,right: 30.w),
        width: 1.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: const [
                TimeContainer(),
                CustomIndicator(),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            const AnimatedIndicator(),
            SizedBox(height: 30.h,),
            const CustomTitle(),
            SizedBox(height: 5.h,),
            const CustomSubtitle(),
            Spacer(),
            ref.read(waitingNotifier).isRed?const CustomTextButton():const SizedBox.shrink(),
            SizedBox(height: 20.h,),
          ],
        ),
      ),
    );
  }
}






