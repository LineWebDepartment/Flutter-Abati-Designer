import 'package:abati_new/Helper/extention.dart';
import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/custom_textfiled.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/custom_widget/exit_confirmation_dialog.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/repo/auth.dart';
import 'package:abati_new/view/Home/Sizechart.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetails extends StatefulWidget {
  final int id;
  const ProductDetails({Key key, this.id}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  var selectedColor = 0;
  var selectedColorId = 0;


  var selectedIndex = 0;
  var quantity = 1;
  var selectedSize = 0;
  var selectedSizeText = "";
  var selectedHeight = 0;
  var selectedHeightText = "";

  var specialSize = false;
  var gift = false;

  var api = Api();
  TextEditingController specialSizeTF = TextEditingController() ;
  TextEditingController noteTF = TextEditingController() ;
  @override
  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false)
        .fetchProductDetails(this.widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:  Text(
            "Product".tr(),
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

      body:Consumer<APIProvider>(builder: (BuildContext context, data, _) {
        var item = data.ProductDetails.data;
        return  Stack(

          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    height: 1,
                    color: Colors.grey[200],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      // height: 350,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]),



                      ),

                      child: Stack(

                        children: [

                          Image.network(item.item.image,fit: BoxFit.fitHeight,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              InkWell(


                                  child: SvgPicture.asset("assets/image/sarchIcon.svg"),
                                onTap: (){

                                  Share.share(item.item.urlLink);

                                },

                              ),
                              InkWell(

                                  onTap: (){


                                    if (!Mypref.IsLogin()){

                                      showDialog(context: context, builder: (context) => Addtowishlist(onPressed: () {

                                        Navigator.pop(context);

                                      },title: "",text: "",image: "", buttonText: '',));
                                          return;
                                    }


                                    api.favorite(item.item.id, false, context);
                                  },
                                  child: SvgPicture.asset("assets/image/favProductIcon.svg",width: 80,))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) =>  Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 120,
                          width: 90,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]),

                          ),
                          child: Image.network(item.item.images[index].attachment,fit: BoxFit.fill,),
                        ),
                      ),
                      itemCount: item.item.images.length,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(text: item.item.name,fontWeight: FontWeight.bold,),
                            CustomText(text: item.item.changedPriceOffer.p,fontWeight: FontWeight.bold,color: primaryColor,),

                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(text: item.item.designerName,fontWeight: FontWeight.normal,),
                            CustomText(text: item.item.changedPrice.p,fontWeight: FontWeight.normal,isPrice: true,),

                          ],
                        ),
                        const SizedBox(height: 10,),
                        CustomText(text: "SKU :" + "${item.item.sku}",fontWeight: FontWeight.normal,color: grayColor,alignment: Alignment.centerLeft,fontSize: 14,),

                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    height: 1,
                    color: Colors.grey[200],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CustomText(text: "Color".tr(),alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 45,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (_, index) =>   InkWell(

                          onTap: (){

                            setState(() {

                              selectedSize = 0;
                              selectedHeight = 0;
                              selectedColorId = item.item.colors[index].id;
                              selectedColor = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 5,right: 5),
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                border: selectedColor == index ? Border.all(color: primaryColor,width: 1.5) :null,
                                color: HexColor.fromHex(item.item.colors[index].code)

                            ),
                          ),
                        ),
                        itemCount: item.item.colors.length,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    height: 1,
                    color: Colors.grey[200],
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: "Sizes & Height available ".tr(),alignment: Alignment.centerLeft,),
                        InkWell(

                          onTap: (){

                            To(context, SizechartScreen(image: item.item.sizeChart,));
                          },
                          child: Row(
                            children: [
                              CustomText(text: "Size chart".tr(),alignment: Alignment.centerLeft,),
                              const SizedBox(width: 5,),
                              SvgPicture.asset("assets/image/sizechart.svg")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(


                          onTap: (){

                            showCustomModalBottomSheet(
                              useRootNavigator:true,
                              // barrierColor: Colors.grey[200].a,
                              backgroundColor: Colors.white,
                              context: context, builder: (context) => SingleChildScrollView(
                              controller: ModalScrollController.of(context),
                              child: Container(

                                decoration: BoxDecoration(
                                    color: Colors.white,

                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(10) )

                                ),
                                height: 400,


                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [

                                      Container(height: 130,color: Color.fromRGBO(248, 248, 248, 1),


                                      child: Stack(
                                        children: [

                                          Row(



                                            children: [
                                              IconButton(onPressed: (){
                                                Navigator.pop(context);
                                              }, icon: SvgPicture.asset("assets/image/close.svg"),),

                                            ],
                                            mainAxisAlignment: MainAxisAlignment.end,
                                          ),
                                          Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                const SizedBox(height: 20,),
                                                SvgPicture.asset("assets/image/choosesize.svg"),
                                                const SizedBox(height: 10,),
                                                CustomText(text: "CHOOSE SIZE".tr(),fontWeight: FontWeight.bold,)

                                              ],
                                            ),
                                          )
                                        ],
                                      ),

                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: item.item.colors[selectedIndex].variations.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(

                                            onTap: (){

                                              setState(() {

                                                specialSize = false;
                                                selectedSizeText = item.item.colors[selectedIndex].variations[index].size.name;
                                                selectedSize = item.item.colors[selectedIndex].variations[index].size.id;



                                              });
                                              Navigator.pop(context);
                                            },
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(20.0),
                                                  child: CustomText(text:  item.item.colors[selectedIndex].variations[index].size.name ,alignment: Alignment.center,),
                                                ),
                                                Visibility(
                                                    child: Container(height: 1,width: MediaQuery.of(context).size.width -70,color: Colors.grey[100],))
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(height: 30,),


                                    ],
                                  ),
                                )

                              ),
                            ),);



                          },
                          child: Container(

                            decoration: BoxDecoration(

                              color: selectedSize == 0 ? Colors.white:Color.fromRGBO(255, 250, 242, 1),
                                border: Border.all(color: selectedSize == 0 ? Colors.black :primaryColor)
                            ),
                            height: 50,
                            width: MediaQuery.of(context).size.width *0.45,

                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                CustomText(text: selectedSize == 0 ?"choose size".tr():selectedSizeText,fontSize: 14,),
                                const SizedBox(width: 10,),
                                SvgPicture.asset("assets/image/downArwo.svg")
                              ],
                            ),

                          ),
                        ),
                        InkWell(


                          onTap: (){

                            showCustomModalBottomSheet(
                              useRootNavigator:true,
                              // barrierColor: Colors.grey[200].a,
                              backgroundColor: Colors.white,
                              context: context, builder: (context) => SingleChildScrollView(
                              controller: ModalScrollController.of(context),
                              child: Container(

                                  decoration: BoxDecoration(
                                      color: Colors.white,

                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(10) )

                                  ),
                                  height: 400,


                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [

                                        Container(height: 130,color: Color.fromRGBO(248, 248, 248, 1),


                                          child: Stack(
                                            children: [

                                              Row(



                                                children: [
                                                  IconButton(onPressed: (){
                                                    Navigator.pop(context);
                                                  }, icon: SvgPicture.asset("assets/image/close.svg"),),

                                                ],
                                                mainAxisAlignment: MainAxisAlignment.end,
                                              ),
                                              Center(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [

                                                    const SizedBox(height: 20,),
                                                    SvgPicture.asset("assets/image/choosesize.svg"),
                                                    const SizedBox(height: 10,),
                                                    CustomText(text: "CHOOSE HEIGHT".tr(),fontWeight: FontWeight.bold,)

                                                  ],
                                                ),
                                              )
                                            ],
                                          ),

                                        ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          // physics: NeverScrollableScrollPhysics(),
                                          itemCount: item.item.colors[selectedIndex].variations.length,
                                          itemBuilder: (context, index) {
                                            return InkWell(

                                              onTap: (){

                                                setState(() {

                                                  // specialSize = false;
                                                  selectedHeightText = item.item.colors[selectedIndex].variations[index].height.name;
                                                  selectedHeight = item.item.colors[selectedIndex].variations[index].height.id;

                                                  // Vechicl.text = "${item[index].brand} - ${item[index].model} - ${item[index].plateNumber}";
                                                  // selectedVechile = item[index].id;
                                                  // latitude = item[index].l;



                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(20.0),
                                                    child: CustomText(text:  item.item.colors[selectedIndex].variations[index].height.name ,alignment: Alignment.center,),
                                                  ),
                                                  Visibility(


                                                      child: Container(height: 1,width: MediaQuery.of(context).size.width -70,color: Colors.grey[100],))
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                        SizedBox(height: 30,),


                                      ],
                                    ),
                                  )

                              ),
                            ),);



                          },
                          child: Container(

                            decoration: BoxDecoration(

                                color: selectedHeight == 0 ? Colors.white:Color.fromRGBO(255, 250, 242, 1),
                                border: Border.all(color: selectedHeight == 0 ? Colors.black :primaryColor)
                            ),
                            height: 50,
                            width: MediaQuery.of(context).size.width *0.45,

                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                CustomText(text: selectedHeight == 0 ?"Choose Height".tr():selectedHeightText,fontSize: 14,),
                                const SizedBox(width: 10,),
                                SvgPicture.asset("assets/image/downArwo.svg")
                              ],
                            ),

                          ),
                        ),

                      ],
                    ),
                  ),

                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: 1,color: Colors.grey[400],width: MediaQuery.of(context).size.width *0.3,),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: CustomText(text: "OR".tr(),),
                      ),
                      Container(height: 1,color: Colors.grey[400],width: MediaQuery.of(context).size.width *0.3,),
                    ],
                  ),

                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: "Special Size".tr(),alignment: Alignment.centerLeft,),
                        InkWell(


                            onTap: (){

                              setState(() {

                                 selectedSize = 0;
                                 selectedHeight = 0;
                                specialSize = !specialSize;
                              });
                            },
                            child: SvgPicture.asset(specialSize ? "assets/image/check.svg":"assets/image/uncheck.svg"))
                      ],
                    ),
                  ),
                  Visibility(
                    visible: specialSize,
                    child: Column(
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 12.0,right: 12),
                          child: CustomTextField(text: "Predefined Size".tr(),controller: specialSizeTF,),
                        ),
                      ],
                    ),
                  ),



                  const SizedBox(height: 20,),
                  Container(
                    height: 1,
                    color: Colors.grey[200],
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: "Gift wrapping".tr(),alignment: Alignment.centerLeft,),
                        Row(
                          children: [
                            CustomText(text: 20.p,alignment: Alignment.centerLeft,color: primaryColor,),
                            const SizedBox(width: 10,),
                            InkWell(

                                onTap: (){
                                  setState(() {
                                    gift = !gift;
                                  });
                                },
                                child: SvgPicture.asset(gift ? "assets/image/check.svg":"assets/image/uncheck.svg")),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    height: 1,
                    color: Colors.grey[200],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CustomText(text: "Notes".tr(),alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]),
                            color: Colors.grey[100]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(

                            controller: noteTF,
                            style: TextStyle(fontSize: 14,),

                            textAlign: Mypref.getlang() == "en" ?TextAlign.left:TextAlign.right,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Add your notes here or the gift message'.tr(),


                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomText(text: "Description".tr(),alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            CustomText(color:grayColor, text: item.item.description,alignment:Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,height: 1.2,),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    height: 1,
                    color: Colors.grey[200],
                  ),

                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CustomText(text: "RELATED VIDEOS".tr(),alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0,right: 12),
                    child: SizedBox(
                      height: 250,
                      child: Stack(

                        children: [


                          PageView.builder(
                              onPageChanged: (index){

                                setState(() {
                                  selectedIndex = index ;
                                });
                              },
                              itemCount:item.item.videos.length,
                              pageSnapping: true,
                              itemBuilder: (context,pagePosition){
                                return Container(

                                    height: 250,
                                    color: Colors.black,
                                    child: Image.network(item.item.videos[pagePosition].video.image,fit: BoxFit.cover,));

                                // margin: EdgeInsets.all(10),

                              }),
                          Center(child: SvgPicture.asset('assets/image/Iconplay.svg')),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Center(
                    child: DotsIndicator(
                      dotsCount: item.item.videos.length,
                      position: selectedIndex * 1.0,
                      decorator: DotsDecorator(
                        // color: primaryColor,
                        activeColor: primaryColor,
                        size: const Size.square(6.0),
                        activeSize: const Size(20.0, 6.0),
                        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
                      ),
                    ),
                  ),



                  Visibility(
                    visible: item.item.relateds.isNotEmpty,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: CustomText(text: "RELATED PRODUCTS".tr(),alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,),
                            ),
                          ],
                        ),
                        Container(
                          height: 320,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                // physics: const NeverScrollableScrollPhysics(),

                                itemBuilder: (_, index) => Padding(
                                  padding:
                                  const EdgeInsets.only(left: 5.0, right: 5, bottom: 10),
                                  child: InkWell(
                                    onTap: () {

                                      To(context,ProductDetails(id: item.item.relateds[index].id,));

                                    },
                                    child: Stack(
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              color: Colors.black,
                                              height: 220,
                                              width: 170,
                                              child: Image(
                                                image: NetworkImage(
                                                    item.item.relateds[index].related.image),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CustomText(
                                              text: item.item.relateds[index].related.name,
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
                                                  text: item.item.relateds[index].related.price.p,
                                                  fontSize: 13,
                                                  alignment: Alignment.centerLeft,
                                                  maxLine: 1,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                // CustomText(
                                                //   text: "100.00d KWD",
                                                //   fontSize: 12,
                                                //   alignment: Alignment.centerLeft,
                                                //   maxLine: 1,
                                                //   color: Colors.grey,
                                                // ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CustomText(
                                              text:
                                              "SKU : ${item.item.relateds[index].related.sku}",
                                              fontSize: 12,
                                              alignment: Alignment.centerLeft,
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
                                itemCount: item.item.relateds.length
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100,),
                ],
              ),




            ),


            item.item.hasVariants == 0 && item.item.inStock == 0  ? Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(

                height: 80,

                color: Colors.white,
                child:Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(

                    height: 50,
                    decoration:  BoxDecoration(
                      color:   Color.fromRGBO(170, 170, 170, 1)

                    ),
                    child: CustomText(maxLine: 1,fontWeight: FontWeight.normal,text: "Out Of Stock".tr(),color: Colors.white,),
                  ),
                ),
              ),
            ):Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(

                height: 100,

                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Container(

                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black,width: 1)
                        ),
                        height: 50,
                        width:MediaQuery.of(context).size.width *0.32,
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {

                                  quantity = ++quantity;
                                });
                              },
                              child: Container(
                                color: Colors.black,
                                width: 40,
                                child: CustomText(text: "+",color: Colors.white,fontSize: 25,),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              width: 40,
                              child: CustomText(text: "${quantity}",color: primaryColor,fontSize: 20,fontWeight: FontWeight.normal,),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {

                                  if (quantity == 1){
                                    return;
                                  }
                                  quantity = --quantity;
                                });
                              },
                              child: Container(
                                color: Colors.black,
                                width: 40,
                                child: CustomText(text: "-",color: Colors.white,fontSize: 25,),
                              ),
                            ),
                          ],
                        ),


                      ),



                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.62,
                        child: DefaultButton(text: "Add to Cart".tr(),onPressed: (){



                          // if (selectedColorId == 0){
                          //   AwesomeDialog(
                          //     dismissOnTouchOutside: true,
                          //     dismissOnBackKeyPress: true,
                          //     context: context,
                          //     dialogType: DialogType.error,
                          //     animType: AnimType.rightSlide,
                          //     title: "Error",
                          //     desc: "Please select color to proceed.",
                          //     btnCancelOnPress: () {
                          //       // Navigator.of(context, rootNavigator: false).pop();
                          //
                          //     },).show();
                          //
                          //   return;
                          // }

                          api.addToCart(this.widget.id, quantity.toString(), selectedColorId, selectedSize, selectedHeight, specialSizeTF.text, "1", noteTF.text, context);


                          print("dateIddateIddateIddateId");
                          // print(soltId);
                          // print(dateId);
                          // To(context, CheckoutService(id: widget.id,name: widget.name,date: "${item.data.item.dates[selectedDateIndex].name} - ${item.data.item.dates[selectedDateIndex].date} , ${item.data.item.dates[selectedDateIndex].slots[selectedSolIndex].from} - ${item.data.item.dates[selectedDateIndex].slots[selectedSolIndex].to} ",dateId: dateId,soltId: soltId, ));
                        },),
                      ),
                    ],
                  ),
                ),
              ),
            ),


          ],

        );
      })
      
      
      
      
     

    );
  }
}
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}