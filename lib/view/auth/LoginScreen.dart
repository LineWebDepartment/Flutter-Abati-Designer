import 'dart:io';

import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/repo/auth.dart';
import 'package:abati_new/view/Home/webViewScreen.dart';
import 'package:abati_new/view/auth/ForgetPasswored.dart';
import 'package:abati_new/view/auth/SignupScreen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false).fetchSetting(true);

    print("Mypref.getToken()");
  }
  var auth = Auth();
  TextEditingController email = TextEditingController() ;
  TextEditingController password = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title:

            CustomAppText(text: "Designer Log in".tr(),fontSize: 18,fontWeight: FontWeight.w600),

            // Text(
            //   "Designer Log in".tr(),
            //   style: CustomAppText(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontSize: 18,fontWeight: FontWeight.w600),
            // ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context, "");
              },
              icon: SvgPicture.asset( Mypref.getDlang() == "en" ? 'assets/image/back.svg' :'assets/image/backar.svg'),
            ),


          ),
          body: SingleChildScrollView(
            child: Stack(
              children: [

                Column(
                  children: [
                    const SizedBox(height: 50,),
                    SvgPicture.asset("assets/image/loginpage.svg"),
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
                                Container(height:50,width: 50,color: primaryColor,child: Center(
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
                          SizedBox(height: 20,),
                          Container(
                            decoration: BoxDecoration(
                                color:gray1Color,
                                border: Border.all(color: Colors.grey.shade300,width: 1)
                            ),
                            height: 50,

                            child: Row(
                              children: [
                                Container(height:50,width: 50,color: primaryColor,child: Center(
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
                                    obscureText: true,
                                    controller: password,
                                    //Set text style
                                    style: TextStyle(
                                        fontSize: 13
                                    ),
                                    keyboardType: TextInputType.emailAddress,

                                    //Set keyboard type for email address. This will show @ button on the primary section of the keyboard.
                                    //Set decoration
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password*".tr()), // Set the hint text that will be shown when TextField is empty
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15,),


                        ],
                      ),
                    ),
                    // const SizedBox(height: 15,),
                    DefaultButton(onPressed: () {


                      if (email.text.isEmpty || password.text.isEmpty){
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

                      auth.login(password.text, email.text, context);





                    }, text: "Signin".tr(), isBold: false,background: primaryColor,),
                  ],
                ),


              ],
            ),
          ),
        ),
        Positioned(

          bottom: 15,
          left: 15,
          right: 15,
          child:


            Consumer<APIProvider>(builder:  (BuildContext context, data, _){

              var item = data.Setting.data;
              return  Column(
                children: [

                  Row(
                    children: [
                      Container(

                        color: Color.fromRGBO(230, 214, 191, 1),height: 1,width: MediaQuery.of(context).size.width * 0.4,),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8),
                        child: SvgPicture.asset("assets/image/loginicon.svg"),
                      ),
                      Container(

                        color: Color.fromRGBO(230, 214, 191, 1),height: 1,width: MediaQuery.of(context).size.width * 0.4,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(

                    height: 150,
                    color: Color.fromRGBO(247, 240, 231, 1),

                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CustomAppText(text: "This application is only for Abati Designers. Customers can login or book through our Application.".tr(),fontSize: 14,color: primaryColor,height: 1.3,),
                        ),
                        Container(
                          margin: EdgeInsets.only(left:15,right: 15 ),
                          child: DefaultButton(text: "Download App".tr(),background: Colors.transparent,textColor: primaryColor,isBold: false,onPressed: (){

                            if (Platform.isAndroid){
                              launch('${item.settings.googlePlayUrl}');
                            }else{
                              launch('${item.settings.appStoreUrl}');
                            }

                          },),
                          decoration: BoxDecoration(

                            border: Border.all(width: 1,color: primaryColor)
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            })


        ),
      ],
    );
  }
}
