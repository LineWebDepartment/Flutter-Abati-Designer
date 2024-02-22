import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/custom_widget/custom_textfiled.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/repo/auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  TextEditingController oldPasswordController = TextEditingController() ;
  TextEditingController passwordController = TextEditingController() ;
  TextEditingController confirmController = TextEditingController() ;
  var auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:  Text(
          "CHANGE PASSWORD".tr(),
          style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, "");
          },
          icon: SvgPicture.asset( 'assets/image/back.svg'),
        ),

      ),

      body: Column(
        children: [
          Container(
            height: 1,
            color: Colors.grey[200],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20.0,right: 15,left: 15),
            child: Column(
              children: [

                CustomTextField(text: "Old Password".tr(),controller: oldPasswordController,),
                SizedBox(height: 12,),
                CustomTextField(text: "New Password".tr(),controller: passwordController,),
                SizedBox(height: 12,),
                CustomTextField(text: "Confirm Password".tr(),controller: confirmController,),
                SizedBox(height: 40,),


              ],
            ),
          ),
          DefaultButton(text: "Update".tr(),onPressed: (){

            if (oldPasswordController.text.isEmpty || passwordController.text.isEmpty ||confirmController.text.isEmpty){
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

            // auth.changePassword(oldPasswordController.text, passwordController.text, confirmController.text, context).then((value) =>
            // {
            //
            //   oldPasswordController.text = "",
            //   passwordController.text = "",
            //   confirmController.text = ""
            //
            // });

          },)

        ],
      ),


    );
  }
}
