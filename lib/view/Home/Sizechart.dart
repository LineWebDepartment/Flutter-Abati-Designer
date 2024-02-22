import 'package:abati_new/Helper/Pref.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SizechartScreen extends StatefulWidget {
  final String image;
  const SizechartScreen({Key key, this.image}) : super(key: key);

  @override
  State<SizechartScreen> createState() => _SizechartScreenState();
}

class _SizechartScreenState extends State<SizechartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:  Text(
          "SIZE CHART".tr(),
          style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontSize: 18,fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, "");
          },
          icon: SvgPicture.asset( 'assets/image/back.svg'),
        ),
        actions: [

        ],
      ),
      body: Column(

        children: [

          Container(
            height: 1,
            color: Colors.grey[200],
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(widget.image),
          )
        ],
      ),

    );
  }
}
