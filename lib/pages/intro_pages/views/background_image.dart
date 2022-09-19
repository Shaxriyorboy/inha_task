import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key,required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Image(
      height: 583.h,
      width: 287.w,
      image: AssetImage(image),
    );
  }
}
