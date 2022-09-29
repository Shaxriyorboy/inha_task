import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inha_task/pages/create_pincode_page/create_pin_code_vm.dart';
import 'package:inha_task/pages/intro_pages/main_page/main_page.dart';

final pinNotifier = ChangeNotifierProvider((ref) => CreatePinCodeVM());

class CreatePinCodePage extends ConsumerStatefulWidget {
  const CreatePinCodePage({Key? key}) : super(key: key);

  @override
  ConsumerState<CreatePinCodePage> createState() => _CreatePinCodePageState();
}

class _CreatePinCodePageState extends ConsumerState<CreatePinCodePage> {

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    ref.read(pinNotifier).readPinCode();
    ref.read(pinNotifier).readConfirmCode();
    ref.read(pinNotifier).readFaceId();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(pinNotifier);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 170.h,
          ),
          Text(
            ref.read(pinNotifier).storeCode.isEmpty?"Установите PIN":ref.read(pinNotifier).checkConfirm.isEmpty?"Потвердить PIN":"Ввести Pin-код",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            height: 16.h,
            width: 140.w,
            alignment: Alignment.center,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    height: 16.h,
                    width: 16.w,
                    decoration: BoxDecoration(
                      color: ref.read(pinNotifier).code.length != index + 1
                          ? const Color(0xFF878B9A)
                          : Colors.blue,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 60.h,
          ),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 53.w),
              child: GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20.w,
                    mainAxisSpacing: 20.h,
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return index == 9
                        ? const HandIcon()
                        : index == 11
                            ? const DeleteButton()
                            : NumberButton(index: index);
                  }),
            ),
          ),
          const Spacer(),
          ref.read(pinNotifier).checkConfirm.isEmpty ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Row(
              children: [
                Image.asset("assets/images/face_im.png"),
                SizedBox(width: 10.w,),
                Text(
                  "Разблокировка через Face ID",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF121F3E),
                  ),
                ),
                const Spacer(),
                Switch(
                  value: ref.read(pinNotifier).isSwitched,
                  onChanged: (value) {
                    ref.read(pinNotifier).onFaceID(value);
                  },
                  activeTrackColor: Colors.grey,
                  activeColor: Colors.blueAccent,
                ),
              ],
            ),
          ):const SizedBox.shrink(),
          SizedBox(height: 10.h,),
        ],
      ),
    );
  }
}

class HandIcon extends ConsumerWidget {
  const HandIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(pinNotifier.select((value) => value.checkFaceId));
    return ref.read(pinNotifier).checkFaceId.isNotEmpty?GestureDetector(
      onTap: () async {
        await ref.read(pinNotifier).localAuth().then((value) {
          if (ref.read(pinNotifier).isTrue) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const MainPage();
            }));
          }
        });
      },
      child: Container(
        alignment: Alignment.center,
        child: Image.asset("assets/images/atpechatka.png"),
      ),
    ):Container();
  }
}

class NumberButton extends ConsumerWidget {
  final int index;

  const NumberButton({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        ref.read(pinNotifier).onTabFunction(index);
        ref.read(pinNotifier).storePinCode();
        if(ref.read(pinNotifier).isTrue){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return const MainPage();
          }));
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: 76.h,
        width: 76.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: const Color(0xFFEAEFF3), width: 1.5.w)),
        child: Text(
          ref.read(pinNotifier).numbers[index],
          style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xFF878B9A)),
        ),
      ),
    );
  }
}

class DeleteButton extends ConsumerWidget {
  const DeleteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(pinNotifier);
    return GestureDetector(
      onTap: () {
        ref.read(pinNotifier).deleteButton();
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          "Удалить",
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xFF878B9A)),
        ),
      ),
    );
  }
}
