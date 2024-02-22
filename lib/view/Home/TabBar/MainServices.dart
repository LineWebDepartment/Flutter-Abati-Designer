import 'package:abati_new/Helper/extention.dart';
import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/view/CartScreen.dart';
import 'package:abati_new/view/Home/Categories/ServiceScreen.dart';
import 'package:abati_new/view/Home/Videos/VideosDetiles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainServices extends StatefulWidget {
  const MainServices({Key key}) : super(key: key);

  @override
  State<MainServices> createState() => _MainServicesState();
}

class _MainServicesState extends State<MainServices> {
  @override
  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false).fetchMainServices();

    print("Mypref.getToken()");
  }
  Widget build(BuildContext context) {
    return Consumer<APIProvider>(builder:  (BuildContext context, data, _) {


      var item = data.MainServices.data;
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:  Text(
            "Services".tr(),
            style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontSize: 18,fontWeight: FontWeight.w600),
          ),
          leading: Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Row(
                children: [

                  const SizedBox(
                    width: 4,
                  ),

                ],
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  To(context, const CartScreen());
                }, icon: SvgPicture.asset('assets/image/bag.svg'))
          ],
        ),

        body: SingleChildScrollView(
          child: item.items.isEmpty ? Column(

            children: [
              const SizedBox(height: 150,),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
              ),
            ],
          ):     Column(
            children: [
              Container(
                height: 1,
                color: Colors.grey[200],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15,top: 15,bottom: 10),
                    child: CustomText(text: "${"Showing".tr()} “${item.items.length}” ${"Service".tr()}",color: Colors.grey[500],alignment:Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,fontSize: 14,),
                  ),
                ],
              ),
              Padding(
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

                        To(context, ServiceScreen(id: item.items[index].id,name:item.items[index].name));
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) =>
                        //         VideosDetiles()));
                        //
                      },
                      child:Column(
                        children: [
                          Container(
                            color: Colors.black,
                            height: 120,
                            child: Image(
                              image: NetworkImage(
                                  item.items[index].image),
                              fit: BoxFit.cover,
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
                                text: item.items[index].priceOffer.p ,
                                fontSize: 13,
                                alignment: Alignment.centerLeft,
                                maxLine: 1,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              CustomText(
                                text: item.items[index].price.p ,
                                isPrice: true,
                                fontSize: 12,
                                alignment: Alignment.centerLeft,
                                maxLine: 1,
                                color: Colors.grey,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  itemCount: item.items.length,
                ),
              )


            ],
          ),
        ),

      );
    });

  }
}
