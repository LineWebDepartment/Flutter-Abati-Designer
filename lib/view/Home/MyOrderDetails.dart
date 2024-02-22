import 'package:abati_new/Helper/extention.dart';
import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/custom_widget/exit_confirmation_dialog.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/repo/auth.dart';
import 'package:abati_new/view/Home/BookingDetiles.dart';
import 'package:abati_new/view/Home/webViewScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
class MyOrderDetails extends StatefulWidget {
  final int id;

  const MyOrderDetails({Key key, this.id}) : super(key: key);

  @override
  State<MyOrderDetails> createState() => _MyOrderDetailsState();
}

class _MyOrderDetailsState extends State<MyOrderDetails> {
  var api = Api();
  @override
  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false).fetchMyOrderDetails(widget.id);

    print(Mypref.getUser().item.accessToken);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:
          CustomAppText(text: "ORDER DETAILS".tr(),fontSize: 18,fontWeight: FontWeight.w600),

          // Text(
          //   "ORDER DETAILS".tr(),
          //   style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontSize: 18,fontWeight: FontWeight.w600),
          // ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, "");
            },
              icon: Mypref.getDlang() == "en"? SvgPicture.asset('assets/image/back.svg'): SvgPicture.asset( 'assets/image/backar.svg')
          ),

        ),

        body: Consumer<APIProvider>(builder:  (BuildContext context, data, _) {



          if (data.MyOrderDetails.data == null){
            return Container();
          }
          var item = data.MyOrderDetails.data;
          return Stack(
            children: [
              Column(
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
                                      // Container(
                                      //   width: 3,
                                      //   color: Colors.black,
                                      // ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                CustomText(text: "Order Id".tr(),color: grayColor,fontSize: 14,),
                                                CustomText(text: "Order Date".tr(),color: grayColor,fontSize: 14,),
                                                CustomText(text: "No. of Items".tr(),color: grayColor,fontSize: 14,),
                                                CustomText(text: "Status".tr(),color: grayColor,fontSize: 14,),


                                              ],
                                            ),
                                            const SizedBox(width: 8,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                CustomText(text: ": ${item.item.id }",color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),
                                                CustomText(text: ": ${getFormattedDate(item.item.createdAt.toString())}",color: Colors.black,fontSize: 14,maxLine: 2,fontWeight: FontWeight.w600),
                                                CustomText(text: ": ${item.item.numOfOrders}"),

                                                Row(
                                                  children: [
                                                    CustomText(text: ": "),
                                                    CustomText(text: item.item.designerAcceptance == 0 ?"Pending".tr():item.item.designerAcceptance == 1?"Accepted".tr():"Rejected".tr(),fontSize: 14,maxLine: 2,fontWeight: FontWeight.w600,color: item.item.designerAcceptance == 0?Colors.amber:item.item.designerAcceptance == 1? Colors.green:Colors.red,),

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

                                      // width: 80,
                                      height: 30,
                                      // color: Colors.white,
                                      child: Column(

                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CustomText(text: "${item.item.total.toStringAsFixed(3)}" + " KWD".tr(),fontWeight: FontWeight.w600,color: primaryColor,),

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

                     Container(

                      // height: 200,
                      color: Colors.grey[100],
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
                            child: CustomText(text: "Product Details",alignment: Mypref.getDlang() == "en"? Alignment.centerLeft:Alignment.centerRight,fontWeight: FontWeight.w600,),
                          ),
                          ListView.builder(

                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: item.products[0].items.length,
                              itemBuilder: (BuildContext context, int Pindex) {
                                return InkWell(

                                  onTap: (){


                                  },
                                  child: Column(
                                    children: [

                                      Container(
                                        color: Colors.grey[100],
                                        child:


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
                                                height: 125,
                                                color: Colors.grey[100],

                                                child: Column(
                                                  children: [

                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [

                                                        Padding(
                                                          padding: const EdgeInsets.all(12.0),
                                                          child: Container(

                                                            // color: Colors.black,
                                                            child: Image.network(item.products[0].items[Pindex].designer.image,height: 100,width: 90,),

                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.all(16.0),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                                            children: [
                                                              CustomText(text: item.products[0].items[Pindex].product.name),
                                                              const SizedBox(height: 8,),
                                                              CustomText(text: "${item.products[0].items[Pindex].product.price.toStringAsFixed(3)}" + " KWD",color: primaryColor,),
                                                              const SizedBox(height: 8,),
                                                              Row(
                                                                children: [
                                                                  CustomText(text: item.products[0].items[Pindex].color.name ?? "", ),
                                                                  CustomText(text: " ,${item.products[0].items[Pindex].size.name ?? ""}" ),
                                                                  CustomText(text: " ,${item.products[0].items[Pindex].height.name ?? ""}" ),
                                                                ],
                                                              ),
                                                              const SizedBox(height: 8,),
                                                              Row(
                                                                children: [
                                                                  CustomText(text: "Gift wrapping".tr(),),
                                                                  SizedBox(width: 5,),
                                                                  CustomText(text: "${item.products[0].items[Pindex].giftWrapping.toStringAsFixed(3)}" + " KWD".tr() ,color: primaryColor,),
                                                                ],
                                                              )
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
                                      )


                                    ],
                                  ),
                                );
                              })
                        ],
                      ),
                    ),





                ],
              ),
              Positioned(
                bottom: 30,
                left: 15,
                right: 15,
                child: Column(
                  children: [

                    Visibility(
                      visible: item.item.designerAcceptance == 0,
                      child: InkWell(

                        onTap: (){

                          api.changeOrderStatusFromDesignerApp(widget.id.toString(),1,4, context);
                          Navigator.pop(context);
                          To(context, MyOrderDetails(id: widget.id,));
                          // showDialog(context: context, builder: (context) => ExitConfirmationDialog(onPressed: () {
                          //   api.changeOrderStatusFromDesignerApp(widget.id.toString(),1,4, context).then((value) => (){
                          //     // Provider.of<APIProvider>(context, listen: false).fetchDesinerOrders(selectedIndex);
                          //
                          //     Navigator.pop(context);
                          //     To(context, MyOrderDetails(id: widget.id,));
                          //
                          //   });
                          //
                          //   // Navigator.pop(context);
                          // },title: "Accept order?".tr(),text: "Are you sure you want to accept this order?".tr(),image: "order-history", buttonText: 'Yes, Accept'.tr(),));

                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.88,
                          color: primaryColor,
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(text: "Accept".tr(),color: Colors.white,fontWeight: FontWeight.normal,),
                              SizedBox(width: 20,),
                              SvgPicture.asset("assets/image/acppetd.svg")
                            ],
                          ),

                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Visibility(
                      visible: item.item.designerAcceptance == 0,
                      child: InkWell(

                        onTap: (){

                          api.changeOrderStatusFromDesignerApp(widget.id.toString(),2,4, context);
                          Navigator.pop(context);
                          To(context, MyOrderDetails(id: widget.id,));




                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.88,
                          color: Colors.black,
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(text: "Reject".tr(),color: Colors.white,fontWeight: FontWeight.normal,),
                              SizedBox(width: 20,),
                              SvgPicture.asset("assets/image/cancles.svg")
                            ],
                          ),

                        ),
                      ),
                    ),







                    Visibility(
                      visible: item.item.designerAcceptance == 1,
                      child: Container(
                        height: 50,
                        // width: MediaQuery.of(context).size.width * 0.88,
                        color: Color.fromRGBO(230, 214, 191, 1),
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(text: "Accepted".tr(),color: primaryColor,fontWeight: FontWeight.normal,),
                            SizedBox(width: 20,),
                            SvgPicture.asset("assets/image/accpetsl.svg")
                          ],
                        ),

                      ),
                    ),
                    Visibility(
                      visible: item.item.designerAcceptance == 2,
                      child: Container(
                        height: 50,
                        // width: MediaQuery.of(context).size.width * 0.88,
                        color: Color.fromRGBO(224, 224, 224, 1),
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(text: "Rejected".tr(),color: Colors.black,fontWeight: FontWeight.normal,),
                            SizedBox(width: 20,),
                            SvgPicture.asset("assets/image/rejectst.svg")
                          ],
                        ),

                      ),
                    ),
                  ],
                ),
              ),

            ],
          );
        })




    );


  }

  String getFormattedDate(String date) {
    /// Convert into local date format.
    var localDate = DateTime.parse(date).toLocal();

    /// inputFormat - format getting from api or other func.
    /// e.g If 2021-05-27 9:34:12.781341 then format should be yyyy-MM-dd HH:mm
    /// If 27/05/2021 9:34:12.781341 then format should be dd/MM/yyyy HH:mm
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(localDate.toString());

    /// outputFormat - convert into format you want to show.
    var outputFormat = DateFormat('dd/MM/yyyy HH:mm');
    var outputDate = outputFormat.format(inputDate);
    return outputDate.toString();
  }

}
