import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/main.dart';
import 'package:abati_new/view/Home/webViewScreen.dart';
import 'package:abati_new/view/auth/LoginScreen.dart';
import 'package:abati_new/view/auth/SignupScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExitConfirmationDialog extends StatelessWidget {


  final Function() onPressed;
  final String text;
  final String title;
  final String image;
  final String buttonText;

  const ExitConfirmationDialog({
     this.onPressed,
     this.text,
     this.title,
     this.image,
     this.buttonText,
    


  }) ;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
    color: Colors.white,
    height: 220,
    child:  SizedBox(
      height: 250,
      child: Stack(
        alignment: Alignment.center,

        clipBehavior: Clip.none, children: <Widget>[
        Positioned(

          top: -40.0,
          // right: 115,
          // left: 115,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(

              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Center(child: SvgPicture.asset("assets/image/${this.image}.svg",width: 40,height: 40,)),


          ),
        ),
        Positioned(

            top: 20,
            right: 20,

            child:InkWell(


                onTap: (){
                  Navigator.pop(context);
                },
                child: SvgPicture.asset("assets/image/closebut.svg",))
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 70,),
            CustomText(maxLine: 1, fontWeight: FontWeight.bold,text: this.title,),
            const SizedBox(height: 10,),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 30),
                child: CustomAppText(maxLine: 2, fontWeight: FontWeight.normal,text: this.text,fontSize: 14,height: 1.2,color: grayColor,alignment: Alignment.center,),
              ),
            ),
            const SizedBox(height: 30,),
            DefaultButton(onPressed: this.onPressed, text: this.buttonText, isBold: false,background: primaryColor,)
          ],
        )

      ],
      ),
    ),
  );
}
class ExitConfirmationDialog1 extends StatelessWidget {


  final Function() onPressed;
  final String text;
  final String title;
  final String image;
  final String buttonText;

  const ExitConfirmationDialog1({
    this.onPressed,
    this.text,
    this.title,
    this.image,
    this.buttonText,



  }) ;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
    color: Colors.white,
    height: 220,
    child:  SizedBox(
      height: 250,
      child: Stack(
        alignment: Alignment.center,

        clipBehavior: Clip.none, children: <Widget>[
        Positioned(

          top: -40.0,
          // right: 115,
          // left: 115,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(

              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Center(child: SvgPicture.asset("assets/image/${this.image}.svg",width: 40,height: 40,)),


          ),
        ),
        Positioned(

            top: 20,
            right: 20,

            child:InkWell(


                onTap: (){
                  Navigator.pop(context);
                },
                child: SvgPicture.asset("assets/image/closebut.svg",))
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 70,),
            CustomText(maxLine: 1, fontWeight: FontWeight.bold,text: this.title,),
            const SizedBox(height: 10,),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0,right: 40),
                child: CustomAppText(maxLine: 2, fontWeight: FontWeight.normal,text: this.text,fontSize: 14,height: 1.2,color: grayColor,alignment: Alignment.center,),
              ),
            ),
            const SizedBox(height: 30,),
            DefaultButton(onPressed: this.onPressed, text: this.buttonText, isBold: false,background: Colors.black,)
          ],
        )

      ],
      ),
    ),
  );
}
class ConfirmationDialog extends StatelessWidget {


  final Function() onPressed;
  final String text;
  final String title;
  final String image;
  final String buttonText;

