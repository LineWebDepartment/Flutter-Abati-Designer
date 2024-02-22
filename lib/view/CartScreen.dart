import 'package:abati_new/Helper/extention.dart';
import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/custom_widget/exit_confirmation_dialog.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/repo/auth.dart';
import 'package:abati_new/view/Home/GuestCheckout.dart';
import 'package:abati_new/view/Home/SelectAddress.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var api = Api();

  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false).fetchMyCart();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<APIProvider>(builder:  (BuildContext context, data, _) {



      var item = data.MyCart.data.item;

      return item.items.isEmpty ? Scaffold(

        // backgroundColor: Colors.amber,
        appBar:AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:  Text(
            "CART".tr(),
            style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontSize: 18,fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, "");
            },
            icon: SvgPicture.asset( 'assets/image/back.svg'),
          ),
        ),
        body:  Stack(

          children: [


            Center(

              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/image/cartEmty.svg"),
                  const SizedBox(height: 20,),
                  CustomText(text: "Cart is Empty!".tr(),fontWeight: FontWeight.bold,),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30),
                    child: CustomText(text: "Sorry, there is no product listed in cart. Please add products.".tr(),fontWeight: FontWeight.normal,height: 1.2,),
                  )
                ],
              ),
            )




          ],
        )






        ,
      ):Stack(
        children: [
          Scaffold(

            // backgroundColor: Colors.amber,
            appBar:AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title:  Text(
                "CART".tr(),
                style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontSize: 18),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context, "");
                },
                icon: SvgPicture.asset( 'assets/image/back.svg'),
              ),
            ),
            body:  Stack(

              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [



                      Container(
                        height: 1,
                        color: Colors.grey[200],
                      ),
                      const SizedBox(height: 10,),

                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 10),
                        child: CustomText(text: "${item.items.length} ${"PRODUCTS IN CART".tr()}",alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) => Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[100], width: 1)),
                            child:  Stack(children: [

                              SizedBox(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(

                                    children: [


                                      Image.network(item.items[index].product.image,width: 120,),

                                      const SizedBox(width: 10,),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                CustomText(text: item.items[index].product.name,),
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            CustomText(text: item.items[index].product.designer.email,),
                                            const SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                CustomText(text: item.items[index].product.changedPriceOffer.p,color: primaryColor,fontSize: 14,fontWeight: FontWeight.bold,),
                                                const SizedBox(width: 20,),
                                                CustomText(text: item.items[index].product.changedPrice.p,fontSize: 14,),

                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            item.items[index].vareiationId == 0?CustomText(text: "${item.items[index].color.name},${item.items[index].size.name},${item.items[index].height.name}",):CustomText(text: "",),
                                            const SizedBox(height: 10,),
                                            CustomText(text: item.items[index].note,),
                                            const SizedBox(height: 10,),
                                            Container(




                                              color: Colors.red,
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 0,right: 0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [

                                                    Container(

                                                      decoration: BoxDecoration(
                                                          border: Border.all(color: Colors.black,width: 1)
                                                      ),
                                                      height: 30,
                                                      // width:30,
                                                      child: Row(

                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            onTap: (){
                                                             api.changeQuantity(item.items[index].id, 1, context);
                                                            },
                                                            child: Container(
                                                              color: Colors.black,
                                                              width: 30,
                                                              child: CustomText(text: "+",color: Colors.white,fontSize: 25,),
                                                            ),
                                                          ),
                                                          Container(
                                                            color: Colors.white,
                                                            width: 30,
                                                            child: CustomText(text: "${item.items[index].quantity}",color: primaryColor,fontSize: 14,fontWeight: FontWeight.normal,),
                                                          ),
                                                          InkWell(
                                                            onTap: (){
                                                              api.changeQuantity(item.items[index].id, 0, context);

                                                            },
                                                            child: Container(
                                                              color: Colors.black,
                                                              width: 30,
                                                              child: CustomText(text: "-",color: Colors.white,fontSize: 25,),
                                                            ),
                                                          ),
                                                        ],
                                                      ),


                                                    ),




                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )

                                    ],
                                  ),
                                ),

                              ),

                              Positioned(
                                // left: 0,
                                  right: 20,
                                  top: 12,
                                  child: InkWell(

                                      onTap: (){



                                        AwesomeDialog(
                                          dismissOnBackKeyPress: true,
                                          context: context,
                                          dialogType: DialogType.info,
                                          animType: AnimType.scale,
                                          title: "Remove from cart ?".tr(),
                                          desc: "Do you really need the item to be removed from your cart?".tr(),

                                          btnCancelText: "Cancel".tr(),
                                          btnCancelOnPress: (){},
                                          btnOkText: "Yes, Remove".tr(),
                                          btnOkOnPress: (){
                                            api.removeFromCart(item.items[index].id, context);
                                          },



                                        ).show();


                                      },
                                      child: SvgPicture.asset("assets/image/removeIcon.svg"))),


                            ],)
                        ),
                        itemCount: item.items.length,
                      ),

                      const SizedBox(height: 160,),


                    ]
                    ,
                  ),
                ),




              ],
            )






            ,
          ),
          Positioned(

              bottom: 0,
              left: 0,
              right: 0,

              child: Container(height: 180,color: Colors.white,

                child: Column(


                  children: [

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          CustomText(text: "SubTotal".tr(),fontSize: 18,fontWeight: FontWeight.bold,),
                          CustomText(text: item.subTotal.p,fontSize: 18,fontWeight: FontWeight.bold,color: primaryColor,)
                        ],),
                    ),
                    DefaultButton(text: "Proceed to checkout".tr(),onPressed: (){


                         if (Mypref.IsLogin() == false){
                           showDialog(context: context, builder: (context) => ProceedCheckoutDialog(onPressed: () {

                             To(context,GuestCheckout());
                             },title: "PROCEED TO CHECKOUT".tr(),text: "Would you like to  Signin or Signup?".tr(),image: "bag", buttonText: 'Continue as Guest'.tr(),));}else{
                           To(context, SelectAddress());


                         }



                    },),
                    const SizedBox(height: 10,),
                    DefaultButton(text: "Continue shopping".tr(),background: Colors.white,textColor: Colors.black,onPressed: (){

                      Navigator.pop(context);
                    },)


                  ],
                ),)),
        ],
      );
    });

  }
}
