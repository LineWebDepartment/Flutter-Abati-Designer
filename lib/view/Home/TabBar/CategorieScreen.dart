import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/custom_widget/exit_confirmation_dialog.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/main.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/repo/auth.dart';
import 'package:abati_new/view/Home/Categories/ServicesGategories.dart';
import 'package:abati_new/view/Home/Designers.dart';
import 'package:abati_new/view/Home/MyOrderDetails.dart';
import 'package:abati_new/view/Home/Videos/VideosDetiles.dart';
import 'package:abati_new/view/ProductCategories.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  var selectedIndex = 0;
  var isNew = true;
  var api = Api();
  var listData = ["Pending".tr(),"Accepted".tr(),"Rejected".tr()];
  TextEditingController textController = TextEditingController() ;

  @override
  void initState() {
    super.initState();
    // Provider.of<APIProvider>(context, listen: false).fetchDesinerOrders();
    Provider.of<APIProvider>(context, listen: false).fetchDesinerOrders(selectedIndex,"",false);

  }
  @override
  Widget build(BuildContext context) {

    return Consumer<APIProvider>(builder:  (BuildContext context, data, _) {

      var item = data.Order.data;
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
                          child: CustomText(text: "ORDERS".tr(),fontWeight: FontWeight.w600,),
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
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15, top: 10, bottom: 15),
                child: InkWell(

                  onTap: (){

                    // To(context, const SearchScreen());
                  },
                  child: Container(

                    height: 50,
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [


                          // CustomText(text: "Search here".tr(), fontSize: 14,),

                          SizedBox(
                            width: 300,
                            child:  TextField(
                              controller: textController,
                              style:  const TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'RobotoSlab'
                              ),
                              keyboardType: TextInputType.text, //Set keyboard type for email address. This will show @ button on the primary section of the keyboard.
                              decoration:   InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search here'.tr()), // Set the hint text that will be shown when TextField is empty
                            ),),
                          InkWell(

                              onTap: (){

                                // Provider.of<APIProvider>(context, listen: false).fetchDesinerOrders();
                                setState(() {
                                  Provider.of<APIProvider>(context, listen: false).fetchDesinerOrders(selectedIndex,textController.text,true);

                                });

                              },
                              child:  Icon(Icons.search))
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: false,
                    itemBuilder: (_, index) =>Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            selectedIndex = index;
                            // Provider.of<APIProvider>(context, listen: false).fetchDesinerOrders(selectedIndex);
                            Provider.of<APIProvider>(context, listen: false).fetchDesinerOrders(selectedIndex,"",false);
                            textController.text = "";

                          });
                        },
                        child: Container(


                          height: 50,
                          width: 160,
                          decoration: BoxDecoration(border: Border.all(color: primaryColor),color: index == selectedIndex ? Color.fromRGBO(255, 250, 242, 1) :Colors.white),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.s,
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset("assets/image/orderhistory.svg",color: index == selectedIndex ? primaryColor:Colors.grey,),
                              ),
                              CustomText(text: listData[index],color: index == selectedIndex ? primaryColor:Colors.grey,),
                              const SizedBox(width: 25,),
                              Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(

                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: CustomText(text: index == 0 ? item.pendingTotal.toString() : index == 1? item.acceptedTotal.toString():item.rejectedTotal.toString(),color: Colors.white,),

                                  ),
                                ],
                              )
                            ],),

                        ),
                      ),
                    ),
                    itemCount: 3,
                  )
                ),
              ),


              item.items.isEmpty ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),
                  Center(child: SvgPicture.asset("assets/image/noorder.svg")),
                  const SizedBox(height: 20,),
                  CustomText(text: "Nothing to show!".tr(),fontWeight: FontWeight.bold,fontSize: 22,)
                ],
              ):  ListView.builder(

                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: item.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(

                      onTap: (){

                        To(context, MyOrderDetails(id: item.items[index].id,));


                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(



                              decoration: BoxDecoration(
                                color: Colors.grey[100],
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
                                child: Column(
                                  children: [
                                    Container(
                                      height: 95,
                                      color: Colors.grey[100],

                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
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


                                                      ],
                                                    ),
                                                    const SizedBox(width: 8,),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [

                                                        CustomText(text: ": ${item.items[index].id.toString()}",color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),
                                                        CustomText(text: ": ${getFormattedDate(item.items[index].createdAt.toString()) }",color: Colors.black,fontSize: 14,maxLine: 2,fontWeight: FontWeight.bold),
                                                        Row(
                                                          children: [
                                                            CustomText(text: ":"),
                                                            CustomText(text: item.items[index].numOfOrders.toString(),fontWeight: FontWeight.bold,fontSize: 14,),
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

                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Container(


                                                  width: 100,
                                                  height: 80,
                                                  // color: Colors.white,
                                                  child: Column(

                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      CustomText(text: item.items[index].total.toStringAsFixed(3) + " KWD".tr(),fontWeight: FontWeight.w700,color: primaryColor,fontSize: 14,),
                                                      const SizedBox(height: 40,),
                                                      CustomText(text: "",color: primaryColor,fontWeight: FontWeight.bold,maxLine: 2,)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    Visibility(
                                      visible: selectedIndex == 0,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          InkWell(


                                            child: Container(
                                              height: 40,
                                              width: MediaQuery.of(context).size.width * 0.4,
                                              color: primaryColor,
                                              child: Row(

                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  CustomText(text: "Accept".tr(),color: Colors.white,fontWeight: FontWeight.bold,),
                                                  SizedBox(width: 20,),
                                                  SvgPicture.asset("assets/image/accpetiocn.svg")
                                                ],
                                              ),

                                            ),

                                            onTap: (){
                                              showDialog(context: context, builder: (context) => ExitConfirmationDialog(onPressed: () {
                                                api.changeOrderStatusFromDesignerApp(item.items[index].id.toString(),1,selectedIndex, context).then((value) => (){
                                                  // Provider.of<APIProvider>(context, listen: false).fetchDesinerOrders(selectedIndex);

                                                });

                                                // Navigator.pop(context);
                                              },title: "Accept order?".tr(),text: "Are you sure you want to accept this order?".tr(),image: "order-history", buttonText: 'Yes, Accept'.tr(),));

                                            },
                                          ),
                                          const SizedBox(width: 8,),
                                          InkWell(
                                            onTap: (){


                                              showDialog(context: context, builder: (context) => ExitConfirmationDialog1(onPressed: () {
                                                api.changeOrderStatusFromDesignerApp(item.items[index].id.toString(),2,selectedIndex, context);


                                              },title: "Reject order?".tr(),text: "Are you sure you want to Reject this order?".tr(),image: "order-history1", buttonText: 'Yes, Reject'.tr(),));
                                            }
                                            ,

                                            child: Container(
                                              height: 40,
                                              width: MediaQuery.of(context).size.width * 0.4,
                                              color:  Colors.black,
                                              child: Row(

                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  CustomText(text: "Reject".tr(),color: Colors.white,fontWeight: FontWeight.bold,),
                                                  SizedBox(width: 20,),
                                                  SvgPicture.asset("assets/image/Rejecticon.svg")
                                                ],
                                              ),

                                            ),
                                          ),
                                        ],
                                      ),
                                    ),


                                    Visibility(
                                      visible: selectedIndex == 2,
                                      child: Container(
                                        height: 40,
                                        width: MediaQuery.of(context).size.width * 0.88,
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
                                    Visibility(
                                      visible: selectedIndex == 1,
                                      child: Container(
                                        height: 40,
                                        width: MediaQuery.of(context).size.width * 0.88,
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
                                    const SizedBox(height: 10,),

                                  ],
                                ),
                              ),
                            ),
                          ),




                        ],
                      ),
                    );
                  }),





            ]
            ,
          ),
        ),
      );
    });
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
