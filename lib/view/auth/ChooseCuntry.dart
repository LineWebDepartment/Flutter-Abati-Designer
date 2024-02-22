import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
class ChooseCuntry extends StatefulWidget {
  final bool isMune ;
  const ChooseCuntry({Key key, this.isMune}) : super(key: key);

  @override
  State<ChooseCuntry> createState() => _ChooseCuntryState();
}

class _ChooseCuntryState extends State<ChooseCuntry> {


  String name;
  String shortname;
  String Image;
  int Selected = -1;
  int SelectedId = -1;
  String SelectedISO = "965";

   // item  CurrencyModel();
  var item = ["KWD (Kuwait)","BHD (Bahrain)","SAR (Saudi Arabia)","AED (United Arab Emirates)","QAR (Qatar)","OMR (Oman)"];
  @override
  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false).fetchSetting(true);

    print("Mypref.getToken()");

    if (widget.isMune){
      SelectedISO = Mypref.getCurrency().iso;
      name = Mypref.getCurrency().name;
      Image = Mypref.getCurrency().image;
      SelectedId = Mypref.getCurrency().id;
      shortname = Mypref.getCurrency().shortName;

    }




  }
  Widget build(BuildContext context) {

    return Consumer<APIProvider>(builder:  (BuildContext context, data, _){

      return Scaffold(
        body: Column(

          children: [
            Container(

              height: 60,


            ),
            CustomText(maxLine: 1,
              fontWeight: FontWeight.bold,
              text: "CHOOSE Currency".tr(),),
            const SizedBox(height: 20,),
            Container(height: 1, color: Colors.grey[200],),
            ListView.builder(

                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: data.Setting.data.settings.countries.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(

                    onTap: () {
                      setState(() {
                        Selected = index;
                        SelectedISO = data.Setting.data.settings.countries[index].isoCode;
                        name = data.Setting.data.settings.countries[index].currencyName;
                        Image = data.Setting.data.settings.countries[index].image;
                        SelectedId = data.Setting.data.settings.countries[index].id;
                        shortname = data.Setting.data.settings.countries[index].shortCode;
                      });
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            // color: Colors.grey,

                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Row(

                                  children: [

                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10.0),


                                            child: SvgPicture.network(data.Setting.data.settings.countries[index].image,width: 20,))),

                                    CustomText(maxLine: 1,
                                      fontWeight: FontWeight.normal,
                                      text:   data.Setting.data.settings.countries[index].currencyName,
                                      color: grayColor,
                                      fontSize: 14,),


                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8),
                                  child: SelectedId  == data.Setting.data.settings.countries[index].id ? SvgPicture.asset(
                                      "assets/image/check.svg") : SvgPicture.asset("assets/image/uncheck.svg"),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(height: 1, color: Colors.grey[200],),

                      ],
                    ),
                  );
                }),
            const SizedBox(height: 20,),
            DefaultButton(

              onPressed: () {


                if (Selected == -1){

                  AwesomeDialog(
                    dismissOnBackKeyPress: true,
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: "Error".tr(),
                    desc: "Select Your Currency".tr(),
                    btnCancelOnPress: () {
                      // Navigator.of(context, rootNavigator: false).pop();

                    },).show();


                  return;
                }

                Mypref.setCurrency(CurrencyModel(name,SelectedISO,Image,SelectedId,shortname));
                Navigator.pop(context, CurrencyModel(name,SelectedISO,Image,SelectedId,shortname));


              }, text: 'Confirm'.tr(), isBold: true,
            )


          ],
        ),
      );
    });
  }}
class CurrencyModel {
  int id ;
  String name = "";
  String iso = "";
  String image = "";
  String shortName = "";

  CurrencyModel(this.name,this.iso,this.image,this.id,this.shortName);
}