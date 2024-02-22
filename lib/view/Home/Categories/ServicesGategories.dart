import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/extention.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/view/Home/Categories/ServiceScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
class ServicesCategories extends StatefulWidget {

  final int id;
  final String name;
  const ServicesCategories({Key key, this.id, this.name}) : super(key: key);

  @override
  State<ServicesCategories> createState() => _ServicesCategoriesState();
}

class _ServicesCategoriesState extends State<ServicesCategories> {
  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false).fetchService(this.widget.id);

  }
  @override
  Widget build(BuildContext context) {

    return Consumer<APIProvider>(builder:  (BuildContext context, data, _) {

      var item = data.Service;
      return Scaffold(

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:  Text(
            this.widget.name,
            style: TextStyle(color: Colors.black,fontFamily:'RobotoSlab',fontWeight: FontWeight.w600,fontSize: 18),
          ),
          leading: Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, icon: SvgPicture.asset('assets/image/back.svg'))
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: SvgPicture.asset('assets/image/bag.svg'))
          ],
        ),
        body: SingleChildScrollView(
          child: item.data.item.items.isEmpty ? Column(

            children: [
              SizedBox(height: 150,),
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
                      text: "NO SERVICE TO SHOW!",
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
              Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15,top: 15,bottom: 10),
                child: CustomText(text: "${"Showing".tr()} “${item.data.item.total}” ${"Service".tr()}",color: Colors.grey[500],alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,fontSize: 14,),
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

                        To(context, ServiceScreen(id: item.data.item.items[index].id,name:item.data.item.items[index].name));
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
                                  item.data.item.items[index].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: item.data.item.items[index].name,
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
                                text: item.data.item.items[index].priceOffer == null ?  item.data.item.items[index].price.p:item.data.item.items[index].priceOffer.p,
                                fontSize: 13,
                                alignment: Alignment.centerLeft,
                                maxLine: 1,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Visibility(
                                visible: item.data.item.items[index].priceOffer != null,
                                child: CustomText(
                                  text: item.data.item.items[index].price.p,
                                  fontSize: 12,
                                  alignment: Alignment.centerLeft,
                                  maxLine: 1,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  itemCount: item.data.item.items.length,
                ),
              )


            ],
          ),
        ),
      );
    });

  }
}
