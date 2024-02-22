
import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/custom_widget/exit_confirmation_dialog.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/main.dart';
import 'package:abati_new/view/Account/MyAddress.dart';
import 'package:abati_new/view/Account/Wishlist.dart';
import 'package:abati_new/view/ContactUs.dart';
import 'package:abati_new/view/Home/MyBooking.dart';
import 'package:abati_new/view/Home/MyOrders.dart';
import 'package:abati_new/view/Home/webViewScreen.dart';
import 'package:abati_new/view/auth/ChangePassword.dart';
import 'package:abati_new/view/auth/ChooesCurrency.dart';
import 'package:abati_new/view/auth/ChooseCuntry.dart';
import 'package:abati_new/view/auth/EditeAccount.dart';
import 'package:abati_new/view/auth/LoginScreen.dart';
import 'package:abati_new/view/auth/SignupScreen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Setting {
  final String userName;
  final String image;


  const Setting(
      this.userName,

      this.image
      );}

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

 var setting = ["Language".tr(),"Notifications".tr(),"About Abati".tr(),"Terms & Conditions".tr(),"Privacy Policy".tr()];
 var settingImage = ["lang","bell","abita","terms","privac"];

 bool _enabled;



  @override
  Widget build(BuildContext context) {

    return Scaffold(



      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 44,),
            SizedBox(
              // color: Colors.red,
              height: 44,child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8),
                        child: CustomText(text: "ACCOUNT".tr(),fontWeight: FontWeight.w600,),
                      ),
                      SvgPicture.asset('assets/image/homeIcon.svg',height: 30,)

                    ],),
                ),
              ],
            ),),
            Container(
              height: 1,
              color: Colors.grey[200],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                color: Colors.grey[200],


              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 15,right: 15),
              child: Container(
                height: 280,
                decoration: const BoxDecoration(

                  color: Colors.transparent,
                  boxShadow: [

                  ],
                ),

                child: Stack(

                  children: [

                    SvgPicture.asset("assets/image/Componentcel.svg"),


                    Positioned(
                      top: 40,
                      left: 20,
                      right: 20,
                      child: Center(
                        child: Column(
                          children: [
                            Container(


                              height: 180,
                              width: 180,



                              decoration: BoxDecoration(
                                // color: Colors.red,
                                  border: Border.all(color: Colors.grey[200],width: 2)
                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.network(Mypref.getUser().item.image,fit: BoxFit.cover,),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            InkWell(
                              onTap: (){

                                setState(() {

                                  // isProduct = !isProduct;
                                });

                              },
                              child: RatingBar(

                                itemSize: 25,
                                ignoreGestures: true,
                                initialRating: Mypref.getUser().item.rate.toDouble(),
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                ratingWidget: RatingWidget(
                                  full: SvgPicture.asset('assets/image/fellRate.svg'),
                                  half: SvgPicture.asset('assets/image/fellRate.svg'),
                                  empty:SvgPicture.asset('assets/image/unfellRate.svg'),
                                ),
                                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ),
                            const SizedBox(height: 10,),
                            CustomText(text: Mypref.getUser().item.designerDescription,height: 1.2,color: grayColor,maxLine: 3,fontSize: 14,)
                          ],
                        ),
                      ),
                    ),
                  ],

                ),
              ),
            ),
            Column(
              children: [


                SizedBox(height: 20,),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: setting.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(

                        onTap: () async {

                          if (index == 0){
                            showDialog(context: context, builder: (context) => languge(onPressed: () {

                              Navigator.pop(context);

                            },title: "",text: "",image: "lang", buttonText: '',));
                        }else


                          if (index == 2){
                            To(context, webViewScreen(index: 0,title: "ABOUT ABATI".tr(),));

                          }else if (index == 3){
                            To(context, webViewScreen(index: 2,title: "Terms & Conditions ".tr(),));

                          }else if (index == 4){
                            To(context, webViewScreen(index: 1,title: "Privacy Policy".tr(),));

                          }
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 60,
                                // color: Colors.grey,

                                child: Row(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Row(

                                      children: [

                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ClipRRect(


                                                child: SvgPicture.asset("assets/image/${settingImage[index]}.svg"))),

                                        CustomText(maxLine: 1,
                                          fontWeight: FontWeight.normal,
                                          text:  setting[index],
                                          color: grayColor,
                                          fontSize: 14,),


                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8),
                                      child: index == 1 ?Switch(
                                        value: _enabled,
                                        onChanged: (bool value) {
                                          setState(() {
                                            _enabled = value;
                                          });
                                        },
                                        activeColor: primaryColor,

                                        // activeThumbImage: new NetworkImage('https://lists.gnu.org/archive/html/emacs-devel/2015-10/pngR9b4lzUy39.png'),
                                        // inactiveThumbImage: new NetworkImage('http://wolfrosch.com/_img/works/goodies/icon/vim@2x'),
                                      ):  Container(

                                       color: Colors.grey[200],
                                        width: 30,
                                        height: 30,
                                        child: Icon(Icons.arrow_forward_ios,size: 15,),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(height: 1, color: Colors.grey[200],),

                          ],
                        ),
                      );
                    }),
              ],
            ),

            Visibility(

              child: DefaultButton(text: "LOGOUT".tr(),onPressed: (){

                // AwesomeDialog(
                //     dismissOnBackKeyPress: true,
                //     context: context,
                //     dialogType: DialogType.info,
                //     animType: AnimType.scale,
                //     title: "Are you sure".tr(),
                //     desc: "Do you really need Logout".tr(),
                //
                //     btnCancelText: "Cancel".tr(),
                //     btnCancelOnPress: (){},
                //     btnOkText: "Yes, Logout".tr(),
                //     btnOkOnPress: (){
                //
                //
                //       setState(() {
                //
                //         Mypref.removeUser();
                //         Mypref.setIsLogin(false);
                //
                //         RestartWidget.restartApp(context);
                //
                //       });
                //     }).show();

                showDialog(context: context, builder: (context) => ConfirmationDialog(onPressed: () {

                  Mypref.removeUser();
                  Mypref.setIsLogin(false);
                  RestartWidget.restartApp(context);

                },title: "Are you sure".tr(),text: "Do you really need Logout".tr(),image: "remove", buttonText: 'Yes, Logout'.tr(),));






              },),
            ),
            const SizedBox(height: 30,),

            const SizedBox(height: 30,),

            CustomText(text: "V 1.0",color: grayColor,fontSize: 15,),
            const SizedBox(height: 10,),
            CustomText(text: "Powered By LINE",color: grayColor,fontSize: 15,),

            const SizedBox(height: 50,),
          ],
        ),
      ),

    );
  }
}
