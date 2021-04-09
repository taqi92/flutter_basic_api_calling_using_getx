import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_calling_using_getx/screens/login_screen.dart';
import 'package:flutter_api_calling_using_getx/util/constants.dart';
import 'package:flutter_api_calling_using_getx/util/size_config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  static String routeName = "/splash";

  final storage = FlutterSecureStorage();

  Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(key: "jwt");
    if (jwt == null) return "";
    return jwt;
  }

  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<SplashPage> {
  startTime() async {

    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPageIntro);
  }

  @override
  void initState() {
    super.initState();

    checkInternetConnection().then((internet) {
      if (internet != null && internet) {
        // Internet Present Case
        startTime();
      } else {
        // No-Internet Case
        showAlertDialog(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Image(image: AssetImage('assets/images/loading.gif'))),
    );
  }

  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  showAlertDialog(BuildContext context) {
    Widget continueButton = FlatButton(
      child: Text("Retry"),
      onPressed: () {
        Navigator.pop(context);
        checkInternetConnection().then((internet) {
          if (internet != null && internet) {
            // Internet Present Case
            startTime();
          } else {
            // No-Internet Case
            showAlertDialog(context);
          }
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      elevation: 2,
      title: Text("No Internet connection!"),
      content: Text("Please Connect your device to internet first"),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void navigationPageIntro() {

    Get.off(() => LoginScreen());
  }
}
