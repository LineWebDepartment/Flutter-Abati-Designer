import 'package:abati_new/Helper/extention.dart';
import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/custom_widget/exit_confirmation_dialog.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/main.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/repo/auth.dart';
import 'package:abati_new/view/CartScreen.dart';
import 'package:abati_new/view/Home/CheckoutService.dart';
import 'package:abati_new/view/Home/GuestInformation.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
class ServiceScreen extends StatefulWidget {
  final int id;
  final String name;
  const ServiceScreen({Key key, this.id, this.name}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {

  var selectedIndex = 0;
  var selectedDateIndex = 0;
  var selectedSolIndex = 0;
  var dateId ;
  var soltId ;
  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false).fetchServiceDetails(this.widget.id);

  }
  @override
  Widget build(BuildContext context) {
    return Consumer<APIProvider>(builder:  (BuildContext context, data, _) {

      var item = data.ServiceDetail;
      return Scaffold(

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:  Text(
            this.widget.name,
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
                onPressed: () {

                  To(context, const CartScreen());
                }, icon: SvgPicture.asset('assets/image/bag.svg'))
          ],
        ),
        body: Stack(children: [
          SingleChildScrollView(
            child:Column(
              children: [
                Container(
                  height: 1,
                  color: Colors.grey[200],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0,left: 15,right: 15),
                  child: Column(
                    children: [
                      Container(
                        height: 250,
                        color: Colors.grey[500],
                        child: Image(
                          image: NetworkImage(
                              item.data.item.images[0].attachment),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(

                            scrollDirection: Axis.horizontal,
                            itemCount: item.data.item.images.length -1,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return Padding(
                                padding:
                                const EdgeInsets.only(left: 5.0, right: 5, bottom: 10),
                                child: InkWell(
                                  onTap: () {

                                    // To(context, ServiceScreen(id:item.data.item. ,));
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (BuildContext context) =>
                                    //         VideosDetiles()));
                                    //
                                  },
                                  child:Column(
                                    children: [
                                      Container(
                                        // color: Colors.black,
                                        width: 130,
                                        height: 90,
                                        child: Image(
                                          image: NetworkImage(
                                              item.data.item.images[index+1].attachment),
                                          fit: BoxFit.cover,
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              );
                            }
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [


                          CustomText(text: item.data.item.price.p,color: primaryColor,fontWeight: FontWeight.bold,),
                          Text(
                            item.data.item.priceOffer.p,
                            style: TextStyle(
                                fontSize: 15,
                                decoration: TextDecoration.lineThrough,
                                color: Colors.black
                            ),
                          ),
                        ],),
                      const SizedBox(height: 30,),
                      Container(
                        height: 1,
                        color: Colors.grey[200],
                      ),
                      const SizedBox(height: 30,),
                      Column(
                        children: [
                          Row(
                            children: [
                              CustomText(text: "Description".tr(),alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              CustomText(text: item.data.item.fullDescription,alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,color: grayColor,height: 1.3,fontSize: 12,),
                            ],
                          ),

                        ],
                      ),
                      const SizedBox(height: 30,),
                      Container(
                        height: 1,
                        color: Colors.grey[200],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          CustomText(text: "Date".tr(),alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        height: 65,
                        child: ListView.builder(

                            scrollDirection: Axis.horizontal,
                            itemCount: item.data.item.dates.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return Padding(
                                padding:
                                const EdgeInsets.only(left: 5.0, right: 5, bottom: 5),
                                child: InkWell(
                                  onTap: () {

                                    setState(() {
                                      selectedDateIndex = index;
                                      selectedSolIndex = 0;
                                      dateId =  item.data.item.dates[index].id;
                                    });
                                  },
                                  child:Column(
                                    children: [
                                      Container(

                                        decoration: BoxDecoration(
                                            color: selectedDateIndex == index ?  primaryColor:Colors.white,
                                            border: Border.all(color: selectedDateIndex == index ?primaryColor : Colors.black)
                                        ),
                                        width: 100,
                                        height: 60,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CustomText(text: item.data.item.dates[index].name,fontSize: 12,fontWeight: FontWeight.bold,color: selectedDateIndex == index ?Colors.white:Colors.black,),
                                            const SizedBox(height: 8,),
                                            CustomText(text: item.data.item.dates[index].date.toString(),fontSize: 12,color: selectedDateIndex == index ?Colors.white:Colors.black,),
                                          ],
                                        ),

                                      ),

                                    ],
                                  ),
                                ),
                              );
                            }
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          CustomText(text: "Time slot".tr(),alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        height: 65,
                        child: ListView.builder(

                            scrollDirection: Axis.horizontal,
                            itemCount: item.data.item.dates[selectedIndex].slots.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return Padding(
                                padding:
                                const EdgeInsets.only(left: 5.0, right: 5, bottom: 5),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedSolIndex = index;
                                      soltId = item.data.item.dates[selectedDateIndex].slots[index].id;
                                    });
                                  },
                                  child:Column(
                                    children: [
                                      Container(
                                        // color: Colors.black,
                                        decoration: BoxDecoration(
                                            border: Border.all(color:  selectedSolIndex == index ?primaryColor : Colors.black),
                                            color: selectedSolIndex == index ?  primaryColor:Colors.white,

                                        ),
                                        // width: 100,
                                        height: 45,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              CustomText(text: item.data.item.dates[selectedDateIndex].slots[index].from,fontSize: 12,color: selectedSolIndex == index ?Colors.white:Colors.black,),
                                              CustomText(text: " - ",fontSize: 12,color: selectedSolIndex == index ?Colors.white:Colors.black,),
                                              CustomText(text: item.data.item.dates[selectedDateIndex].slots[index].to,fontSize: 12,color: selectedSolIndex == index ?Colors.white:Colors.black,),
                                            ],
                                          ),
                                        ),

                                      ),

                                    ],
                                  ),
                                ),
                              );
                            }
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        height: 1,
                        color: Colors.grey[200],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          CustomText(text: "RELATED VIDEOS".tr(),alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        height: 250,
                        child: Stack(

                          children: [


                            PageView.builder(
                                onPageChanged: (index){

                                  setState(() {
                                    selectedIndex = index ;
                                  });
                                },
                                itemCount:item.data.item.videos.length,
                                pageSnapping: true,
                                itemBuilder: (context,pagePosition){
                                  return InkWell(
                                    onTap: (){
                                      launchURL(item.data.item.videos[selectedIndex].video.url);

                                    },
                                    child: Container(

                                        height: 250,
                                        color: Colors.black,
                                        child: Image.network(item.data.item.videos[pagePosition].video.image,fit: BoxFit.cover,)),
                                  );

                                  // margin: EdgeInsets.all(10),

                                }),
                            Center(child: SvgPicture.asset('assets/image/Iconplay.svg')),

                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Center(
                        child: DotsIndicator(
                          dotsCount: item.data.item.videos.length,
                          position: selectedIndex * 1.0,
                          decorator: DotsDecorator(
                            // color: primaryColor,
                            activeColor: primaryColor,
                            size: const Size.square(6.0),
                            activeSize: const Size(20.0, 6.0),
                            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          CustomText(text: "RELATED SERVICE".tr(),alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,),
                        ],
                      ),

                      Container(
                        height: 230,
                        child: Expanded(
                            child:  ListView.builder
                              (

                                scrollDirection: Axis.horizontal,
                                itemCount: item.data.item.relateds.length,
                                itemBuilder: (BuildContext ctxt, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 0.0,top: 15),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10.0),
                                          child: Container(
                                            // color: Colors.red,
                                            height: 120,
                                            width: 180,
                                            child: Image(
                                              image: NetworkImage(
                                                  item.data.item.relateds[index].related.image),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 100,
                                          child: CustomText(
                                            text: item.data.item.relateds[index].related.name,
                                            fontSize: 13,
                                            alignment: Alignment.centerLeft,
                                            maxLine: 1,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            CustomText(
                                              text:item.data.item.relateds[index].related.priceOffer == null ?  item.data.item.relateds[index].related.price.p:item.data.item.relateds[index].related.priceOffer.p,
                                              fontSize: 13,
                                              alignment: Alignment.centerLeft,
                                              maxLine: 1,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Visibility(

                                              child: CustomText(
                                                isPrice: true,
                                                text:item.data.item.relateds[index].related.price.p,
                                                fontSize: 12,
                                                alignment: Alignment.centerLeft,
                                                maxLine: 1,

                                                color: Colors.grey,

                                              ),
                                              visible: item.data.item.relateds[index].related.priceOffer != null ,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }
                            )),
                      ),
                      const SizedBox(height: 50,),




                    ],
                  ),
                ),






              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultButton(text: "Book Now".tr(),onPressed: (){
                    print(soltId);
                    print(dateId);


                    if (Mypref.IsLogin() == false){
                      showDialog(context: context, builder: (context) => ProceedCheckoutDialog(onPressed: () {

                        // To(context, GuestInformation())
                        To(context, GuestInformation(id: widget.id,name: widget.name,date: "${item.data.item.dates[selectedDateIndex].name} - ${item.data.item.dates[selectedDateIndex].date} , ${item.data.item.dates[selectedDateIndex].slots[selectedSolIndex].from} - ${item.data.item.dates[selectedDateIndex].slots[selectedSolIndex].to} ",dateId: dateId,soltId: soltId, ));


                      },title: "PROCEED TO CHECKOUT".tr(),text: "Would you like to  Signin or Signup?".tr(),image: "bag", buttonText: 'Continue as Guest'.tr(),));

                    }else{
                      To(context, CheckoutService(id: widget.id,name: widget.name,date: "${item.data.item.dates[selectedDateIndex].name} - ${item.data.item.dates[selectedDateIndex].date} , ${item.data.item.dates[selectedDateIndex].slots[selectedSolIndex].from} - ${item.data.item.dates[selectedDateIndex].slots[selectedSolIndex].to} ",dateId: dateId,soltId: soltId, ));

                    }



                  },),
                ],
              ),
            ),
          )

        ],),
      );
    });

  }
}
