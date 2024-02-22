import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/custom_textfiled.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/repo/auth.dart';
import 'package:abati_new/view/auth/ChooesCurrency.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/custom_widget/helper.dart';

import '../Helper/Pref.dart';
class ContactUs extends StatefulWidget {
  const ContactUs({Key key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  var api = Api();
  var iso = "965";

  TextEditingController userNameController = TextEditingController() ;
  TextEditingController emailController = TextEditingController() ;
  TextEditingController mobileController = TextEditingController() ;
  TextEditingController massegController = TextEditingController() ;

  void initState() {
    super.initState();
    // Provider.of<APIProvider>(context, listen: false).fetchSetting();

    print("Mypref.getToken()");
  }
  @override
  Widget build(BuildContext context) {

    return Consumer<APIProvider>(builder: (BuildContext context, data, _) {
      var item = data.Setting.data;
      return Scaffold(


        appBar: AppBar(

          elevation: 0,
          backgroundColor: Colors.transparent,
          title:  Text("CONTACT US".tr(),style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontSize: 18,fontWeight: FontWeight.w600),),
          leading:IconButton(onPressed: (){Navigator.pop(context,"");},icon: SvgPicture.asset( 'assets/image/back.svg'),),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 1,
                color: Colors.grey[200],
              ),


              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(


                      height:90 ,
                      width: MediaQuery.of(context).size.width *0.3,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(color: Colors.white,width: 2),

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SvgPicture.asset("assets/image/whatsappIcon.svg"),
                          const SizedBox(height: 15,),
                          CustomText(text: item.settings.mobile,fontSize: 10,fontWeight: FontWeight.bold,)
                        ],
                      ),
                    ),
                    Container(


                      height:90 ,
                      width: MediaQuery.of(context).size.width *0.3,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(color: Colors.white,width: 2),

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SvgPicture.asset("assets/image/phone.svg",color: Colors.black,),
                          const SizedBox(height: 15,),
                          CustomText(text: item.settings.mobile,fontSize: 10,fontWeight: FontWeight.bold,)
                        ],
                      ),
                    ),
                    Container(


                      height:90 ,
                      width: MediaQuery.of(context).size.width *0.3,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(color: Colors.white,width: 2),

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SvgPicture.asset("assets/image/email.svg",color: Colors.black,),
                          const SizedBox(height: 15,),
                          CustomText(text: item.settings.infoEmail,fontSize: 10,fontWeight: FontWeight.bold,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children:  [
                    CustomTextField(text: "Name*".tr(),controller: userNameController,),
                    SizedBox(height: 12,),
                    CustomTextField(text: "Email Address".tr(),controller: emailController,),
                    SizedBox(height: 12,),
                    Container(
                        height: 50,

                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.grey[300],width: 1)

                        ),

                        child:

                        Row(
                          children: [
                            InkWell(

                              onTap: () async {
                                final result = await  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ChossesCurrency(isRegister: true,)));
                                setState(() {

                                  iso = result;
                                });
                              },
                              child: Container(

                                child: Row(

                                  children: [
                                    SizedBox(width: 10,),
                                    CustomText(text: iso,fontSize: 14,),
                                    Icon(Icons.keyboard_arrow_down_outlined),
                                    SizedBox(width: 10,),
                                    Container(width: 1,color: Colors.grey[300],height: 35,)
                                  ],
                                ),

                              ),
                            ),
                            Container(
                                width: 200,
                                child: CustomTextField(text: "Mobile Number *".tr(),isEnabled: true,isMobile: true,controller: mobileController,)),
                          ],
                        )


                    ),
                    SizedBox(height: 12,),
                    CustomTextField(text: "Enter your message here*".tr(),controller: massegController,height: 1,),

                  ],
                ),
              ),
              SizedBox(height: 40,),
              DefaultButton(text: "Send".tr(),onPressed: (){



                api.ContactUs(userNameController.text, iso + mobileController.text, emailController.text,massegController.text,context).then((value) =>
                {

                 if  (value.status == true){
                     userNameController.text = "" ,
                      emailController.text = "",
                     mobileController.text = "",
                     massegController.text = ""




                 }



                });

              },),





            ],
          ),
        ),

      );
    });


  }
}
