import 'package:abati_new/Helper/Pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:smh_user/Helpers/Pref.dart';
// import 'package:mot_free/Helper/Pref.dart';

class CustomText extends StatelessWidget {
  final String text;

  final double fontSize;

  final Color color;

  final Alignment alignment;

  final int maxLine;
  final double height;
  final FontWeight fontWeight;
  final bool isPrice;

  // final fontweight fontWeight;

  CustomText({
    this.isPrice = false,
    this.text = '',
    this.fontSize = 16,
    this.color = Colors.black,
    this.alignment = Alignment.center,
     // this.maxLine,
    this.height = 1,  this.maxLine,  this.fontWeight,
     // this.fontWeight
    // this.fontWeight = fontWeight
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,

      child: Text(
        text,

        style: TextStyle(
          fontWeight:fontWeight ,
          color: color,
          height: height,
          fontSize: fontSize,
          decoration: this.isPrice ?   TextDecoration.lineThrough :null,


          fontFamily:  Mypref.getDlang() == "en"? 'RobotoSlab':'Cairo',
        ),
        maxLines: maxLine,



      ),
    );
  }
}
// class CustomText extends StatelessWidget {
//   final String text;
//
//   final double fontSize;
//
//   final Color color;
//
//   final Alignment alignment;
//
//   final int maxLine;
//   final double height;
//   final FontWeight fontWeight;
//   final bool isPrice;
//
//   // final fontweight fontWeight;
//
//   CustomText({
//     this.isPrice = false,
//     this.text = '',
//     this.fontSize = 16,
//     this.color = Colors.black,
//     this.alignment = Alignment.center,
//      // this.maxLine,
//     this.height = 1,  this.maxLine,  this.fontWeight,
//      // this.fontWeight
//     // this.fontWeight = fontWeight
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: alignment,
//
//       child: Text(
//         text,
//
//         style: TextStyle(
//           fontWeight:fontWeight ,
//           color: color,
//           height: height,
//           fontSize: fontSize,
//           decoration: this.isPrice ?   TextDecoration.lineThrough :null,
//
//
//           fontFamily:  Mypref.getDlang() == "en"? 'RobotoSlab':'Cairo',
//         ),
//         maxLines: maxLine,
//
//
//
//       ),
//     );
//   }
// }
