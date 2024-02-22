import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Currency{
  var image;
  var title;
}
class ChossesCurrency extends StatefulWidget {
  final bool isRegister;
  final bool isCusrrency;

  const ChossesCurrency({Key key,this.isRegister, this.isCusrrency}) : super(key: key,);

  @override
  State<ChossesCurrency> createState() => _ChossesCurrencyState();
}

class _ChossesCurrencyState extends State<ChossesCurrency> {


  int Selected = 0;
  String SelectedISO = "965";

  var item = ["KWD (Kuwait)","BHD (Bahrain)","SAR (Saudi Arabia)","AED (United Arab Emirates)","QAR (Qatar)","OMR (Oman)"];
  @override
  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false).fetchSetting(true);

    print("Mypref.getToken()");
  }
  Widget build(BuildContext context) {

    return Consumer<APIProvider>(builder:  (BuildContext context, data, _){
      return data.Setting.data == null ? Text('Test'): Scaffold(
        body: Column(

          children: [
            Container(

              height: 60,


            ),
            CustomText(maxLine: 1,
              fontWeight: FontWeight.bold,
              text: this.widget.isRegister ? "CHOOSE COUNTRY".tr(): "CHOOSE Currency".tr(),),
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
                                      text:  this.widget.isRegister ?data.Setting.data.settings.countries[index].name + " (${data.Setting.data.settings.countries[index].isoCode}) ":  data.Setting.data.settings.countries[index].currencyName,
                                      color: grayColor,
                                      fontSize: 14,),


                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8),
                                  child: Selected == index ? SvgPicture.asset(
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

                Navigator.pop(context, SelectedISO);


              }, text: 'Confirm'.tr(), isBold: true,
            )


          ],
        ),
      );
    });
}}
