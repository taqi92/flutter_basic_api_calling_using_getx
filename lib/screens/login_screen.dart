import 'package:flutter/material.dart';
import 'package:flutter_api_calling_using_getx/common_components/default_button.dart';
import 'package:flutter_api_calling_using_getx/core/controllers/login_controllers.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login_screen";

  final LoginController _loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'GetX Login',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _loginController.emailTextController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: 'Email',
                  hintStyle: GoogleFonts.exo2(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                  ),
                ),
                style: GoogleFonts.exo2(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                validator: (value) =>
                    value.trim().isEmpty ? 'Email required' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _loginController.passwordTextController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: 'Password',
                  hintStyle: GoogleFonts.exo2(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                  ),
                ),
                validator: (value) =>
                    value.trim().isEmpty ? 'Password required' : null,
                style: GoogleFonts.exo2(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 16),
              DefaultButton(
                  text: 'Login',
                  press: () {
                    if (_formKey.currentState.validate()) {
                      _loginController.apiLogin();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
