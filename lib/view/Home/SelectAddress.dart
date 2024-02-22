import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/repo/auth.dart';
import 'package:abati_new/view/Account/AddNewAddress.dart';
import 'package:abati_new/view/Home/PorductCheckout.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
class SelectAddress extends StatefulWidget {
  const SelectAddress({Key key}) : super(key: key);

  @override
  State<SelectAddress> createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> {

  var selectIndex = 0;
  var api = Api();
  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false).fetchMyAddresses();

    print("Mypref.getToken()");
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<APIProvider>(builder: (BuildContext context, data, _) {

      var item = data.MyAddres.data.items;
      return Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title:  Text(
                "SELECT ADDRESSES".tr(),
                style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontSize: 18,fontWeight: FontWeight.w600),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context, "");
                },
                icon: SvgPicture.asset( 'assets/image/back.svg'),
              ),

            ),

            body: item.isEmpty? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Center(child: SvgPicture.asset("assets/image/NoLocationData.svg")),
                const SizedBox(height: 20,),
                CustomText(text: "No Address added!".tr(),fontWeight: FontWeight.bold,) ,
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: CustomText(text: "No Address added!""No Address added!".tr(),height: 1.2,fontSize: 14,color: grayColor,),
                )
              ],
            ) :SingleChildScrollView(
              child: Column(

                children: [
                  Container(
                    height: 1,
                    color: Colors.grey[200],
                  ),
                  const SizedBox(height: 15,),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: item.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(

                          onTap: () {


                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 15),
                                child: Container(

                                  color: Colors.grey[200],
                                  child: Column(

                                    children: [

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CustomText(text: item[index].title,),
                                          ),
                                          Row(
                                            children: [

                                              IconButton(onPressed: (){



                                                setState(() {
                                                  selectIndex = index;
                                                });



                                              }, icon: SvgPicture.asset( selectIndex == index ? 'assets/image/selectedIcon.svg': 'assets/image/Unselected.svg')),
                                            ],
                                          ),
                                        ],
                                      ),


                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  CustomText(text:  "${item[index].country.name},${item[index].area.name}" ,alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,color: Color.fromRGBO(96, 96, 96, 1),fontSize: 14,height: 1.4,),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  CustomText(text: item[index].firstAddressLine,alignment:Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,color: Color.fromRGBO(96, 96, 96, 1),fontSize: 14,height: 1.4,),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  CustomText(text: item[index].secondAddressLine ?? ""  ,alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,color: Color.fromRGBO(96, 96, 96, 1),fontSize: 14,height: 1.4,),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                      width: MediaQuery.of(context).size.width*0.8,

                                                      child: CustomText(text: item[index].extraDirections ?? "" ,alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,color: Color.fromRGBO(96, 96, 96, 1),fontSize: 14,height: 1.4,maxLine: 2,)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]

                                  ),


                                ),
                              ),

                            ],
                          ),
                        );
                      }),
                  Container(
                    height: 100,
                  ),

                ],
              ),
            ),





          ),
          Positioned(

              bottom: 35,
              left: 0,
              right: 0,
              // top: 0,
              child: SizedBox(

                  width: MediaQuery.of(context).size.width,
                  child: DefaultButton(text: "Continue",onPressed: (){
                    // AddNewAddress
                    To(context,  PorductCheckout(addressId: item[selectIndex].countryId,areaId:item[selectIndex].areaId,addressTitle:item[selectIndex].title ,address1: item[selectIndex].country.name,address2: item[selectIndex].firstAddressLine,address3: item[selectIndex].secondAddressLine,));

                  },)))
        ],
      );
    });

  }
}
