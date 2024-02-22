import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/main.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AdsScreen extends StatefulWidget {
  const AdsScreen({Key key}) : super(key: key);

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false).fetchSetting(true);

    print("Mypref.getToken()");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
         Consumer<APIProvider>(builder:  (BuildContext context, data, _){

           return  Container(
             // color: Colors.red,
             child:  Stack(
               children: [
                 Image.network(data.Setting.data.settings.banner.image,height: MediaQuery.of(context).size.height,fit: BoxFit.cover,),
                 Positioned(

                     bottom: 30,
                     left: 0,
                     right: 0,
                     child: DefaultButton(text: "SKip".tr(),onPressed: (){

                       Mypref.setIsLogin(false);
                       To(context, Dashboard());
                     },)),


               ],
             ),
           );
         })




    );
  }
}
