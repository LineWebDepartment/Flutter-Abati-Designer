import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/repo/auth.dart';
import 'package:abati_new/view/Account/AddNewAddress.dart';
import 'package:abati_new/view/Home/EditeAddress.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class MyAddress extends StatefulWidget {
  const MyAddress({Key key}) : super(key: key);

  @override
  State<MyAddress> createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
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
                "MY ADDRESSES".tr(),
                style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontWeight: FontWeight.w600),
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
                  child: CustomText(text: "You’ve not added any address yet. Please add new address.".tr(),height: 1.2,fontSize: 14,color: grayColor,),
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



                                                AwesomeDialog(
                                                  dismissOnBackKeyPress: true,
                                                  context: context,
                                                  dialogType: DialogType.info,
                                                  animType: AnimType.scale,
                                                  title: "Remove Address ?".tr(),
                                                  desc: "Do you really need the address to be removed from the list?".tr(),

                                                  btnCancelText: "Cancel".tr(),
                                                  btnCancelOnPress: (){},
                                                  btnOkText: "Yes, Remove".tr(),
                                                  btnOkOnPress: (){
                                                    api.deleteAddress(item[index].id, context);
                                                  },



                                                ).show();



                                              }, icon: SvgPicture.asset('assets/image/removeAddress.svg')),
                                              IconButton(onPressed: (){


                                                To(context,  EditeAddress(addressId: item[index].id,countryId: item[index].country.id,country: item[index].country.name,areaId: item[index].area.id,area: item[index].area.name,address: item[index].title,addresLine1: item[index].firstAddressLine,addresLine2: item[index].secondAddressLine,extra: item[index].extraDirections,));


                                              }, icon: SvgPicture.asset('assets/image/editeAddress.svg'))
                                            ],
                                          )
                                        ],
                                      ),


                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                CustomText(text:  "${item[index].country.name},${item[index].area.name}" ,alignment: Mypref.getlang() == "en" ? Alignment.bottomLeft :Alignment.bottomRight,color: Color.fromRGBO(96, 96, 96, 1),fontSize: 14,height: 1.4,),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                CustomText(text: item[index].firstAddressLine,alignment: Mypref.getlang() == "en" ? Alignment.bottomLeft :Alignment.bottomRight,color: Color.fromRGBO(96, 96, 96, 1),fontSize: 14,height: 1.4,),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                CustomText(text: item[index].secondAddressLine ?? ""  ,alignment: Mypref.getlang() == "en" ? Alignment.bottomLeft :Alignment.bottomRight,color: Color.fromRGBO(96, 96, 96, 1),fontSize: 14,height: 1.4,),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                CustomText(text: item[index].extraDirections ?? "" ,alignment: Mypref.getlang() == "en" ? Alignment.bottomLeft :Alignment.bottomRight,color: Color.fromRGBO(96, 96, 96, 1),fontSize: 14,height: 1.4,maxLine: 1,),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
                  child: DefaultButton(text: "Add a new address".tr(),onPressed: (){
                    // AddNewAddress
                    To(context, const AddNewAddress());

                  },)))
        ],
      );
    });

  }
}
