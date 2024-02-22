import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/view/Home/BookingDetiles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({Key key}) : super(key: key);

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false).fetchMyBooking();

    print(Mypref.getUser().item.accessToken);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:  Text(
          "MY BOOKINGS".tr(),
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

        var item = data.MyBooking.data;
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
                  itemCount: item.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(

                      onTap: (){

                        To(context, BookingDetiles(id: item.items[index].id,));
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


                                                  ],
                                                ),
                                                const SizedBox(width: 8,),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [

                                                    CustomText(text: ": ${item.items[index].id}",color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),
                                                    CustomText(text: ": ${item.items[index].date}",color: Colors.black,fontSize: 14,maxLine: 2,fontWeight: FontWeight.bold),
                                                    Row(
                                                      children: [
                                                        CustomText(text: ":"),
                                                        CustomText(text: " ${item.items[index].statusText}",color: item.items[index].status == "1"?Colors.amber: item.items[index].status == "2"?Colors.green:Colors.green,fontSize: 13,fontWeight: FontWeight.bold,),
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
                                          height: 80,
                                          color: Colors.white,
                                          child: Column(

                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              CustomText(text: "${item.items[index].total}",fontWeight: FontWeight.bold,),
                                              const SizedBox(height: 10,),
                                              CustomText(text: Mypref.getCurrency().shortName ,color: primaryColor,)
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
                    );
                  }),

            ],
          ),
        );
      })




    );
  }
}
