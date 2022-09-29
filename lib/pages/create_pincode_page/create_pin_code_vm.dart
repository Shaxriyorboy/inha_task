import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';

class CreatePinCodeVM extends ChangeNotifier {
  List<String> numbers = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "",
    "0",
    ""
  ];
  String code = "";
  String storeCode = "";
  bool isTrue = false;
  bool isSwitched = false;
  final storage = const FlutterSecureStorage();
  String checkConfirm = "";
  String checkFaceId = "";

  void onTabFunction(int index) async {
    if (code.length != 4) {
      code = code + numbers[index];
      notifyListeners();
      print(code);
    } else {}
  }

  Future<void> storePinCode()async{
    if(storeCode.isEmpty && checkConfirm.isEmpty && code.length == 4){
      writePinCode();
      await Future.delayed(const Duration(milliseconds: 500), () {
        code = "";
        notifyListeners();
      });
      readPinCode();
      print("0");
      notifyListeners();
    }

    if(storeCode.isNotEmpty && checkConfirm.isEmpty && code.length == 4){
      writeConfirmCode();
      print("1");
      isTrue = true;
      notifyListeners();
    }

    if (code == storeCode && checkConfirm == "true") {
      isTrue = true;
      notifyListeners();
    }else if (code.length == 4 && code != storeCode) {
      await Future.delayed(const Duration(milliseconds: 500), () {
        code = "";
        notifyListeners();
      });
    }
  }

  Future<void> localAuth() async {
    final localAuth = LocalAuthentication();
    final didAuthenticate = await localAuth.authenticate(
      localizedReason: 'Please authenticate',
    );
    if (didAuthenticate) {
      isTrue = true;
      notifyListeners();
    }
  }

  Future<void> readPinCode()async{
    storeCode = (await storage.read(key: "PIN_CODE"))??"";
    notifyListeners();
  }

  Future<void> readFaceId()async{
    checkFaceId = (await storage.read(key: "FACE_ID"))??"";
    notifyListeners();
  }

  Future<void> readConfirmCode()async{
    checkConfirm = (await storage.read(key: "CONFIRM_CODE"))??"";
    notifyListeners();
  }

  Future<void> writePinCode()async{
    await storage.write(key: "PIN_CODE", value: code);
  }

  Future<void> writeFaceId()async{
    await storage.write(key: "FACE_ID", value: "have");
  }

  Future<void> writeConfirmCode()async{
    await storage.write(key: "CONFIRM_CODE", value: "true");
  }

  void deleteButton() {
    if (code.isNotEmpty) {
      code = code.replaceRange(code.length - 1, code.length, "");
      notifyListeners();
      print(code);
    }
  }

  void onFaceID(bool value) {
    isSwitched = value;
    notifyListeners();
    print(value);
    if(value && storeCode.isNotEmpty){
      writeFaceId();
      print("object");
    }
  }
}
