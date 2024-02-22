import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/custom_textfiled.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/repo/auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class EditeAddress extends StatefulWidget {
  final int addressId;
  final int countryId;
  final int areaId;
  final String area;
  final String country;
  final String address;
  final String addresLine1;
  final String addresLine2;
  final String extra;


  const EditeAddress({Key key, this.countryId, this.areaId, this.area, this.country, this.address, this.addresLine1, this.addresLine2, this.extra, this.addressId}) : super(key: key);

  @override
  State<EditeAddress> createState() => _EditeAddressState();
}

class _EditeAddressState extends State<EditeAddress> {
  var selectedIndex= 0;
  var countryId = 0;
  var areaId = 0;

  var api = Api();
  TextEditingController countryTF = TextEditingController() ;
  TextEditingController areaTF = TextEditingController() ;
  TextEditingController addressTitle = TextEditingController() ;
  TextEditingController addresLine = TextEditingController() ;
  TextEditingController addresLine2 = TextEditingController() ;
  TextEditingController extra = TextEditingController() ;

  void initState() {
    super.initState();
    // Provider.of<APIProvider>(context, listen: false).fetchSetting();

    countryId = widget.countryId;
    areaId = widget.areaId;
    areaTF.text = widget.area;
    countryTF.text = widget.country;
    addressTitle.text = widget.address;
    addresLine.text= widget.addresLine1;
    addresLine2.text = widget.addresLine2;
    extra.text = widget.extra;


  }
  @override
  Widget build(BuildContext context) {
    return Consumer<APIProvider>(builder:  (BuildContext context, data, _) {

      var item = data.Setting.data;

      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:  Text(
            "EDIT ADDRESSES".tr(),
            style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontWeight: FontWeight.w600,fontSize: 18),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, "");
            },
            icon: SvgPicture.asset( 'assets/image/back.svg'),
          ),

        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 1,
                color: Colors.grey[200],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0,left: 15,right: 15),
                child: Column(
                  children:   [
                    CustomTextField(text: "Address Title *".tr(),controller: addressTitle,),
                    SizedBox(height: 12,),
                    InkWell(

                      onTap: (){

                        showCustomModalBottomSheet(
                          useRootNavigator:true,
                          // barrierColor: Colors.grey[200].a,
                          backgroundColor: Colors.white,
                          context: context, builder: (context) => SingleChildScrollView(
                          controller: ModalScrollController.of(context),
                          child: Container(

                              decoration: BoxDecoration(
                                  color: Colors.white,

                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(10) )

                              ),
                              height: 400,


                              child: SingleChildScrollView(
                                child: Column(
                                  children: [

                                    Container(height: 90,color: Color.fromRGBO(248, 248, 248, 1),


                                      child: Stack(
                                        children: [

                                          Row(



                                            children: [
                                              IconButton(onPressed: (){
                                                Navigator.pop(context);
                                              }, icon: SvgPicture.asset("assets/image/close.svg"),),

                                            ],
                                            mainAxisAlignment: MainAxisAlignment.end,
                                          ),
                                          Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                const SizedBox(height: 10,),
                                                CustomText(text: "CHOOSE COUNTRY".tr(),fontWeight: FontWeight.bold,)

                                              ],
                                            ),
                                          )
                                        ],
                                      ),

                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: item.settings.countries.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(

                                          onTap: (){

                                            setState(() {

                                              countryId = item.settings.countries[index].id;
                                              selectedIndex = index;
                                              countryTF.text = item.settings.countries[index].name;
                                              // specialSize = false;
                                              // selectedHeightText = item.item.colors[selectedIndex].variations[index].height.name;
                                              // selectedHeight = item.item.colors[selectedIndex].variations[index].height.id;

                                              // Vechicl.text = "${item[index].brand} - ${item[index].model} - ${item[index].plateNumber}";
                                              // selectedVechile = item[index].id;
                                              // latitude = item[index].l;



                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(20.0),
                                                child: CustomText(text:  item.settings.countries[index].name ,alignment: Alignment.center,),
                                              ),
                                              Visibility(


                                                  child: Container(height: 1,width: MediaQuery.of(context).size.width -70,color: Colors.grey[100],))
                                            ],
                                          ),
                                        );
                                      },
                                    ),



                                  ],
                                ),
                              )

                          ),
                        ),);
                      },
                      child: Container(

                        height: 50,

                        decoration:  BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.grey[300],width: 1)

                        ),
                        child:  Padding(
                          padding:  EdgeInsets.only(left: 15.0,right: 0),
                          child: TextField(

                            style:  TextStyle(
                                fontSize: 13
                            ),
                            keyboardType: TextInputType.text,


                            controller: countryTF,
                            decoration:  InputDecoration(



                              enabled: false,
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.keyboard_arrow_down_sharp,color: Colors.black,),
                              hintText: "Kuwait".tr(),


                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    InkWell(

                      onTap: (){


                        if (countryId == 0) {

                          AwesomeDialog(
                            dismissOnBackKeyPress: true,
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: "",
                            desc: "please select country ".tr(),
                            btnOkText: "Ok".tr(),
                            btnOkOnPress: (){}
                            ,).show();
                          return;
                        }
                        showCustomModalBottomSheet(
                          useRootNavigator:true,
                          // barrierColor: Colors.grey[200].a,
                          backgroundColor: Colors.white,
                          context: context, builder: (context) => SingleChildScrollView(
                          controller: ModalScrollController.of(context),
                          child: Container(

                              decoration: BoxDecoration(
                                  color: Colors.white,

                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(10) )

                              ),
                              height: 400,


                              child: SingleChildScrollView(
                                child: Column(
                                  children: [

                                    Container(height: 90,color: Color.fromRGBO(248, 248, 248, 1),


                                      child: Stack(
                                        children: [

                                          Row(



                                            children: [
                                              IconButton(onPressed: (){
                                                Navigator.pop(context);
                                              }, icon: SvgPicture.asset("assets/image/close.svg"),),

                                            ],
                                            mainAxisAlignment: MainAxisAlignment.end,
                                          ),
                                          Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                const SizedBox(height: 10,),
                                                CustomText(text: "CHOOSE COUNTRY".tr(),fontWeight: FontWeight.bold,)

                                              ],
                                            ),
                                          )
                                        ],
                                      ),

                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: item.settings.countries.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(

                                          onTap: (){

                                            setState(() {

                                              areaId = item.settings.countries[selectedIndex].areas[index].id;

                                              areaTF.text = item.settings.countries[selectedIndex].areas[index].name;
                                              // specialSize = false;
                                              // selectedHeightText = item.item.colors[selectedIndex].variations[index].height.name;
                                              // selectedHeight = item.item.colors[selectedIndex].variations[index].height.id;

                                              // Vechicl.text = "${item[index].brand} - ${item[index].model} - ${item[index].plateNumber}";
                                              // selectedVechile = item[index].id;
                                              // latitude = item[index].l;



                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(20.0),
                                                child: CustomText(text:  item.settings.countries[selectedIndex].areas[index].name ,alignment: Alignment.center,),
                                              ),
                                              Visibility(


                                                  child: Container(height: 1,width: MediaQuery.of(context).size.width -70,color: Colors.grey[100],))
                                            ],
                                          ),
                                        );
                                      },
                                    ),



                                  ],
                                ),
                              )

                          ),
                        ),);
                      },
                      child: Container(

                        height: 50,

                        decoration:  BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.grey[300],width: 1)

                        ),
                        child:  Padding(
                          padding:  EdgeInsets.only(left: 15.0,right: 0),
                          child: TextField(

                            style:  TextStyle(
                                fontSize: 13
                            ),
                            keyboardType: TextInputType.text,


                            controller: areaTF,
                            decoration:  InputDecoration(



                              enabled: false,
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.keyboard_arrow_down_sharp,color: Colors.black,),
                              hintText: "Area*".tr(),


                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    CustomTextField(text: "Address Line 1 *".tr(),heightBox: 100,controller: addresLine,),
                    SizedBox(height: 12,),
                    CustomTextField(text: "Address Line 2".tr(),heightBox: 100,controller: addresLine2,),
                    SizedBox(height: 12,),
                    CustomTextField(text: "Extra Directions".tr(),heightBox: 100,controller: extra,),
                    SizedBox(height: 12,),

                  ],
                ),
              ),
              const SizedBox(height: 20,),
              DefaultButton(text: "Update".tr(),onPressed: (){

                if (addressTitle.text.isEmpty || addresLine.text.isEmpty ||countryTF.text.isEmpty||areaTF.text.isEmpty){
                  AwesomeDialog(
                    dismissOnBackKeyPress: true,
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: "Input Error".tr(),
                    desc: "please fill all required field".tr(),
                    btnOkText: "Ok",
                    btnOkOnPress: (){}
                    ,).show();
                  return;
                }


                api.editeAddress( widget.addressId,addressTitle.text, countryId, areaId, addresLine.text, addresLine2.text, extra.text, context);



              },)



            ],
          ),
        ),
      );
    });

  }
}
