import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/repo/auth.dart';
import 'package:abati_new/view/Home/Videos/VideosDetiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
class webViewScreen extends StatefulWidget {
  final int index;
  final String title;
  const webViewScreen({Key key, this.index, this.title}) : super(key: key);

  @override
  State<webViewScreen> createState() => _webViewScreenState();
}

class _webViewScreenState extends State<webViewScreen> {


  @override
  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false).fetchSetting(false);
    print("${ Mypref.getlang()}   ->> Mypref.getlang() Mypref.getlang()");

    print("Mypref.getToken()");
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<APIProvider>(builder: (BuildContext context, data, _) {
      var item = data.Setting.data;
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          // title:  Text(
          //   widget.title,
          //   style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontWeight: FontWeight.w600,fontSize: 18),
          // ),

          title: CustomAppText(text: widget.title,fontWeight: FontWeight.w600,fontSize: 18),

          leading: IconButton(
              onPressed: () {
                Navigator.pop(context, "");
              },
              icon: Mypref.getDlang() == "en"? SvgPicture.asset('assets/image/back.svg'): SvgPicture.asset( 'assets/image/backar.svg')
          ),

        ),
        body: ListView(
          children: [
            Container(
              height: 1,
              color: Colors.grey[200],
            ),

            Visibility(
              visible: widget.index == 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 15,right: 15),
                child: Container(
                  height: 230,
                  child: Stack(

                    children: [
                      SvgPicture.asset("assets/image/Componentcel.svg"),
                      Positioned(
                        top: 20,
                        left: 20,
                        right: 20,
                        child: Center(
                          child: Column(
                            children: [

                              Container(


                                  child: Image.asset("assets/image/applogo.png",fit: BoxFit.fill,)),
                              // Container(
                              //
                              //   height: 140,
                              //   width: 140,
                              //
                              //
                              //   decoration: BoxDecoration(
                              //     // color: Colors.red,
                              //       border: Border.all(color: Colors.grey[200],width: 2)
                              //   ),
                              //
                              //   child: Padding(
                              //     padding: const EdgeInsets.all(5.0),
                              //
                              //     // SvgPicture.asset("assets/image/.svg"),
                              //
                              //     child:
                              //   ),
                              // ),

                            ],
                          ),
                        ),
                      ),
                    ],

                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child:

                Html(

                  data:item.settings.pages[widget.index].description ,
                )
              // CustomText(height:1.25,color:grayColor, text: ,),
            )



          ],
        ),
      );
    });

  }
}
class CustomAppText extends StatelessWidget {
  final String text;

  final double fontSize;

  final Color color;

  final Alignment alignment;

  final int maxLine;
  final double height;
  final FontWeight fontWeight;
  final bool isPrice;

  // final fontweight fontWeight;

  CustomAppText({
    this.isPrice = false,
    this.text = '',
    this.fontSize = 16,
    this.color = Colors.black,
    this.alignment = Alignment.center,
    // this.maxLine,
    this.height = 1,  this.maxLine,  this.fontWeight,
    // this.fontWeight
    // this.fontWeight = fontWeight
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      textAlign: TextAlign.center,
      style: TextStyle(

        fontWeight:fontWeight ,
        color: color,
        height: height,
        fontSize: fontSize,
        decoration: this.isPrice ?   TextDecoration.lineThrough :null,


        fontFamily:  Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',
      ),
      maxLines: maxLine,



    );
  }
}
