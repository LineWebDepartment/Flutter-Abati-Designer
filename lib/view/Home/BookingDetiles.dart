import 'package:abati_new/Helper/extention.dart';
import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
class BookingDetiles extends StatefulWidget {
  final int id;
  const BookingDetiles({Key key, this.id}) : super(key: key);

  @override
  State<BookingDetiles> createState() => _BookingDetilesState();
}

class _BookingDetilesState extends State<BookingDetiles> {
  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false).fetchMyBookingDetails(widget.id);

    print("Mypref.getToken()");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:  Text(
            "Booking Details".tr(),
            style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontSize: 18,fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, "");
            },
            icon: SvgPicture.asset( 'assets/image/back.svg'),
          ),

        ),

        body: Consumer<APIProvider>(builder:  (BuildContext context, data, _) {

          var item = data.Bookingdetails.data;
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 1,
                  color: Colors.grey[200],
                ),

                Column(
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
                            height: 120,
                            color: Colors.grey[100],

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 3,
                                      color: Colors.black,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [

                                              CustomText(text: "Booking ID".tr(),color: grayColor,fontSize: 14,),
                                              CustomText(text: "Booking Date".tr(),color: grayColor,fontSize: 14,),
                                              CustomText(text: "Status".tr(),color: grayColor,fontSize: 14,),
                                              CustomText(text: "Invoice Ref".tr(),color: grayColor,fontSize: 14,),


                                            ],
                                          ),
                                          const SizedBox(width: 8,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [

                                              CustomText(text: ": ${item.item.id}",color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),
                                              CustomText(text: ": ${item.item.dateName}",color: Colors.black,fontSize: 14,maxLine: 2,fontWeight: FontWeight.bold),
                                              CustomText(text: ": ${item.item.statusText}",fontSize: 14,maxLine: 2,fontWeight: FontWeight.bold,color: item.item.status == "1"?Colors.amber: item.item.status == "2"?Colors.green:Colors.green,),
                                              Row(
                                                children: [
                                                  CustomText(text: ":"),
                                                  // CustomText(text: " ${22}",color: item.items[index].status == "1"?Colors.amber: item.items[index].status == "2"?Colors.green:Colors.green,fontSize: 13,fontWeight: FontWeight.bold,),
                                                ],
                                              ),



                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(

                                    width: 80,
                                    height: 30,
                                    color: Colors.white,
                                    child: Column(

                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CustomText(text: item.item.paymentMethodText,fontWeight: FontWeight.bold,),

                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(


                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow:[

                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        height: 180,
                        color: Colors.grey[100],

                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: CustomText(text: "Service Details".tr(),alignment: Alignment.centerLeft,),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(

                                    width: 130,
                                    height: 80,
                                    // color: Colors.black,
                                    child: Image.network(item.item.service.image),

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                    children: [
                                      CustomText(text: item.item.service.name),
                                      const SizedBox(height: 8,),
                                      CustomText(text: item.item.date),
                                      const SizedBox(height: 8,),
                                      CustomText(text:  "${item.item.timeFrom} - ${item.item.timeTo}"),
                                      const SizedBox(height: 8,),
                                      CustomText(text: item.item.total.p,color: primaryColor,)
                                    ],
                                  ),
                                ),




                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(


                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow:[

                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        height: 180,
                        color: Colors.grey[100],

                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  CustomText(text: "PAYMENT DETAILS".tr(),alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,),
                                  const SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(text: "SubTotal".tr(),alignment: Alignment.centerLeft,),
                                      CustomText(text: item.item.subTotal.p,alignment: Alignment.centerLeft,),
                                    ],
                                  ),
                                  const SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(text: "Discount".tr(),alignment: Alignment.centerLeft,),
                                      CustomText(text:item.item.discount.p,alignment: Alignment.centerLeft,),
                                    ],
                                  ),
                                  const SizedBox(height: 20,),
                                  Container(
                                    height: 1,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(text: "Total".tr(),alignment: Alignment.centerLeft,),
                                      CustomText(text: item.item.total.p,alignment: Alignment.centerLeft,color: primaryColor,fontWeight: FontWeight.bold,),
                                    ],
                                  ),


                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        })




    );
  }
}
