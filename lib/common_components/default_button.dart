import 'package:flutter/material.dart';
import 'package:flutter_api_calling_using_getx/util/constants.dart';

import '../util/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       width: SizeConfig.screenWidth,
      //height: SizeConfig.screenHeight / 16,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: kPrimaryColor,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(14),
            color: Colors.white,
            fontFamily: "Poppins-Regular",
              fontWeight: FontWeight.normal
          ),
        ),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        disabledColor: Colors.blueGrey,
        disabledElevation: 10,
      ),
    );
  }
}
