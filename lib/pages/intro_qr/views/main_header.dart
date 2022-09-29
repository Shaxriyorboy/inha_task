import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../main_page/main_page.dart';

class MainHeader extends ConsumerWidget {
  const MainHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    ref.watch(mainQrNotifier.select((value) => value.pageIndex));
    return Row(
      children: [
        const Spacer(),
        ref.read(mainQrNotifier).pageIndex!=2?TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
              side: MaterialStateProperty.all(BorderSide.none),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {},
            child: Text(
              "Пропустить",
              style: TextStyle(
                fontSize: 16.sp, fontWeight: FontWeight.w700,decoration: TextDecoration.underline,),
            )):const SizedBox.shrink(),
      ],
    );
  }
}
