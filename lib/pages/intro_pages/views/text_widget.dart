import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key,required this.title,required this.subTitle}) : super(key: key);
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60.h, left: 24.w, right: 24.w),
      alignment: Alignment.bottomCenter,
      height: 220.h,
      width: 1.sw,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.9),
          spreadRadius: 10.h,
          blurRadius: 7.h,
          offset: Offset(0, 4), // changes position of shadow
        ),
        BoxShadow(
          color: Colors.white.withOpacity(0.7),
          spreadRadius: 20.h,
          blurRadius: 10.h,
          offset: Offset(0, 3), // changes position of shadow
        ),
        BoxShadow(
          color: Colors.white.withOpacity(0.5),
          spreadRadius: 30.h,
          blurRadius: 15.h,
          offset: Offset(0, 3),
        ),
        BoxShadow(
          color: Colors.white.withOpacity(0.3),
          spreadRadius: 40.h,
          blurRadius: 20.h,
          offset: Offset(0, 3),
        ),
      ]),
      child: Column(
        children: [
          Text(
            title,
            style:
            TextStyle(fontWeight: FontWeight.w800, fontSize: 18.sp),
          ),
          SizedBox(height: 10.h,),
          Text(
            subTitle,
            style:
            TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp,color: const Color(0xFF878B9A)),
          ),
        ],
      ),
    );
  }
}
