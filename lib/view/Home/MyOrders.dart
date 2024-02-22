import 'package:abati_new/Helper/extention.dart';
import 'package:abati_new/Model/serviceDetails.dart';
import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/view/Home/BookingDetiles.dart';
import 'package:abati_new/view/Home/MyOrderDetails.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false).fetchMyOrder();

    print("Mypref.getToken()");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:  Text(
            "MY ORDERS",
            style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontWeight: FontWeight.w600,fontSize: 18),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, "");
            },
            icon: SvgPicture.asset( 'assets/image/back.svg'),
          ),

        ),

        body: Consumer<APIProvider>(builder:  (BuildContext context, data, _) {

          var item = data.MyOrders.data.items;
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 1,
                  color: Colors.grey[200],
                ),

                ListView.builder(

                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: item.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(

                        onTap: (){

                          // To(context, MyOrderDetails(id: item[index].id,));
                          AwesomeDialog(
                            dismissOnTouchOutside: true,
                            dismissOnBackKeyPress: true,
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: "Error",
                            desc: "unknown error",
                            btnCancelOnPress: () {
                              // Navigator.of(context, rootNavigator: false).pop();

                            },).show();

                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(


                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow:[
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(0, 0), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    height: 95,
                                    color: Colors.grey[100],

                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 3,
                                              color: primaryColor,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [

                                                      CustomText(text: "Order Id",color: grayColor,fontSize: 14,),
                                                      CustomText(text: "Order Date",color: grayColor,fontSize: 14,),
                                                      CustomText(text: "Country",color: grayColor,fontSize: 14,),


                                                    ],
                                                  ),
                                                  const SizedBox(width: 8,),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [

                                                      CustomText(text: ": ${item[index].id}",color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),
                                                      // CustomText(text: ": ${Date().}",color: Colors.black,fontSize: 14,maxLine: 2,fontWeight: FontWeight.bold),
                                                      Row(
                                                        children: [
                                                          CustomText(text: ":"),
                                                          CustomText(text: " ${item[index].country.name.name}",fontWeight: FontWeight.bold,fontSize: 14,),
                                                        ],
                                                      ),



                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        ),

                                        Row(
                                          children: [
                                            Container(
                                              width:1,
                                              color: Colors.grey[400],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(


                                                width: 100,
                                                height: 80,
                                                // color: Colors.white,
                                                child: Column(

                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    CustomText(text: item[index].statusText.name,fontWeight: FontWeight.bold,color: Colors.red,fontSize: 14,),
                                                    const SizedBox(height: 30,),
                                                    CustomText(text: item[index].changedTotal.p,color: primaryColor,fontWeight: FontWeight.bold,maxLine: 2,)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),


                          ],
                        ),
                      );
                    }),

              ],
            ),
          );
        })




    );
  }
}