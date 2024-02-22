import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/repo/auth.dart';
import 'package:abati_new/view/CelebritiesDetiles.dart';
import 'package:abati_new/view/Home/Videos/VideosDetiles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CelebritiesScreen extends StatefulWidget {
  final int id;
  final String name;
  const CelebritiesScreen({Key key, this.id, this.name}) : super(key: key);

  @override
  State<CelebritiesScreen> createState() => _CelebritiesScreenState();
}

class _CelebritiesScreenState extends State<CelebritiesScreen> {
  var isVisble = false;
  var isProduct = true;
  var api = Api();

  void initState() {
    super.initState();
    Provider.of<APIProvider>(context, listen: false).fetchCelebrities();

    print("Mypref.getToken()");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<APIProvider>(builder: (BuildContext context, data, _) {
      var item = data.Celebrities.data;
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:  Text(
            "CELEBRITIES".tr(),
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
        body: ListView(
          children: [

            GridView.builder(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.8),
              itemBuilder: (_, index) => Container(
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[200], width: 1)),
                child: InkWell(
                  onTap: (){

                    To(context,CelebritiesDetilesScreen(id: item.items[index].id,name:item.items[index].name ,));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.black,
                          height: 180,
                          child: Image(
                            image: NetworkImage(
                                item.items[index].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text: item.items[index].name,
                          fontSize: 13,
                          alignment: Alignment.center,
                          maxLine: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              itemCount: item.items.length,
            ),
          ],
        ),
      );
    });
  }
}
// Column(
// children: [
// Container(
// color: Colors.black,
// height: 120,
// child: Image(
// image: NetworkImage(
// item.item.services[index].service.image),
// fit: BoxFit.cover,
// ),
// ),
// const SizedBox(
// height: 10,
// ),
// CustomText(
// text: item.item.services[index].service.name,
// fontSize: 13,
// alignment: Alignment.center,
// maxLine: 1,
// ),
//
//
// ],
// ),
