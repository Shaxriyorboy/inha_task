import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'waiting_page.dart';

class TimeContainer extends ConsumerWidget {
  const TimeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(waitingNotifier.select((value) => value.time));
    return Container(
      height: 211.h,
      width: 211.h,
      // alignment: Alignment.center,
      padding: EdgeInsets.all(3.r),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(106.r),
            border: Border.all(color: Color(0xFFEAE9EE), width: 1.w)),
        child: Text(
          ref.read(waitingNotifier).time > 9
              ? "0:${ref.read(waitingNotifier).time}"
              : "0:0${ref.read(waitingNotifier).time}",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 62.sp,
              color: Color(0xFF878B9A)),
        ),
      ),
    );
  }
}

class CustomIndicator extends ConsumerWidget {
  const CustomIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(waitingNotifier);
    return SizedBox(
      height: 211.h,
      width: 211.h,
      child: CircularProgressIndicator(
        strokeWidth: 5.w,
        color: !ref.read(waitingNotifier).isRed
            ? Color(0xFF3554D1)
            : Color(0xFFEB5757),
        value: ref.read(waitingNotifier).value > 0
            ? ref.read(waitingNotifier).value
            : 1,
      ),
    );
  }
}

class AnimatedIndicator extends ConsumerWidget {
  const AnimatedIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(waitingNotifier);
    return SizedBox(
      height: 13.6.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (index) => AnimContainer(index: index),
          growable: false,
        ),
      ),
    );
  }
}

class AnimContainer extends ConsumerWidget {
  const AnimContainer({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(waitingNotifier.select((value) => value.index));
    return AnimatedContainer(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 1.6.w),
      duration: const Duration(seconds: 1),
      decoration: BoxDecoration(
          color: index == ref.read(waitingNotifier).index
              ? Colors.blue
              : Colors.grey,
          borderRadius: BorderRadius.circular(1.6.r)),
      width: 3.2.w,
      height: ref.read(waitingNotifier).index == index ? 13.6.h : 5.6.h,
    );
  }
}

class CustomTitle extends ConsumerWidget {
  const CustomTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(waitingNotifier.select((value) => value.isRed));
    return Text(
      !ref.read(waitingNotifier).isRed ? "Ожидайте" : "Упс",
      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
    );
  }
}

class CustomSubtitle extends ConsumerWidget {
  const CustomSubtitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(waitingNotifier.select((value) => value.isRed));
    return Text(
      !ref.read(waitingNotifier).isRed
          ? "Идет считывание данных, ожидайте осталось еще чучуть"
          : "Попройбуйте пройти верификацию занова возможна технический сбой",
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF878B9A),
      ),
      textAlign: TextAlign.center,
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          side: MaterialStateProperty.all(BorderSide.none),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {},
        child: Text(
          "Повторить",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ));
  }
}