  const ConfirmationDialog({
    this.onPressed,
    this.text,
    this.title,
    this.image,
    this.buttonText,



  }) ;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
    color: Colors.white,
    height: 200,
    child:  SizedBox(
      height: 200,
      child: Stack(
        alignment: Alignment.center,

        clipBehavior: Clip.none, children: <Widget>[
        // Positioned(
        //
        //   top: -40.0,
        //   // right: 115,
        //   // left: 115,
        //   child: Container(
        //     width: 80,
        //     height: 80,
        //     decoration: BoxDecoration(
        //
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(40),
        //       boxShadow: [
        //         BoxShadow(
        //           color: Colors.grey.withOpacity(0.1),
        //           spreadRadius: 3,
        //           blurRadius: 4,
        //           offset: Offset(0, 3), // changes position of shadow
        //         ),
        //       ],
        //     ),
        //     child: Center(child: Image.asset("assets/image/${this.image}.png",width: 40,height: 40,)),
        //
        //
        //   ),
        // ),

        Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
            CustomText(maxLine: 1, fontWeight: FontWeight.bold,text: this.title,),
            const SizedBox(height: 10,),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 50.0,right: 50),
                child: CustomText(maxLine: 2, fontWeight: FontWeight.normal,text: this.text,fontSize: 14,height: 1.2,color: grayColor,alignment: Alignment.center,),
              ),
            ),
            const SizedBox(height: 30,),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width *0.39,
                  child: DefaultButton(

                    background: Colors.white,
                    textColor: Colors.black,
                    onPressed: (){

                      Navigator.pop(context);
                    }, text: "Cancel", isBold: true,),
                ),
                Container(
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width *0.35,
                    child: DefaultButton(onPressed: this.onPressed, text: this.buttonText, isBold: true,)),


              ],
            )
          ],
        )

      ],
      ),
    ),
  );
}
class ProceedCheckoutDialog extends StatelessWidget {


  final Function() onPressed;
  final String text;
  final String title;
  final String image;
  final String buttonText;

  const ProceedCheckoutDialog({
    this.onPressed,
    this.text,
    this.title,
    this.image,
    this.buttonText,



  }) ;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
    color: Colors.white,
    height: 400,
    child:  SizedBox(
      height: 300,
      child: Stack(
        alignment: Alignment.center,

        clipBehavior: Clip.none, children: <Widget>[
        Positioned(

          top: -40.0,
          // right: 130,
          // left: 130,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(

              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Center(child: SvgPicture.asset("assets/image/${this.image}.svg",width: 40,height: 40,)),


          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 70,),
            CustomText(maxLine: 1, fontWeight: FontWeight.bold,text: this.title,),
            const SizedBox(height: 10,),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 50.0,right: 50),
                child: CustomText(maxLine: 2, fontWeight: FontWeight.normal,text: this.text,fontSize: 14,height: 1.2,color: grayColor,alignment: Alignment.center,),
              ),
            ),
            const SizedBox(height: 30,),
            DefaultButton(onPressed: (){ To(context, LoginScreen());}, text: "Signin", isBold: true),
            const SizedBox(height: 20,),
            DefaultButton(onPressed: (){ To(context, SignUpScreen());}, text:  "Signup", isBold: true,background: Colors.white,textColor: Colors.black,),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 1,color: Colors.grey[400],width: MediaQuery.of(context).size.width *0.3,),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8),
                  child: Container(width: 30,height: 30,decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),

                    border: Border.all(color:Colors.grey[400], )
                  ),child: CustomText(text: "or",fontSize: 13,),),
                ),
                Container(height: 1,color: Colors.grey[400],width: MediaQuery.of(context).size.width *0.3,)

              ],
            ),
            const SizedBox(height: 20,),
            TextButton(onPressed: this.onPressed, child: CustomText(text: this.buttonText,))
          ],
        )

      ],
      ),
    ),
  );
}
class Addtowishlist  extends StatelessWidget {


  final Function() onPressed;
  final String text;
  final String title;
  final String image;
  final String buttonText;

