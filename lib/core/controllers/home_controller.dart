import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_api_calling_using_getx/apis/request.dart';
import 'package:flutter_api_calling_using_getx/models/userList.dart';
import 'package:flutter_api_calling_using_getx/util/constants.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var userListData = List<Data>().obs;
  @override
  void onInit() {
    _apiGetUserList();
    super.onInit();
  }

  void _apiGetUserList() async {
    Future.delayed(
        Duration.zero,
            () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));

    Request request = Request(url: urlUserList, body: null);
    request.get().then((value) {
      UserListModel userListModel =
      UserListModel.fromJson(json.decode(value.body));
      userListData.value = userListModel.data;
      Get.back();
    }).catchError((onError) {
      print(onError);
    });
  }

  void deleteItem(int index) {
    userListData.removeAt(index);
  }
}