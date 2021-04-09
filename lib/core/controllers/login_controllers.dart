import 'package:flutter/material.dart';
import 'package:flutter_api_calling_using_getx/apis/request.dart';
import 'package:flutter_api_calling_using_getx/screens/home_screen.dart';
import 'package:flutter_api_calling_using_getx/util/constants.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  TextEditingController emailTextController;
  TextEditingController passwordTextController;

  @override
  void onInit() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.onInit();
  }

  void apiLogin() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    Request request = Request(url: urlLogin, body: {
      'email': emailTextController.text,
      'password': passwordTextController.text
    });
    request.post().then((value) {
      Get.back();
      Get.off(() => HomeScreen());
      print(value.body);
    }).catchError((onError) {});
  }

  @override
  void onClose() {
    emailTextController?.dispose();
    passwordTextController?.dispose();
    super.onClose();
  }
}