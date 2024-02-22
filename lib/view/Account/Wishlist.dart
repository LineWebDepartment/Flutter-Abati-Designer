import 'package:abati_new/Helper/extention.dart';
import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/custom_widget/exit_confirmation_dialog.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/repo/auth.dart';
import 'package:abati_new/view/Home/ProductDetails.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  var api = Api();

  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false).fetchMyFavorite();

    print("Mypref.getToken()");
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<APIProvider>(builder: (BuildContext context, data, _) {

      var item = data.MyFavorite.data.items;
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:  Text(
            "WISHLIST".tr(),
            style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, "");
            },
            icon: SvgPicture.asset( 'assets/image/back.svg'),
          ),

        ),

        body: SingleChildScrollView(
          child: item.isEmpty  ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(height: 50,),
              Center(child: SvgPicture.asset("assets/image/nowish.svg")),
              SizedBox(height: 50,),
              CustomText(text: "WISHLIST IS EMPTY !".tr(),fontWeight: FontWeight.bold,),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: CustomText(text: "Sorry! You have not added any products to wishlist Please add.".tr(),color: grayColor,height: 1.2,),
              )
            ],
            
          ):  Column(

            children: [
              Container(
                height: 1,
                color: Colors.grey[200],
              ),
              const SizedBox(height: 20,),
              Padding(
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
                        // VideosDetiles()));
                        //
                      },
                      child: Stack(
                        children: [
                          InkWell(

                            onTap: (){
                              To(context,ProductDetails(id: item[index].product.id,));
                            },
                            child: Column(
                              children: [
                                Container(
                                  color: Colors.black,
                                  height: 220,
                                  child: Image(
                                    image: NetworkImage(
                                        item[index].product.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  text: item[index].product.name,
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
                                      text: item[index].product.priceOffer == null ?  item[index].product.price.p:item[index].product.priceOffer.p,
                                      fontSize: 13,
                                      alignment: Alignment.centerLeft,
                                      maxLine: 1,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Visibility(
                                      visible: item[index].product.priceOffer != null,
                                      child: CustomText(
                                        text: item[index].product.price.p,
                                        fontSize: 12,
                                        alignment: Alignment.centerLeft,
                                        maxLine: 1,
                                        isPrice: true,
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
                                  "SKU : ${item[index].product.sku}",
                                  fontSize: 12,
                                  alignment: Alignment.centerLeft,
                                  maxLine: 1,
                                  // color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              top: -10,
                              right: -10,
                              child: InkWell(

                                onTap: (){

                                  showDialog(context: context, builder: (context) => ConfirmationDialog(onPressed: () {


                                    api.favorite(item[index].product.id,true, context);



                                  },title: "REMOVE WISHLIST?".tr(),text: "Do you really want to remove this item from your wishlist?".tr(),image: "Icondelete", buttonText: 'Yes, Remove'.tr(),));

                                },
                                child: SvgPicture.asset(
                                  'assets/image/favIcon.svg',
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  itemCount:item.length,
                ),
              )

            ],
          ),
        ),

      );
    });

  }
}
