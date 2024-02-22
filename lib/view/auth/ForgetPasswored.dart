import 'package:abati_new/repo/auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/view/auth/SignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ForgetPasswored extends StatefulWidget {
  const ForgetPasswored({Key key}) : super(key: key);

  @override
  State<ForgetPasswored> createState() => _ForgetPassworedState();
}

class _ForgetPassworedState extends State<ForgetPasswored> {

  var auth = Auth();
  TextEditingController emailController = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Stack(
        children: [
          Container(

            child: SvgPicture.asset('assets/image/LOGIN.svg'),

          ),
          Column(
            children: [
              Container(height: 55,color: Colors.transparent,),
              Row(

                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  const SizedBox(width: 15,),
                  InkWell
                    (
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset("assets/image/back.svg",height: 25,)),

                  SizedBox(width: MediaQuery.of(context).size.width *0.22),
                  Center(child: CustomText(maxLine: 1, fontWeight: FontWeight.bold,text: "FORGOT PASSWORD".tr(),color: Colors.black,fontSize:15 ,alignment: Alignment.center,)),
                ],
              ),
              const SizedBox(height: 40,),
              SvgPicture.asset("assets/image/forgotpassword.svg"),
              const SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color:gray1Color,
                          border: Border.all(color: Colors.grey.shade300,width: 1)
                      ),
                      height: 50,

                      child: Row(
                        children: [
                          Container(height:50,width: 50,color: Colors.black,child: Center(
                            child: Stack(

                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  child: SvgPicture.asset("assets/image/email.svg"),
                                )
                              ],
                            ),
                          ),),
                          SizedBox(width: 15,),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: TextField(
                              controller: emailController,
                              //Set text style
                              style: TextStyle(
                                  fontSize: 13
                              ),
                              keyboardType: TextInputType.emailAddress, //Set keyboard type for email address. This will show @ button on the primary section of the keyboard.
                              //Set decoration
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email Address*".tr()), // Set the hint text that will be shown when TextField is empty
                            ),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
              const SizedBox(height: 20,),
              DefaultButton(onPressed: () {


                if (emailController.text.isEmpty){

                  AwesomeDialog(
                    dismissOnBackKeyPress: true,
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: "Error".tr(),
                    desc: "plz enter your email".tr(),
                    btnCancelOnPress: () {
                      // Navigator.of(context, rootNavigator: false).pop();

                    },).show();
                  return;
                }
                auth.forgotPassword(emailController.text, context);

              }, text: "Send".tr(), isBold: false,background: Colors.black,),
              const SizedBox(height: 15,),
            ],
          ),
        ],
      ),
    );
  }
}
