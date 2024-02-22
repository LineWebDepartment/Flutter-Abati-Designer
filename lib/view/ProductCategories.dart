import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/Helper/extention.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/view/Home/ProductDetails.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProductCategories extends StatefulWidget {

  final int id;
  final String name;
  const ProductCategories({Key key, this.id, this.name}) : super(key: key);

  @override
  State<ProductCategories> createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<ProductCategories> {

  var selectedIndex = 0;
  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false).fetchMyCategoryDetails(widget.id);

    print("Mypref.getToken()");
  }
  @override
  Widget build(BuildContext context) {
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
          icon: SvgPicture.asset( 'assets/image/back.svg'),
        ),

      ),

      body:  Consumer<APIProvider>(builder: (BuildContext context, data, _) {

        var item = data.CategoryDetails.data;
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
              item.item.items.isEmpty ?Padding(
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 45,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) =>  Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: InkWell(
                          onTap: (){

                            setState(() {

                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 5,right: 5),
                            height: 45,
                            width: 120,
                            decoration: BoxDecoration(
                              color: selectedIndex == index ?  Color.fromRGBO(255, 250, 242, 1) :Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[300],
                                  blurRadius: 4,
                                  offset: Offset(1, 2), // Shadow position
                                ),
                              ],
                              border: Border.all(color: selectedIndex == index ? primaryColor:Colors.white),

                            ),

                            child:  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(text: index == 0?  "View All".tr():item.item.subCategories[index -1 ].name,alignment: Alignment.center,fontSize: 14,),
                            ),
                          ),
                        ),
                      ),
                      itemCount: item.item.subCategories.length +1,
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomText(text: "${"Showing".tr()} “${item.item.items.length}” ${"products".tr()}",color: grayColor,fontSize: 13,alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,),
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

                            To(context,ProductDetails(id: item.item.items[index].id,));

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
                                      fit: BoxFit.fill,
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
                                        text: item.item.items[index].priceOffer == null ? item.item.items[index].price.p:item.item.items[index].priceOffer.p,
                                        fontSize: 13,
                                        alignment: Alignment.centerLeft,
                                        maxLine: 1,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Visibility(
                                        visible:item.item.items[index].priceOffer != null ,
                                        child: CustomText(
                                          text: item.item.items[index].price.p,
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

                                      // api.favorite(item.item.id, false,context);
                                    },
                                    child: SvgPicture.asset(  'assets/image/favIcon.svg'  ,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      itemCount: item.item.items.length
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
