import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inha_task/pages/intro_pages/main_page/main_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainFooter extends StatelessWidget {
  const MainFooter({Key? key,required this.controller}) : super(key: key);
  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 1.sw,
      margin: EdgeInsets.only(
          left: 24.w, right: 24.w, top: 15.h, bottom: 28.h),
      child: controller.pageIndex != 3
          ? Row(
        children: [
          SmoothPageIndicator(
            controller: controller.pageController,
            count: 4,
            effect: ExpandingDotsEffect(
                activeDotColor: Colors.blue.shade800,
                dotColor: Colors.grey.shade400,
                dotHeight: 6.h,
                dotWidth: 6.h,
                spacing: 4.w),
          ),
          const Spacer(),
          GestureDetector(
            onTap: (){
              controller.moveToNextPage();
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
          ),
        ],
      )
          : MaterialButton(
        height: 50.h,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            backgroundColor: Colors.black.withOpacity(0.5),
            margin: EdgeInsets.all(20.r),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
              content: const Text("E'tiboringiz uchun raxmat")
          ));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        color: const Color(0xFF1D44CB),
        child: Text(
          "Пройти регистрацию",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
