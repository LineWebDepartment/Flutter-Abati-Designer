import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/view/Home/PorductCheckout.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/view/Home/CheckoutService.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
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
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class GuestCheckout extends StatefulWidget {
  const GuestCheckout({Key key}) : super(key: key);

  @override
  State<GuestCheckout> createState() => _GuestCheckoutState();
}

class _GuestCheckoutState extends State<GuestCheckout> {
  var auth = Auth();
  var iso = "965";

  var selectedIndex= 0;
  var countryId = 0;
  var areaId = 0;

  TextEditingController userNameController = TextEditingController() ;
  TextEditingController emailController = TextEditingController() ;
  TextEditingController mobileController = TextEditingController() ;
  TextEditingController countryTF = TextEditingController() ;
  TextEditingController areaTF = TextEditingController() ;
  TextEditingController addressTitle = TextEditingController() ;
  TextEditingController addresLine = TextEditingController() ;
  TextEditingController addresLine2 = TextEditingController() ;
  TextEditingController extra = TextEditingController() ;
  @override
  void initState() {
    super.initState();
    // Provider.of<APIProvider>(context, listen: false).fetchSetting();
  }
  @override
  Widget build(BuildContext context) {


    return Consumer<APIProvider>(builder:  (BuildContext context, data, _) {

      var item = data.Setting.data;
      return Stack(
        children: [
          Scaffold(


              appBar: AppBar(

                elevation: 0,
                backgroundColor: Colors.transparent,
                title:  Text("GUEST INFORMATION".tr(),style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontSize: 18,fontWeight: FontWeight.w600),),
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

                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 12.0),
                                    child: CustomText(text: "Customer details".tr(),alignment:Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,),
                                  ),
                                ],
                              ),
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
                        Column(
                          children: [

                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0,top: 20,right: 15),
                                  child: CustomText(text: "Customer Address".tr(),alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0,left: 15,right: 15),
                              child: Column(
                                children:   [
                                  CustomTextField(text: "Address Title *".tr(),controller: addressTitle,),
                                  SizedBox(height: 12,),
                                  InkWell(

                                    onTap: (){

                                      showCustomModalBottomSheet(
                                        useRootNavigator:true,
                                        // barrierColor: Colors.grey[200].a,
                                        backgroundColor: Colors.white,
                                        context: context, builder: (context) => SingleChildScrollView(
                                        controller: ModalScrollController.of(context),
                                        child: Container(

                                            decoration: BoxDecoration(
                                                color: Colors.white,

                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(10) )

                                            ),
                                            height: 400,


                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [

                                                  Container(height: 90,color: Color.fromRGBO(248, 248, 248, 1),


                                                    child: Stack(
                                                      children: [

                                                        Row(



                                                          children: [
                                                            IconButton(onPressed: (){
                                                              Navigator.pop(context);
                                                            }, icon: SvgPicture.asset("assets/image/close.svg"),),

                                                          ],
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                        ),
                                                        Center(
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [

                                                              const SizedBox(height: 10,),
                                                              CustomText(text: "CHOOSE COUNTRY".tr(),fontWeight: FontWeight.bold,)

                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),

                                                  ),
                                                  ListView.builder(
                                                    shrinkWrap: true,
                                                    physics: NeverScrollableScrollPhysics(),
                                                    itemCount: item.settings.countries.length,
                                                    itemBuilder: (context, index) {
                                                      return InkWell(

                                                        onTap: (){

                                                          setState(() {

                                                            countryId = item.settings.countries[index].id;
                                                            selectedIndex = index;
                                                            countryTF.text = item.settings.countries[index].name;
                                                            // specialSize = false;
                                                            // selectedHeightText = item.item.colors[selectedIndex].variations[index].height.name;
                                                            // selectedHeight = item.item.colors[selectedIndex].variations[index].height.id;

                                                            // Vechicl.text = "${item[index].brand} - ${item[index].model} - ${item[index].plateNumber}";
                                                            // selectedVechile = item[index].id;
                                                            // latitude = item[index].l;



                                                          });
                                                          Navigator.pop(context);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.all(20.0),
                                                              child: CustomText(text:  item.settings.countries[index].name ,alignment: Alignment.center,),
                                                            ),
                                                            Visibility(


                                                                child: Container(height: 1,width: MediaQuery.of(context).size.width -70,color: Colors.grey[100],))
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),



                                                ],
                                              ),
                                            )

                                        ),
                                      ),);
                                    },
                                    child: Container(

                                      height: 50,

                                      decoration:  BoxDecoration(
                                          color: Colors.grey[200],
                                          border: Border.all(color: Colors.grey[300],width: 1)

                                      ),
                                      child:  Padding(
                                        padding:  EdgeInsets.only(left: 15.0,right: 0),
                                        child: TextField(

                                          style:  TextStyle(
                                              fontSize: 13
                                          ),
                                          keyboardType: TextInputType.text,


                                          controller: countryTF,
                                          decoration:  InputDecoration(



                                            enabled: false,
                                            border: InputBorder.none,
                                            suffixIcon: Icon(Icons.keyboard_arrow_down_sharp,color: Colors.black,),
                                            hintText: "Kuwait".tr(),


                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12,),
                                  InkWell(

                                    onTap: (){


                                      if (countryId == 0) {

                                        AwesomeDialog(
                                          dismissOnBackKeyPress: true,
                                          context: context,
                                          dialogType: DialogType.error,
                                          animType: AnimType.rightSlide,
                                          title: "",
                                          desc: "please select country ".tr(),
                                          btnOkText: "Ok".tr(),
                                          btnOkOnPress: (){}
                                          ,).show();
                                        return;
                                      }
                                      showCustomModalBottomSheet(
                                        useRootNavigator:true,
                                        // barrierColor: Colors.grey[200].a,
                                        backgroundColor: Colors.white,
                                        context: context, builder: (context) => SingleChildScrollView(
                                        controller: ModalScrollController.of(context),
                                        child: Container(

                                            decoration: BoxDecoration(
                                                color: Colors.white,

                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(10) )

                                            ),
                                            height: 400,


                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [

                                                  Container(height: 90,color: Color.fromRGBO(248, 248, 248, 1),


                                                    child: Stack(
                                                      children: [

                                                        Row(



                                                          children: [
                                                            IconButton(onPressed: (){
                                                              Navigator.pop(context);
                                                            }, icon: SvgPicture.asset("assets/image/close.svg"),),

                                                          ],
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                        ),
                                                        Center(
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [

                                                              const SizedBox(height: 10,),
                                                              CustomText(text: "CHOOSE COUNTRY".tr(),fontWeight: FontWeight.bold,)

                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),

                                                  ),
                                                  ListView.builder(
                                                    shrinkWrap: true,
                                                    physics: NeverScrollableScrollPhysics(),
                                                    itemCount: item.settings.countries.length,
                                                    itemBuilder: (context, index) {
                                                      return InkWell(

                                                        onTap: (){

                                                          setState(() {

                                                            areaId = item.settings.countries[selectedIndex].areas[index].id;

                                                            areaTF.text = item.settings.countries[selectedIndex].areas[index].name;
                                                            // specialSize = false;
                                                            // selectedHeightText = item.item.colors[selectedIndex].variations[index].height.name;
                                                            // selectedHeight = item.item.colors[selectedIndex].variations[index].height.id;

                                                            // Vechicl.text = "${item[index].brand} - ${item[index].model} - ${item[index].plateNumber}";
                                                            // selectedVechile = item[index].id;
                                                            // latitude = item[index].l;



                                                          });
                                                          Navigator.pop(context);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.all(20.0),
                                                              child: CustomText(text:  item.settings.countries[selectedIndex].areas[index].name ,alignment: Alignment.center,),
                                                            ),
                                                            Visibility(


                                                                child: Container(height: 1,width: MediaQuery.of(context).size.width -70,color: Colors.grey[100],))
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),



                                                ],
                                              ),
                                            )

                                        ),
                                      ),);
                                    },
                                    child: Container(

                                      height: 50,

                                      decoration:  BoxDecoration(
                                          color: Colors.grey[200],
                                          border: Border.all(color: Colors.grey[300],width: 1)

                                      ),
                                      child:  Padding(
                                        padding:  EdgeInsets.only(left: 15.0,right: 0),
                                        child: TextField(

                                          style:  TextStyle(
                                              fontSize: 13
                                          ),
                                          keyboardType: TextInputType.text,


                                          controller: areaTF,
                                          decoration:  InputDecoration(



                                            enabled: false,
                                            border: InputBorder.none,
                                            suffixIcon: Icon(Icons.keyboard_arrow_down_sharp,color: Colors.black,),
                                            hintText: "Area*".tr(),


                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12,),
                                  CustomTextField(text: "Address Line 1 *".tr(),heightBox: 90,controller: addresLine,),
                                  SizedBox(height: 12,),
                                  CustomTextField(text: "Address Line 2".tr(),heightBox: 90,controller: addresLine2,),
                                  SizedBox(height: 12,),
                                  CustomTextField(text: "Extra Directions".tr(),heightBox: 90,controller: extra,),
                                  SizedBox(height: 12,),

                                ],
                              ),
                            ),
                            const SizedBox(height: 20,),
                            DefaultButton(text: "Continue".tr(),onPressed: (){

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


                              if (addressTitle.text.isEmpty || addresLine.text.isEmpty ||countryTF.text.isEmpty||areaTF.text.isEmpty){
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
                              To(context,  PorductCheckout(addressId: countryId,areaId:areaId,addressTitle:addressTitle.text ,address1: addresLine.text,address2: addresLine2.text,address3: extra.text,county: countryTF.text,city: areaTF.text,name: userNameController.text,email: emailController.text,mobile: "${iso}${mobileController.text}",));




                            },),

                          ],
                        ),
                        const SizedBox(height: 40,),




                      ],
                    ),
                  ),


                ],
              )

          ),

        ],
      );

    });

  }
}
