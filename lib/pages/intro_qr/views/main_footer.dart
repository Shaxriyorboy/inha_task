import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../main_page/main_page.dart';
import 'main_header.dart';

class MainFooter extends ConsumerWidget {
  const MainFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(mainQrNotifier.select((value) => value.pageIndex));
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 45.h),
      child: Column(
        children: [
          const MainHeader(),
          const Spacer(),
          Container(
            height: 60.h,
            width: 1.sw,
            margin: EdgeInsets.only(top: 15.h, bottom: 28.h),
            child: ref.read(mainQrNotifier).pageIndex != 2
                ? Row(
                    children: const [
                      CustomIndicator(),
                      Spacer(),
                      FloatButton(),
                    ],
                  )
                : const CustomButton(),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50.h,
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.black.withOpacity(0.5),
            margin: EdgeInsets.all(20.r),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
            content: const Text("E'tiboringiz uchun raxmat")));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      color: const Color(0xFF1D44CB),
      child: Text(
        "Добавить карту",
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

class FloatButton extends ConsumerWidget {
  const FloatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(mainQrNotifier).moveToNextPage();
      },
      child: Container(
        height: 60.h,
        width: 60.h,
        decoration: BoxDecoration(
            color: const Color(0xFFBAD0FF),
            borderRadius: BorderRadius.circular(50.r)),
        child: const Icon(
          Icons.arrow_downward_rounded,
          color: Color(0xFF2740A6),
        ),
      ),
    );
  }
}

class CustomIndicator extends ConsumerWidget {
  const CustomIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SmoothPageIndicator(
      controller: ref.read(mainQrNotifier).pageController,
      count: 3,
      effect: ExpandingDotsEffect(
        expansionFactor: 4,
          activeDotColor: Colors.blue.shade800,
          dotColor: Colors.grey.shade400,
          dotHeight: 6.h,
          dotWidth: 6.h,
          spacing: 4.w),
    );
  }
}
