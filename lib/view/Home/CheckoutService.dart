import 'package:abati_new/Helper/extention.dart';
import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/repo/auth.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CheckoutService extends StatefulWidget {
  final int id;
  final String name;
  final String date;
  final int dateId;
  final int soltId;
  final String UserName;
  final String mobile;
  final String email;
  const CheckoutService({Key key, this.id, this.name, this.date, this.dateId, this.soltId, this.UserName, this.mobile, this.email}) : super(key: key);

  @override
  State<CheckoutService> createState() => _CheckoutServiceState();
}

class _CheckoutServiceState extends State<CheckoutService> {

  var isVisa = false;
  var api = Api();
  var isPromo = "0";
  var payment = 1;
  TextEditingController promoCode = TextEditingController() ;

  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false).fetchServiceCheckout(widget.id, promoCode.text);

    print("Mypref.getToken()");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:  Text(
          "Checkout".tr(),
          style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontSize: 18,fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, "");
          },
          icon: SvgPicture.asset( 'assets/image/back.svg'),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset('assets/image/bag.svg'))
        ],
      ),
      body:


         Consumer<APIProvider>(builder:  (BuildContext context, data, _) {

           var item = data.CheckoutService;
           return SingleChildScrollView(
             child:Column(
               children: [
                 Container(
                   height: 1,
                   color: Colors.grey[200],
                 ),

                 Column(
                   // mainAxisAlignment: MainAxisAlignment.s,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [



                     Visibility(
                       visible: !Mypref.IsLogin(),
                       child: Column(
                         children: [
                           Padding(
                             padding: const EdgeInsets.all(12.0),
                             child: Row(
                               children: [
                                 CustomText(text: "GUEST INFORMATION".tr(),alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,),
                               ],
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(12.0),
                             child:
                             Container(height: 75,color: Colors.grey[200],child:
                             Column(

                               children: [
                                 Padding(
                                   padding: const EdgeInsets.all(12.0),
                                   child: Row(

                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       CustomText(text: widget.UserName,color: grayColor,fontSize: 14,),
                                       InkWell(

                                           onTap: (){

                                             Navigator.pop(context);
                                           },

                                           child: SvgPicture.asset("assets/image/editeblack.svg")),
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 12.0,right: 12),
                                   child: CustomText(text: widget.mobile,color: grayColor,fontSize: 13,alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight
                                     ,maxLine: 1,),
                                 ),
                               ],
                             ),),


                           ),


                         ],
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(12.0),
                       child: Row(
                         children: [
                           CustomText(text: "SERVICE DETAILS".tr(),alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight
                             ,),
                         ],
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(12.0),
                       child:
                       Container(height: 75,color: Colors.grey[200],child:
                       Column(

                         children: [
                           Padding(
                             padding: const EdgeInsets.all(12.0),
                             child: Row(

                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 CustomText(text: widget.name,color: grayColor,fontSize: 14,),
                                 InkWell(

                                     onTap: (){

                                       Navigator.pop(context);
                                     },

                                     child: SvgPicture.asset("assets/image/editeblack.svg")),
                               ],
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 12.0,right: 12),
                             child: CustomText(text: widget.date,color: grayColor,fontSize: 13,alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight
                               ,maxLine: 1,),
                           ),
                         ],
                       ),),


                     ),


                     Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(12.0),
                           child: CustomText(text: "PAYMENT METHOD".tr(),alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight
                             ,),
                         ),
                       ],
                     ),
                     Column(
                       children: [

                         Visibility(
                           visible: Mypref.getCurrency().shortName == "AED" ,

                           child: InkWell(
                             onTap: (){
                               setState(() {

                                 isVisa = false;
                                 payment = 4;
                               });
                             },
                             child: Padding(
                               padding: const EdgeInsets.only(left: 12.0,right: 12),
                               child:
                               Container(

                                 decoration: BoxDecoration(
                                     color: !isVisa ? Colors.grey[200] :Colors.white,
                                     border: Border.all(color: Colors.grey[300])
                                 ),
                                 height: 50,
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Row(

                                       children: [
                                         SvgPicture.asset("assets/image/UASCard.svg"),
                                         SizedBox(width: 10,),
                                         CustomText(text: "UAE Debit Card".tr(),)
                                       ],
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.all(12.0),
                                       child: SvgPicture.asset(!isVisa ? "assets/image/check.svg":"assets/image/uncheck.svg"),
                                     )
                                   ],
                                 ),


                               ),


                             ),
                           ),
                         ),




                         Visibility(
                           visible: Mypref.getCurrency().shortName == "QAR" ,

                           child: InkWell(

                             onTap: (){
                               setState(() {

                                 isVisa = false;
                                 payment = 3;
                               });
                             },
                             child: Padding(
                               padding: const EdgeInsets.only(left: 12.0,right: 12),
                               child:
                               Container(

                                 decoration: BoxDecoration(
                                     color: !isVisa ? Colors.grey[200] :Colors.white,
                                     border: Border.all(color: Colors.grey[300])
                                 ),
                                 height: 50,
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Row(

                                       children: [
                                         SvgPicture.asset("assets/image/napsIcon.svg"),
                                         SizedBox(width: 10,),
                                         CustomText(text: "NAPS".tr(),)
                                       ],
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.all(12.0),
                                       child: SvgPicture.asset(!isVisa ? "assets/image/check.svg":"assets/image/uncheck.svg"),
                                     )
                                   ],
                                 ),


                               ),


                             ),
                           ),
                         ),
                         Visibility(
                           visible: Mypref.getCurrency().shortName == "SAR" ,
                           child: InkWell(

                             onTap: (){
                               setState(() {

                                 isVisa = false;
                                 payment = 5;
                               });
                             },
                             child: Padding(
                               padding: const EdgeInsets.only(left: 12.0,right: 12),
                               child:
                               Container(

                                 decoration: BoxDecoration(
                                     color: !isVisa ? Colors.grey[200] :Colors.white,
                                     border: Border.all(color: Colors.grey[300])
                                 ),
                                 height: 50,
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Row(

                                       children: [
                                         SvgPicture.asset("assets/image/SADAD.svg"),
                                         const SizedBox(width: 10,),
                                         CustomText(text: "SADAD".tr(),)
                                       ],
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.all(12.0),
                                       child: SvgPicture.asset(!isVisa ? "assets/image/check.svg":"assets/image/uncheck.svg"),
                                     )
                                   ],
                                 ),


                               ),


                             ),
                           ),
                         ),
                         Visibility(
                           visible: Mypref.getCurrency().shortName == "KWD" ,
                           child: InkWell(

                             onTap: (){
                               setState(() {

                                 isVisa = false;
                                 payment = 1;
                               });
                             },
                             child: Padding(
                               padding: const EdgeInsets.only(left: 12.0,right: 12),
                               child:
                               Container(

                                 decoration: BoxDecoration(
                                     color: !isVisa ? Colors.grey[200] :Colors.white,
                                     border: Border.all(color: Colors.grey[300])
                                 ),
                                 height: 50,
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Row(

                                       children: [
                                         SvgPicture.asset("assets/image/keyNet.svg"),
                                         SizedBox(width: 10,),
                                         CustomText(text: "KNET".tr(),)
                                       ],
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.all(12.0),
                                       child: SvgPicture.asset(!isVisa ? "assets/image/check.svg":"assets/image/uncheck.svg"),
                                     )
                                   ],
                                 ),


                               ),


                             ),
                           ),
                         ),
                         const SizedBox(height: 10,),
                         InkWell(
                           onTap: (){

                             setState(() {

                               isVisa = true;
                               payment = 2;
                             });
                           },
                           child: Padding(
                             padding: const EdgeInsets.only(left: 12.0,right: 12),
                             child:
                             Container(

                               decoration: BoxDecoration(
                                   color:  isVisa ? Colors.grey[200] :Colors.white,
                                   border: Border.all(color: Colors.grey[300])
                               ),
                               height: 50,
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Row(

                                     children: [
                                       SvgPicture.asset("assets/image/Visa.svg"),
                                       SizedBox(width: 10,),
                                       CustomText(text: "Credit".tr(),)
                                     ],
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(12.0),
                                     child: SvgPicture.asset(isVisa ? "assets/image/check.svg":"assets/image/uncheck.svg"),
                                   )
                                 ],
                               ),


                             ),


                           ),
                         ),
                       ],
                     ),
                     const SizedBox(height: 20,),
                     Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(12.0),
                           child: CustomText(text: "PROMO CODE".tr(),alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight
                             ,),
                         ),
                       ],
                     ),
                     Padding(
                       padding: const EdgeInsets.all(12.0),
                       child: Row(
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
                                         child: SvgPicture.asset("assets/image/promoCode.svg"),
                                       )
                                     ],
                                   ),
                                 ),),
                                 SizedBox(width: 15,),
                                 Container(
                                   width: MediaQuery.of(context).size.width * 0.45,
                                   child: TextField(
                                     // obscureText: true,
                                     controller: promoCode,
                                     //Set text style
                                     style: TextStyle(
                                         fontSize: 13
                                     ),
                                     keyboardType: TextInputType.emailAddress,

                                     //Set keyboard type for email address. This will show @ button on the primary section of the keyboard.
                                     //Set decoration
                                     decoration: InputDecoration(
                                         border: InputBorder.none,
                                         hintText: "Enter your Promo code".tr()), // Set the hint text that will be shown when TextField is empty
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           Container(
                               width: 120,
                               child: DefaultButton(text: isPromo == "1"? "Remove".tr(): "Apply".tr(),onPressed: (){


                                 if (isPromo == "0" ||isPromo == "2" ){
                                   api.checkPromoCodeForBookingService(6, promoCode.text, context).then((value) => {


                                     if (value.item.discount > 0 ){


                                       setState(() {
                                         isPromo = "1";
                                         Provider.of<APIProvider>(context, listen: false).fetchServiceCheckout(widget.id, promoCode.text);
                                       })

                                     }else if (value.item.discount == 0){


                                       setState(() {
                                         isPromo = "2";
                                         Provider.of<APIProvider>(context, listen: false).fetchServiceCheckout(widget.id, "");
                                       })
                                     }

                                   });

                                 }else if (isPromo == "1"){

                                   setState(() {
                                     promoCode.text = "";
                                     isPromo = "0";
                                     Provider.of<APIProvider>(context, listen: false).fetchServiceCheckout(widget.id, "");
                                   });
                                 }


                               },)),

                         ],
                       ),
                     ),
                     Visibility(
                       visible: isPromo == "1",
                       child: Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: Row(
                           children: [
                             SvgPicture.asset("assets/image/appled.svg"),
                             SizedBox(width: 10,),
                             CustomText(text: "Applied Successfully.".tr(),alignment: Alignment.centerLeft,fontSize: 12,color: Colors.green,),
                           ],
                         ),
                       ),
                     ),
                     Visibility(
                       visible: isPromo == "2",
                       child: Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: Row(
                           children: [

                             SvgPicture.asset("assets/image/errorIcon.svg"),
                             SizedBox(width: 10,),
                             CustomText(text: "Invalid code please type right code".tr(),alignment: Alignment.centerLeft,fontSize: 12,color: Colors.red,),
                           ],
                         ),
                       ),
                     ),




                   ],),

                 Padding(
                   padding: const EdgeInsets.all(12.0),
                   child: Column(
                     children: [
                       Row(
                         children: [
                           CustomText(text: "PAYMENT DETAILS".tr(),alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight
                             ,),
                         ],
                       ),
                       const SizedBox(height: 20,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           CustomText(text: "SubTotal".tr(),alignment: Alignment.centerLeft,),
                           CustomText(text: item.data.item.subTotal.p,alignment: Alignment.centerLeft,),
                         ],
                       ),
                       const SizedBox(height: 20,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           CustomText(text: "Discount".tr(),alignment: Alignment.centerLeft,),
                           CustomText(text:item.data.item.discount.p,alignment: Alignment.centerLeft,),
                         ],
                       ),
                       const SizedBox(height: 20,),
                       Container(
                         height: 1,
                         color: Colors.grey[200],
                       ),
                       const SizedBox(height: 20,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           CustomText(text: "Total".tr(),alignment: Alignment.centerLeft,),
                           CustomText(text: item.data.item.total.p,alignment: Alignment.centerLeft,color: primaryColor,fontWeight: FontWeight.bold,),
                         ],
                       ),
                       const SizedBox(height: 50,),
                       DefaultButton(text: "Proceed To Payment".tr(),onPressed: (){

                         api.bookService("$payment", promoCode.text, "${widget.dateId}", "${widget.soltId}", "${widget.id}", widget.UserName, widget.email, widget.mobile, context);
                       },)
                     ],
                   ),
                 ),





               ],
             ),
           );

    })



    );
  }
}
