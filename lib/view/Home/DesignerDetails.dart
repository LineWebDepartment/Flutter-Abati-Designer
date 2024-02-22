import 'package:abati_new/view/Home/ProductDetails.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:abati_new/Helper/extention.dart';
import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/exit_confirmation_dialog.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/repo/auth.dart';
import 'package:abati_new/view/CartScreen.dart';
import 'package:abati_new/view/Home/Videos/VideosDetiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class DesignerDetails extends StatefulWidget {
  final int id;
  final String name;
  const DesignerDetails({Key key, this.id, this.name}) : super(key: key);

  @override
  State<DesignerDetails> createState() => _DesignerDetailsState();
}

class _DesignerDetailsState extends State<DesignerDetails> {
  var isVisble = false;
  var isProduct = true;
  var api = Api();

  @override
  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false).fetchDesignerDetails(widget.id);
    Provider.of<APIProvider>(context, listen: false).fetchDesignerRates(widget.id);
    // Provider.of<APIProvider>(context, listen: false).fetchCelebrityServices(2);

    print("Mypref.getToken()");
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<APIProvider>(builder: (BuildContext context, data, _) {
      var item = data.DesignerDetail.data;
      var rate = data.DesignerRates.data;
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:  Text(widget.name ?? "",
            style:  TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontSize: 18,fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, "");
            },
            icon: SvgPicture.asset( 'assets/image/back.svg'),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  To(context, const CartScreen());

                },
                icon: SvgPicture.asset('assets/image/bag.svg'))
          ],
        ),
        body: ListView(
          children: [
            Container(
              height: 1,
              color: Colors.grey[200],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 15,right: 15),
              child: Container(
                height: 330,
                decoration: BoxDecoration(

                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),

                child: Stack(

                  children: [

                    SvgPicture.asset("assets/image/Componentcel.svg"),
                    Positioned(

                        top: -10,
                        right: -10,
                        child: InkWell(
                            onTap: () async {

                              // Share.share(item.item.designer.urlLink);

                              // share(item.item.celebrity.urlLink);
                              // await FlutterShare.share(
                              //     title: 'share link',
                              //     text: 'share link',
                              //     linkUrl:item.item.celebrity.urlLink,
                              //     chooserTitle: 'share link'
                              // );
                            },

                            child: SvgPicture.asset("assets/image/sharchProduct.svg"))),

                    Positioned(
                      top: 40,
                      left: 20,
                      right: 20,
                      child: Center(
                        child: Column(
                          children: [
                            Container(

                              height: 180,
                              width: 180,


                              decoration: BoxDecoration(
                                // color: Colors.red,
                                  border: Border.all(color: Colors.grey[200],width: 2)
                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.network(item.item.designer.image,fit: BoxFit.cover,),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            InkWell(
                              onTap: (){

                                setState(() {

                                  isProduct = !isProduct;
                                });

                              },
                              child: RatingBar(

                                itemSize: 25,
                                ignoreGestures: true,
                                initialRating: item.item.designer.rate,
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
                              ),
                            ),
                            const SizedBox(height: 10,),
                            CustomText(text: item.item.designer.designerDescription,height: 1.2,color: grayColor,maxLine: 3,fontSize: 13,)
                          ],
                        ),
                      ),
                    ),
                  ],

                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),



            Visibility(

                visible: isProduct ,
                child: item.item.items.length == 0 ? Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    children: [

                      SvgPicture.asset("assets/image/noProduct.svg"),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: "NO PRODUCT TO SHOW!".tr(),
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                ): Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0,right: 15),
                          child: Container(
                            height: 40,
                            color: Colors.grey[200],

                            child: Row(

                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    CustomText(text: "SORT".tr(),fontSize: 14,),
                                    SizedBox(width: 5,),
                                    SvgPicture.asset("assets/image/sorting.svg")
                                  ],
                                ),
                                Container(width: 60,),
                                Container(height: 25,width: 1,color: Colors.grey[400],),
                                Container(width: 60,),
                                Row(
                                  children: [
                                    CustomText(text: "FILTER".tr(),fontSize: 14,),
                                    SizedBox(width: 5,),
                                    SvgPicture.asset("assets/image/filter.svg")
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [

                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.6),
                            itemBuilder: (_, index) => Padding(
                              padding:
                              const EdgeInsets.only(left: 5.0, right: 5, bottom: 10),
                              child: InkWell(
                                onTap: () {
                                  To(context,ProductDetails(id: item.item.items[index].id,));

                                  //
                                },
                                child: Stack(
                                  children: [
                                    Column(
                                      children: [

                                        Container(
                                          color: Colors.black,
                                          height: 220,
                                          child: Image(
                                            image: NetworkImage(
                                                item.item.items[index].image),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CustomText(
                                          text: item.item.items[index].name,
                                          fontSize: 13,
                                          alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,
                                          maxLine: 1,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            CustomText(
                                              text:item.item.items[index].priceOffer == null ? item.item.items[index].price.p:item.item.items[index].priceOffer.p,
                                              fontSize: 13,
                                              alignment:Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,
                                              maxLine: 1,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Visibility(
                                              visible: item.item.items[index].priceOffer != null,
                                              child: CustomText(
                                                isPrice: true,
                                                text: item.item.items[index].price.p,
                                                fontSize: 12,
                                                alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,
                                                maxLine: 1,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CustomText(
                                          text:
                                          "SKU : ${item.item.items[index].sku}",
                                          fontSize: 12,
                                          alignment:Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,
                                          maxLine: 1,
                                          // color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                        top: -10,
                                        right: -10,
                                        child: InkWell(

                                          onTap: (){
                                            if (!Mypref.IsLogin()){

                                              showDialog(context: context, builder: (context) => Addtowishlist(onPressed: () {

                                                Navigator.pop(context);

                                              },title: "",text: "",image: "", buttonText: '',));
                                              return;
                                            }
                                            api.favorite(item.item.items[index].id, false,context);
                                          },
                                          child: SvgPicture.asset(  'assets/image/favIcon.svg'  ,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            itemCount: item.item.items.length,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Visibility(

              visible: !isProduct,
              child: rate.items.isEmpty ? Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    SvgPicture.asset("assets/image/noProduct.svg"),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: "NO RATING TO SHOW!",
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ): Padding(
                padding: const EdgeInsets.all(10.0),
                child:  Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                      child: CustomText(text: "USER RATING AND REVIEWS",alignment: Alignment.centerLeft,fontWeight: FontWeight.bold,fontSize: 15,),
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: rate.items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return  InkWell(
                            onTap: (){


                              // To(context, DesignerDetails(id: item.items[index].id,name: item.items[index].name,));
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


                                        Padding(
                                          padding: const EdgeInsets.only(left: 0.0,right: 0,top: 10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Container(

                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(





                                                      child: CustomText(text: rate.items[index].ratedBy.name,alignment: Alignment.centerLeft,fontWeight: FontWeight.bold,fontSize: 15,),width: MediaQuery.of(context).size.width * 0.6,),
                                                       RatingBar(
                                                      itemSize: 15,
                                                      initialRating: rate.items[index].rate.toDouble(),
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
                                                // width: MediaQuery.of(context).size.width*0.85,
                                              ),
                                              SizedBox(height: 8,),
                                              SizedBox(

                                                width: MediaQuery.of(context).size.width * 0.8,

                                                child: CustomText(text:rate.items[index].comment,alignment: Alignment.centerLeft,color: grayColor,height: 1.1,fontSize: 12,),),
                                              SizedBox(height: 8,),
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
                  ],
                ),
              ),)

          ],
        ),
      );
    });

  }

  Future<void> share( String url) async {
    await FlutterShare.share(
        title: 'share link',
        text: 'share link',
        linkUrl: url,
        chooserTitle: 'share link'
    );
  }
}
