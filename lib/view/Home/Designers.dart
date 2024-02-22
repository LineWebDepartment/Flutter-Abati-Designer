import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/view/Home/DesignerDetails.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
class DesignerScreen extends StatefulWidget {
  const DesignerScreen({Key key}) : super(key: key);

  @override
  State<DesignerScreen> createState() => _DesignerScreenState();
}

class _DesignerScreenState extends State<DesignerScreen> {


  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false).fetchDesigners();

    print("Mypref.getToken()");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:  Text(
          "DESIGNERS".tr(),
          style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontSize: 18,fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, "");
          },
          icon: SvgPicture.asset( 'assets/image/back.svg'),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/image/bag.svg'))
        ],
      ),
      body:Consumer<APIProvider>(builder:  (BuildContext context, data, _) {

        var item = data.Designers.data;
        return  Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Container(
                height: 1,
                color: Colors.grey[200],
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: item.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return  InkWell(
                      onTap: (){


                        To(context, DesignerDetails(id: item.items[index].id,name: item.items[index].name,));
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Image(image: NetworkImage( item.items[index].image),width: 95,height: 95,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0,right: 8,top: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Container(

                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(




                                                child: CustomText(text: item.items[index].designerName,alignment: Alignment.centerLeft,fontWeight: FontWeight.bold,fontSize: 15,),),
                                              RatingBar(
                                                itemSize: 15,
                                                initialRating: item.items[index].rate,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                ratingWidget: RatingWidget(
                                                  full: SvgPicture.asset('assets/image/fellRate.svg'),
                                                  half: SvgPicture.asset('assets/image/fellRate.svg'),
                                                  empty:SvgPicture.asset('assets/image/unfellRate.svg'),
                                                ),
                                                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                              )
                                            ],
                                          ),
                                          // color: Colors.deepOrange,
                                          width: MediaQuery.of(context).size.width*0.65,
                                        ),
                                        SizedBox(height: 8,),
                                        Container(

                                          child: CustomText(text:item.items[index].designerDescription,alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,color: grayColor,height: 1.1,fontSize: 12,),width: MediaQuery.of(context).size.width * 0.55,),
                                        SizedBox(height: 8,),
                                        CustomText(text:item.items[index].discountLabel,alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,color: Colors.black,height: 1.1,fontSize: 12,)
                                      ],
                                    ),
                                  )



                                ],
                              ),
                            ),
                            Container(height: 1,color: Colors.grey[200],)
                          ],
                        ),
                      ),
                    );
                  }),

            ]);
    }







    ));
  }
}
