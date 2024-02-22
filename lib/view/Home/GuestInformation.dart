import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/view/Home/CheckoutService.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/custom_textfiled.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/repo/auth.dart';
import 'package:abati_new/view/auth/ChooesCurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GuestInformation extends StatefulWidget {
  final int id;
  final String name;
  final String date;
  final int dateId;
  final int soltId;
  const GuestInformation({Key key, this.id, this.name, this.date, this.dateId, this.soltId}) : super(key: key);

  @override
  State<GuestInformation> createState() => _GuestInformationState();
}

class _GuestInformationState extends State<GuestInformation> {
  var auth = Auth();
  var iso = "965";

  TextEditingController userNameController = TextEditingController() ;
  TextEditingController emailController = TextEditingController() ;
  TextEditingController mobileController = TextEditingController() ;

  void initState() {
    super.initState();
    // userNameController.text = Mypref.getUser().item.name ?? "";
    // emailController.text = Mypref.getUser().item.email ?? "";
    // mobileController.text = Mypref.getUser().item.mobile.substring(3) ?? "";
    // heightController.text = Mypref.getUser().item.size ?? "";
    // iso = Mypref.getUser().item.mobile.substring(0,3) ?? ""; //getInitials(string: Mypref.getUser().item.mobile, limitTo: 1);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(


            appBar: AppBar(

              elevation: 0,
              backgroundColor: Colors.transparent,
              title:  Text("Guest Information".tr(),style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontWeight: FontWeight.w600,fontSize: 18),),
              leading:IconButton(onPressed: (){Navigator.pop(context,"");},icon: SvgPicture.asset( 'assets/image/back.svg'),),
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 1,
                        color: Colors.grey[200],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children:  [
                            CustomTextField(text: "Full Name *".tr(),controller: userNameController,),
                            const SizedBox(height: 12,),
                            CustomTextField(text: "Email".tr(),isEnabled: true,controller: emailController,),
                            const SizedBox(height: 12,),
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


                          ],
                        ),
                      ),
                      const SizedBox(height: 40,),




                    ],
                  ),
                ),


              ],
            )

        ),
        Positioned(


          bottom: 35,
          left: 15,
          right: 15,
          child: DefaultButton(text: "Continue".tr(),onPressed: (){

            if (userNameController.text.isEmpty || emailController.text.isEmpty || mobileController.text.isEmpty){
              AwesomeDialog(
                dismissOnBackKeyPress: true,
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.rightSlide,
                title: "",
                desc: "Input Error".tr(),
                btnCancelOnPress: () {
                  // Navigator.of(context, rootNavigator: false).pop();

                },).show();
              return;
            }


            To(context, CheckoutService(id: widget.id,name: widget.name,date: "${widget.date} ",dateId: widget.dateId,soltId: widget.soltId,UserName: "${userNameController.text} , ${emailController.text}",mobile:"${iso}${mobileController.text}" ,email: emailController.text,));




          },),
        )
      ],
    );
  }
}
