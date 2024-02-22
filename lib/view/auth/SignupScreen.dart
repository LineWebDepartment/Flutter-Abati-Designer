import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/customPup.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/custom_widget/dialog_helper.dart';
import 'package:abati_new/custom_widget/exit_confirmation_dialog.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/repo/auth.dart';
import 'package:abati_new/view/auth/ChooesCurrency.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var auth = Auth();
  var iso = "965";
  TextEditingController userName = TextEditingController() ;
  TextEditingController email = TextEditingController() ;
  TextEditingController mobile = TextEditingController() ;
  TextEditingController size = TextEditingController() ;
  TextEditingController password = TextEditingController() ;
  TextEditingController confiramPassword = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
   return Scaffold(

      body: Stack(
        children: [
          Container(

            child: SvgPicture.asset('assets/image/LOGIN.svg'),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 60,color: Colors.transparent,),
                CustomText(maxLine: 1, fontWeight: FontWeight.normal,text: "SIGNUP".tr(),color: Colors.black,),
                const SizedBox(height: 50,),
                Center(child: SvgPicture.asset("assets/image/sigUp.svg")),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomText(maxLine: 1, fontWeight: FontWeight.w400,text: "Signup with us!".tr(),alignment:  Mypref.getlang() == "en"? Alignment.centerLeft:Alignment.centerRight,color: grayColor,),
                ),

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
                                    child: SvgPicture.asset("assets/image/person.svg"),
                                  )
                                ],
                              ),
                            ),),
                            SizedBox(width: 15,),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: TextField(
                                controller: userName,
                                //Set text style
                                style: TextStyle(
                                    fontSize: 13
                                ),
                                keyboardType: TextInputType.emailAddress, //Set keyboard type for email address. This will show @ button on the primary section of the keyboard.
                                //Set decoration
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Full Name *".tr()), // Set the hint text that will be shown when TextField is empty
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
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
                                controller: email,
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
                      const SizedBox(height: 15,),
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
                                    child: SvgPicture.asset("assets/image/phone.svg"),
                                  )
                                ],
                              ),
                            ),),
                            SizedBox(width: 15,),
                            InkWell(

                              onTap: () async {

                                // To(context, ChossesCurrency());
                                final result = await  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ChossesCurrency(isRegister: true,)));
                                setState(() {
                                  iso = result;
                                });

                              },
                              child: Container(
                              child: Row(

                                children: [
                                  CustomText(maxLine: 1, fontWeight: FontWeight.normal,text: "+${iso}",fontSize: 12,),
                                  Icon(Icons.keyboard_arrow_down_rounded)
                                ],
                              ),
                              ),
                            ),

                            Container(height:30,width: 1,color: Colors.grey,),
                            SizedBox(width: 10,),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: TextField(
                                controller: mobile,
                                //Set text style
                                style: TextStyle(
                                    fontSize: 13
                                ),
                                keyboardType: TextInputType.phone, //Set keyboard type for email address. This will show @ button on the primary section of the keyboard.
                                //Set decoration
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Mobile Number *".tr()), // Set the hint text that will be shown when TextField is empty
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15,),
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
                                    child: SvgPicture.asset("assets/image/size.svg"),
                                  )
                                ],
                              ),
                            ),),
                            SizedBox(width: 15,),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: TextField(
                                controller: size,
                                //Set text style
                                style: TextStyle(
                                    fontSize: 13
                                ),
                                keyboardType: TextInputType.text, //Set keyboard type for email address. This will show @ button on the primary section of the keyboard.
                                //Set decoration
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Size".tr()), // Set the hint text that will be shown when TextField is empty
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15,),
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
                                    child: SvgPicture.asset("assets/image/lock.svg"),
                                  )
                                ],
                              ),
                            ),),
                            SizedBox(width: 15,),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: TextField(
                                controller: password,
                                //Set text style
                                style: TextStyle(
                                    fontSize: 13
                                ),
                                keyboardType: TextInputType.text, //Set keyboard type for email address. This will show @ button on the primary section of the keyboard.
                                //Set decoration
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password*".tr()), // Set the hint text that will be shown when TextField is empty
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15,),
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
                                    child: SvgPicture.asset("assets/image/lock.svg"),
                                  )
                                ],
                              ),
                            ),),
                            SizedBox(width: 15,),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: TextField(
                                controller: confiramPassword,
                                //Set text style
                                style: TextStyle(
                                    fontSize: 13
                                ),
                                keyboardType: TextInputType.text, //Set keyboard type for email address. This will show @ button on the primary section of the keyboard.
                                //Set decoration
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Confirm Password *".tr()), // Set the hint text that will be shown when TextField is empty
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: Column(
                    children:  [
                      Text.rich(
                        TextSpan(
                          text: ' I agree to the '.tr(),
                          style: TextStyle(fontSize: 12),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Privacy Policy'.tr(),
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                )),
                            TextSpan(
                                text: ' and the'.tr(),
                                style: TextStyle(
                                )),
                            TextSpan(
                                text: ' Terms & Conditions'.tr(),
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                )),
                            // can add more TextSpans here...
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                const SizedBox(height: 30,),
                DefaultButton(onPressed: () async {


                  if (userName.text.isEmpty || email.text.isEmpty || mobile.text.isEmpty || password.text.isEmpty || confiramPassword.text.isEmpty){

                    AwesomeDialog(
                      dismissOnBackKeyPress: true,
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: "Input Error".tr(),
                      desc: "please fill all required field".tr(),
                      btnOkText: "Ok".tr(),
                      btnOkOnPress: (){}
                      ,).show();
                    return;
                  }
                  if (password.text != confiramPassword.text){
                    AwesomeDialog(
                      dismissOnBackKeyPress: true,
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: "Input Error".tr(),
                      desc: "Please make sure the password  correct".tr(),
                      btnOkText: "Ok".tr(),
                      btnOkOnPress: (){}
                      ,).show();
                    return;
                  }

                  auth.signUp(userName.text, password.text, size.text, iso + mobile.text, email.text, context);



                }, text: "Signup".tr(), isBold: false,background: Colors.black,),
                const SizedBox(height: 15,),
                DefaultButton(onPressed: () {
                  Navigator.pop(context);
                }, text: "Signin".tr(), isBold: false,background: Colors.white,textColor: Colors.black,),
                Container(
                  height: 100,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