  const Addtowishlist({
    this.onPressed,
    this.text,
    this.title,
    this.image,
    this.buttonText,



  }) ;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
    color: Colors.white,
    height: 300,
    child:  SizedBox(
      height: 300,
      child: Stack(

        alignment: Alignment.center,
        clipBehavior: Clip.none, children: <Widget>[
        Positioned(

          top: -40.0,
          // right: 130,
          // left: 130,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(

              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Center(child: SvgPicture.asset("assets/image/heart.svg",width: 40,height: 40,)),


          ),
        ),
        Positioned(

          top: 20,
          right: 20,

          child:InkWell(


              onTap: (){
                Navigator.pop(context);
              },
              child: SvgPicture.asset("assets/image/closebut.svg",))
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 70,),
            CustomText(maxLine: 1, fontWeight: FontWeight.bold,text: "Add to wishlist ?",),
            const SizedBox(height: 10,),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 50.0,right: 50),
                child: CustomText(maxLine: 2, fontWeight: FontWeight.normal,text: "Please Signin or Signup to continue",fontSize: 14,height: 1.2,color: grayColor,alignment: Alignment.center,),
              ),
            ),
            const SizedBox(height: 30,),
            DefaultButton(onPressed: (){ To(context, LoginScreen());}, text: "Signin", isBold: true),
            const SizedBox(height: 20,),
            DefaultButton(onPressed: (){ To(context, SignUpScreen());}, text:  "Signup", isBold: true,background: Colors.white,textColor: Colors.black,),
            const SizedBox(height: 20,),

          ],
        )

      ],
      ),
    ),
  );
}
class languge extends StatelessWidget {


  final Function() onPressed;
  final String text;
  final String title;
  final String image;
  final String buttonText;

  const languge({
    this.onPressed,
    this.text,
    this.title,
    this.image,
    this.buttonText,



  }) ;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
    color: Colors.white,
    height: 300,
    child:  SizedBox(
      height: 300,
      child: Stack(
        alignment: Alignment.center,

        clipBehavior: Clip.none, children: <Widget>[
        Positioned(

          top: -40.0,
          // right: 130,
          // left: 130,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(

              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Center(child: SvgPicture.asset("assets/image/lang.svg",width: 40,height: 40,)),


          ),
        ),
        Positioned(

            top: 20,
            right: 20,

            child:InkWell(


                onTap: (){
                  Navigator.pop(context);
                },
                child: SvgPicture.asset("assets/image/closebut.svg",))
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 70,),
            CustomText(maxLine: 1, fontWeight: FontWeight.bold,text: "Change Language",),
            const SizedBox(height: 10,),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 50.0,right: 50),
                child: CustomAppText(maxLine: 2, fontWeight: FontWeight.normal,text: "Choose you preferred language.",fontSize: 14,height: 1.2,color: grayColor,alignment: Alignment.center,),
              ),
            ),
            const SizedBox(height: 30,),


            Stack(

              children: [
                DefaultButton(onPressed: (){



                  Mypref.setDLang("en");
                  context.locale = Locale('en', 'US');
                  RestartWidget.restartApp(context);

                }, text: "English", isBold: true,textColor:  Mypref.getDlang() == "en" ? Colors.white:Colors.black,background: Mypref.getDlang() == "en" ? Colors.black:Colors.white,),

                Mypref.getDlang() == "en" ? Positioned(

                    right: 30,
                    top: 15,


                    child: SvgPicture.asset("assets/image/chosseslang.svg")):Container(),
              ]
              ,
            ),
            const SizedBox(height: 20,),


            Stack(

              children: [


                DefaultButton(onPressed: (){


                  Mypref.setDLang("ar");
                  context.locale = Locale('ar', 'SA');
                  RestartWidget.restartApp(context);


                }, text:  "العربية", isBold: true,background: Mypref.getDlang() == "ar" ? Colors.black:Colors.white,textColor:  Mypref.getDlang() == "ar" ? Colors.white:Colors.black,),
                Mypref.getDlang() == "ar" ? Positioned(

                    right: 30,
                    top: 15,


                    child: SvgPicture.asset("assets/image/chosseslang.svg")):Container(),
              ]
              ,
            ),
            const SizedBox(height: 20,),
          ],
        )

      ],
      ),
    ),
  );
}
