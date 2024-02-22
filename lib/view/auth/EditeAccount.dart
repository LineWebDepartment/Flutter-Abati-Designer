import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/custom_textfiled.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/repo/auth.dart';
import 'package:abati_new/view/auth/ChooesCurrency.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditeAccount extends StatefulWidget {
  const EditeAccount({Key key}) : super(key: key);

  @override
  State<EditeAccount> createState() => _EditeAccountState();
}

class _EditeAccountState extends State<EditeAccount> {
  var auth = Auth();
  var iso = "965";

  TextEditingController userNameController = TextEditingController() ;
  TextEditingController emailController = TextEditingController() ;
  TextEditingController mobileController = TextEditingController() ;
  TextEditingController heightController = TextEditingController() ;

  void initState() {
    super.initState();
    userNameController.text = Mypref.getUser().item.name ?? "";
    emailController.text = Mypref.getUser().item.email ?? "";
    mobileController.text = Mypref.getUser().item.mobile.substring(3) ?? "";
    heightController.text = Mypref.getUser().item.size ?? "";
    iso = Mypref.getUser().item.mobile.substring(0,3) ?? ""; //getInitials(string: Mypref.getUser().item.mobile, limitTo: 1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(

        elevation: 0,
        backgroundColor: Colors.transparent,
        title:  Text("EDITE ACCOUNT".tr(),style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo'),),
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
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children:  [
                  CustomTextField(text: "ahmed islam",controller: userNameController,),
                  SizedBox(height: 12,),
                  CustomTextField(text: "islam@gmail.com",isEnabled: false,controller: emailController,),
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
                          child: CustomTextField(text: "islam@gmail.com",isEnabled: true,isMobile: true,controller: mobileController,)),
                    ],
                  )


                  ),
                  SizedBox(height: 12,),
                  CustomTextField(text: "Height - 52.8 inch",controller: heightController,),

                ],
              ),
            ),
            SizedBox(height: 40,),
            DefaultButton(text: "Update".tr(),onPressed: (){



              auth.editeProfile(userNameController.text, iso + mobileController.text, heightController.text, emailController.text,context);

            },),
            SizedBox(height: 20,),
            DefaultButton(text: "Terminate Account".tr(),background: Colors.transparent,textColor: Colors.black,)


            

          ],
        ),
      ),

    );
  }
}
