import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/main.dart';
import 'package:abati_new/view/Home/webViewScreen.dart';
import 'package:abati_new/view/auth/AdsScreen.dart';
import 'package:abati_new/view/auth/ChooesCurrency.dart';
import 'package:abati_new/view/auth/ChooseCuntry.dart';
import 'package:abati_new/view/auth/LoginScreen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ChooesLanguge extends StatefulWidget {
  const ChooesLanguge({Key key}) : super(key: key);

  @override
  State<ChooesLanguge> createState() => _ChooesLangugeState();
}

class _ChooesLangugeState extends State<ChooesLanguge> {
  var lang = "en";
  CurrencyModel Selected;
  var iso = "Select Your Currency".tr();
  var isEn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        
        children: [
          
          SvgPicture.asset("assets/image/LANGUAGEBack.svg"),

          SingleChildScrollView(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Center(child: SvgPicture.asset("assets/image/languge.svg")),
                const SizedBox(height: 50),
                CustomText(text: "CHOOSE YOUR LANGUAGE".tr(),fontWeight: FontWeight.w600,fontSize: 18,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0,right: 0,top: 20),
                    child: CustomAppText(text: "Please choose your preferred language to continue using app".tr(),fontWeight: FontWeight.normal,fontSize: 14,color: grayColor,height: 1.2,alignment: Alignment.center,),
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(

                        onTap: (){

                          setState(() {

                            isEn = true;
                            Mypref.setDLang("en");
                            context.locale = Locale('en', 'US');

                          });
                        },
                        child: Container(

                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.45,
                          decoration: BoxDecoration(
                              color: isEn ? Color.fromRGBO(255, 250, 242, 1) :Colors.white,
                              border: Border.all(color: Colors.black)
                          ),
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Visibility(
                                  visible: isEn,
                                  child: Row(
                                    children: [

                                      SvgPicture.asset("assets/image/chosseslang.svg"),
                                      SizedBox(width: 10,)
                                    ],
                                  )),

                              CustomText(text: "English",)

                            ],
                          ),
                        ),
                      ),
                      InkWell(

                        onTap: (){

                          setState(() {

                            isEn = false;
                            Mypref.setDLang("ar");
                            context.locale = Locale('ar', 'SA');

                          });
                        },
                        child: Container(

                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.45,
                          decoration: BoxDecoration(
                              color: !isEn ? Color.fromRGBO(255, 250, 242, 1) :Colors.white,
                              border: Border.all(color: Colors.black)
                          ),
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Visibility(
                                  visible: !isEn,
                                  child: Row(
                                    children: [

                                      SvgPicture.asset("assets/image/chosseslang.svg"),
                                      SizedBox(width: 10,)
                                    ],
                                  )),

                              CustomText(text: "العربية",)

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),


                InkWell(
                  onTap: (){




                    if (!isEn){
                      Mypref.setDLang("ar");
                      context.locale = Locale('ar', 'SA');

                    }else{
                      Mypref.setDLang("en");
                      context.locale = Locale('en', 'US');


                    }



                    // RestartWidget.restartApp(context);



                    To(context, LoginScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(

                      height: 50,
                      decoration:  BoxDecoration(
                          color: Selected == null ?  Color.fromRGBO(185, 135, 62, 1) :Colors.black,

                      ),
                      child: CustomText(maxLine: 1,fontWeight: FontWeight.normal,text: "GET STARTED".tr(),color: Colors.white,),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
