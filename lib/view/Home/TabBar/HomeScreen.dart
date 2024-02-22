import 'package:abati_new/Helper/extention.dart';
import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/repo/auth.dart';
import 'package:abati_new/view/CartScreen.dart';
import 'package:abati_new/view/CelebritiesDetiles.dart';
import 'package:abati_new/view/Home/Bestsellers.dart';
import 'package:abati_new/view/Home/Categories/ServiceScreen.dart';
import 'package:abati_new/view/Home/Celebrities.dart';
import 'package:abati_new/view/Home/DesignerDetails.dart';
import 'package:abati_new/view/Home/Designers.dart';
import 'package:abati_new/view/Home/Search/SearchScreen.dart';
import 'package:abati_new/view/ProductCategories.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../custom_widget/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var selectedIndex = 0;
  var isNew = true;
  var api = Api();
  @override
  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false).fetchDesignerStatistics();
  }
  @override
  Widget build(BuildContext context) {

    return Consumer<APIProvider>(builder:  (BuildContext context, data, _) {

      var item = data.Statistics.data;
      return Scaffold(

        body:  SingleChildScrollView(
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
                        child: CustomText(text: "DASHBOARD".tr(),fontWeight: FontWeight.w600,),
                      ),
                      SvgPicture.asset('assets/image/homeIcon.svg',height: 30,)

                    ],),
                ),
              ],
            ),),
            const SizedBox(height: 10,),
            Container(
              height: 1,
              color: Colors.grey[200],
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(height:   130,decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(5)),child:Row(children: [

                    // totalSales.svg
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15),
                      child: SvgPicture.asset('assets/image/totalSales.svg',),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      CustomText(text: "Total Sales".tr(),color: Colors.white,fontSize: 18,),
                      const SizedBox(height: 20,),
                      CustomText(text: item.item.totalSales.toStringAsFixed(3) + " KWD".tr(),color: Colors.white,fontSize: 24,)
                    ],)

                  ],) ,),
                  const SizedBox(height: 20,),
                  Container(height:   130,decoration: BoxDecoration(color: Color.fromRGBO(244, 244, 244, 1),borderRadius: BorderRadius.circular(5)),child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                    // totalSales.svg
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15),
                      child: SvgPicture.asset('assets/image/totalorder.svg',),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: "TOTAL \n ORDERS".tr(),color: Colors.black,fontSize: 18,height: 1.3,),

                            ],
                          ),

                        ],),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0,right: 12),
                      child: Container(

                        child: CustomText(text: item.item.totalOrders.toString(),fontSize: 18,),
                        height: 85,width: 110,decoration: BoxDecoration(color: Color.fromRGBO(252, 252, 252, 1),borderRadius: BorderRadius.circular(4)),),
                    )

                  ],) ,),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(height:   195,width: MediaQuery.of(context).size.width * 0.45, decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),child:Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          const SizedBox(height: 18,),
                          SvgPicture.asset('assets/image/main1.svg',),
                          const SizedBox(height: 20,),
                          CustomText(text: "TODAY’S SALES".tr(),),
                          const SizedBox(height: 25,),
                          CustomText(text: item.item.todaySales.toStringAsFixed(3) + " KWD".tr(),)
                        ////
                        ],) ,),
                      Container(height:   195,width: MediaQuery.of(context).size.width * 0.45, decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),child:Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          const SizedBox(height: 18,),
                          Image.asset("assets/image/today.png"),
                          // SvgPicture.asset('assets/image/main2.svg',),
                          const SizedBox(height: 20,),
                          CustomText(text: "TODAY’S ORDERS".tr(),),
                          const SizedBox(height: 25,),
                          CustomText(text: item.item.todayOrders.toString(),)

                        ],) ,),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(height:   126,width: MediaQuery.of(context).size.width * 0.28, decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),child:

                      Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.s,
                              children: [
                                SvgPicture.asset('assets/image/pinding.svg',width: 30,),
                                SizedBox(width: 4,),
                                CustomText(text: "Pending".tr(),fontSize: 14,),

                              ],
                            ),
                          ),


                          Padding(padding: const EdgeInsets.only(left: 8.0,right: 8),child:
                          Container(

                            child: CustomText(text: item.item.pendingOrders.toString(),),
                            height: 65,decoration: BoxDecoration(color:Color.fromRGBO(244, 244, 244, 1),borderRadius: BorderRadius.circular(5) ),)
                            ,)
                        ],) ,),
                      Container(height:   126,width: MediaQuery.of(context).size.width * 0.28, decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),child:

                      Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.s,
                              children: [
                                SvgPicture.asset('assets/image/accpeted.svg',width: 30,),
                                SizedBox(width: 4,),
                                CustomText(text: "Accepted".tr(),fontSize: 14,),

                              ],
                            ),
                          ),


                          Padding(padding: const EdgeInsets.only(left: 8.0,right: 8),child:
                          Container(

                            child: CustomText(text: item.item.acceptedOrders.toString(),),
                            height: 65,decoration: BoxDecoration(color:Color.fromRGBO(244, 244, 244, 1),borderRadius: BorderRadius.circular(5) ),)
                            ,)
                        ],) ,),
                      Container(height:   126,width: MediaQuery.of(context).size.width * 0.28, decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),child:

                      Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.s,
                              children: [
                                SvgPicture.asset('assets/image/Rejected.svg',width: 30,),
                                SizedBox(width: 4,),
                                CustomText(text: "Rejected".tr(),fontSize: 14,),

                              ],
                            ),
                          ),


                          Padding(padding: const EdgeInsets.only(left: 8.0,right: 8),child:
                          Container(

                            child: CustomText(text: item.item.rejectedOrders.toString(),),
                            height: 65,decoration: BoxDecoration(color:Color.fromRGBO(244, 244, 244, 1),borderRadius: BorderRadius.circular(5) ),)
                            ,)
                        ],) ,),
                    ],
                  ),
                ],
              ),
            )

          ]
          ,
      ),
        ),
    );
  });
  }
}
