import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:smh_user/Helpers/Pref.dart';
// import 'package:mot_free/Helper/Pref.dart';

class CustomTextField extends StatelessWidget {
  final String text;

  final double fontSize;
  final double heightBox;

  final Color color;

  final Alignment alignment;

  final int maxLine;
  final double height;
  final FontWeight fontWeight;
  final TextEditingController controller;
  final bool isEnabled;
  final bool isMobile;

  // final fontweight fontWeight;

  const CustomTextField({Key key,
    this.heightBox = 50,
    this.isEnabled = true,
    this.isMobile = false,
    this.controller,
    this.text = '',
    this.fontSize = 16,
    this.color = Colors.black,
    this.alignment = Alignment.center,
    // this.maxLine,
    this.height = 1,  this.maxLine,  this.fontWeight,
    // this.fontWeight
    // this.fontWeight = fontWeight
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,

      child:Container(

        height: this.heightBox,

        decoration: this.isMobile ? null : BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.grey[300],width: 1)

        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0,right: 15),
          child: TextField(

            controller: controller,
            //Set text style
            style:  TextStyle(
                fontSize: 13,
              fontFamily:  Mypref.getlang() == "en"? 'RobotoSlab':'Cairo'
            ),
            keyboardType: TextInputType.text, //Set keyboard type for email address. This will show @ button on the primary section of the keyboard.
            //Set decoration
            decoration:  InputDecoration(
              enabled: this.isEnabled,
                border: InputBorder.none,
                hintText: this.text), // Set the hint text that will be shown when TextField is empty
          ),
        ),
      ),
    );
  }
}
