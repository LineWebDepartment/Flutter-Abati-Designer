
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class DefaultButton extends StatefulWidget {

 final Color background ;
 final Color textColor ;
 final Function() onPressed;
 final String text;
 // final ButtonController controller;
 final bool isBold ;



   DefaultButton({
     this.onPressed,
     this.text,
    this.background = Colors.black,
    this.textColor = Colors.white,
    // this.fontSize,
    // this.radius ,
    // this.paddingVertical ,

      this.isBold = true,
     // this.controller,

     // this.icon, this.gradient = true, this.paddingHorsetail=5, this.isBold = false,
   // this.height,
   // this.isBorder = false,
   // this.isFittedText = false,
   // this.isShadow = true,
   // this.toUpper = true,
   // this.iconEnd = false,
  }) ;

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {

  bool isLoader = false  ;
  setIsLoader(val){
    setState(() {
      isLoader = val ;
    });
  }

  @override
  void initState() {
    // if(widget.controller!=null){
    //   widget.controller.setIsLoader = setIsLoader ;
    // }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Padding(
        padding: const EdgeInsets.only(right: 15,left: 15),
        child: Container(

          height: 50,
          decoration: BoxDecoration(
            color: widget.background,
            border:widget.isBold ?  Border.all(color: Colors.black,width: 0.7):null

          ),
          child: CustomText(maxLine: 1,fontWeight: FontWeight.normal,text: widget.text,color: widget.textColor,),
        ),
      ),
    );
  }
}