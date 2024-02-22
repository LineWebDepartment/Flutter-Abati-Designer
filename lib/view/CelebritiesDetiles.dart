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
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class CelebritiesDetilesScreen extends StatefulWidget {
  final int id;
  final String name;
  const CelebritiesDetilesScreen({Key key, this.id, this.name}) : super(key: key);

  @override
  State<CelebritiesDetilesScreen> createState() => _CelebritiesDetilesScreenState();
}

class _CelebritiesDetilesScreenState extends State<CelebritiesDetilesScreen> {
  var isVisble = false;
  var isProduct = true;
  var api = Api();

  @override
  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false).fetchCelebrityDetails(this.widget.id);
    Provider.of<APIProvider>(context, listen: false).fetchCelebrityServices(this.widget.id);

    print("Mypref.getToken()");
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<APIProvider>(builder: (BuildContext context, data, _) {
      var item = data.CelebritiesDetails.data;
      var services = data.CelebritiesServices.data;
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:  Text(
            widget.name,
            style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontWeight: FontWeight.w600,fontSize: 18),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, "");
            },
            icon: Row(
              children: [
                SvgPicture.asset( 'assets/image/back.svg'),
              ],
            ),
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

                              Share.share(item.item.celebrity.urlLink);

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
                                child: Image.network(item.item.celebrity.image,fit: BoxFit.cover,),
                              ),
                            ),

                            const SizedBox(height: 10,),
                            CustomText(text: item.item.celebrity.description,height: 1.2,color: grayColor,)
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

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          height: 50,
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  isProduct = true;
                                });
                              },
                              child: Column(
                                children: [
                                  CustomText(
                                    text: "Products".tr(),
                                    fontWeight: isProduct
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),

                                  SizedBox(height: 5,),
                                  Visibility(
                                    visible: isProduct,
                                    child: Container(
                                      height: 2,
                                      width:80,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ))),

                      SizedBox(
                          height: 50,
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  isProduct = false;
                                });
                              },
                              child: Column(
                                children: [
                                  CustomText(
                                      text: "Services".tr(),
                                      fontWeight: !isProduct
                                          ? FontWeight.bold
                                          : FontWeight.normal),
                                  SizedBox(height: 5,),
                                  Visibility(
                                    visible: !isProduct,
                                    child: Container(
                                      height: 2,
                                      width:80,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )))
                    ],
                  ),
                ),

              ],
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
                ): Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.6),
                    itemBuilder: (_, index) => Padding(
                      padding:
                      const EdgeInsets.only(left: 5.0, right: 5, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (BuildContext context) =>
                          //         VideosDetiles()));
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
                                      alignment: Alignment.centerLeft,
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
                                        alignment: Alignment.centerLeft,
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
                                  alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,
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
                )),
            Visibility(

              visible: !isProduct,
              child: services.items.length == 0 ? Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    SvgPicture.asset("assets/image/noProduct.svg"),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: "NO SERVICE TO SHOW!".tr(),
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ): Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1),
                  itemBuilder: (_, index) => Padding(
                    padding:
                    const EdgeInsets.only(left: 5.0, right: 5, bottom: 10),
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) =>
                        //         VideosDetiles()));
                        //
                      },
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                color: Colors.black,
                                height: 120,
                                child: Image(
                                  image: NetworkImage(
                                      services.items[index].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                text: services.items[index].name,
                                fontSize: 13,
                                alignment: Alignment.centerLeft,
                                maxLine: 1,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  CustomText(
                                    text: services.items[index].priceOffer == null ?services.items[index].price.p:services.items[index].priceOffer.p,
                                    fontSize: 13,
                                    alignment: Alignment.centerLeft,
                                    maxLine: 1,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Visibility(
                                    visible: services.items[index].priceOffer != null,
                                    child: CustomText(
                                      text: services.items[index].price.p,
                                      fontSize: 12,
                                      isPrice: true,
                                      alignment: Alignment.centerLeft,
                                      maxLine: 1,
                                      color: Colors.grey,

                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  itemCount: services.items.length,
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
