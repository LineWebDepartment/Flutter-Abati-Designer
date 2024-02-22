import 'package:abati_new/Helper/extention.dart';
import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/exit_confirmation_dialog.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/repo/auth.dart';
import 'package:abati_new/view/CartScreen.dart';
import 'package:abati_new/view/Home/ProductDetails.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
class Bestsellers extends StatefulWidget {
  final bool isNew;
  const Bestsellers({Key key, this.isNew}) : super(key: key);

  @override
  State<Bestsellers> createState() => _BestsellersState();
}

class _BestsellersState extends State<Bestsellers> {
  var api = Api();
  @override
  void initState() {
    super.initState();

    if (widget.isNew){
      Provider.of<APIProvider>(context, listen: false).fetchNewCollection();

    }else{
      Provider.of<APIProvider>(context, listen: false).fetchBestSeller();

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:  Text(
           widget.isNew ? "NEW COLLECTION".tr(): "Best Seller".tr(),
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
                onPressed: () {

                  To(context, const CartScreen());

                }, icon: SvgPicture.asset('assets/image/bag.svg'))
          ],

        ),

        body:  Consumer<APIProvider>(builder: (BuildContext context, data, _) {

          var item = widget.isNew ? data.NewCollection.data :data.BestSeller.data;




          print("itemitemitem${item}");
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 1,
                  color: Colors.grey[200],
                ),

                const SizedBox(height: 10,),
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
                const SizedBox(height: 5,),
                item.items.length == 0 ?Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
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
                  ),
                ): Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CustomText(text: "${"Showing".tr()} “${item.items.length}” ${"products".tr()}",color: grayColor,fontSize: 13,alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5,),
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

                                To(context,ProductDetails(id: item.items[index].id,));

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
                                              item.items[index].image),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          CustomText(
                                            text: item.items[index].name,
                                            fontSize: 13,
                                            alignment:Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,
                                            maxLine: 1,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          CustomText(
                                            text: item.items[index].priceOffer == null ?  item.items[index].price.p : item.items[index].priceOffer.p,
                                            fontSize: 13,
                                            alignment: Alignment.centerLeft,
                                            maxLine: 1,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Visibility(
                                            visible:item.items[index].priceOffer != null ,
                                            child: CustomText(
                                              text: item.items[index].price.p,
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
                                      Row(
                                        children: [
                                          CustomText(
                                            text:
                                            "SKU : ${item.items[index].sku}",
                                            fontSize: 12,
                                            alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,
                                            maxLine: 1,
                                            // color: Colors.grey,
                                          ),
                                        ],
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
                                          api.favorite(item.items[index].id, false,context);

                                        },
                                        child: SvgPicture.asset(  'assets/image/favIcon.svg'  ,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          itemCount: item.items.length
                      ),
                    )
                  ],


                ),


              ],
            ),
          );


        })






    );
  }
}
