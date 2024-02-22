import 'package:abati_new/custom_widget/custom_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:abati_new/Helper/extention.dart';
import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/view/CartScreen.dart';
import 'package:abati_new/view/Home/Categories/ServiceScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textController = TextEditingController() ;

  @override
  void initState() {
    super.initState();

    print("Mypref.getToken()");
  }
  Widget build(BuildContext context) {
    return Consumer<APIProvider>(builder:  (BuildContext context, data, _) {


      // var item = data.Search.data;
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:  Text(
            "SEARCH",
            style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo'),
          ),
          leading: Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context, "");
                    },
                    icon: SvgPicture.asset( 'assets/image/back.svg'),
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
          child:   Column(
            children: [
              Container(
                height: 1,
                color: Colors.grey[200],
              ),


              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(

                  height: 50,
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 300,
                            child:  TextField(
                              controller: textController,
                              style:  const TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'RobotoSlab'
                              ),
                              keyboardType: TextInputType.text, //Set keyboard type for email address. This will show @ button on the primary section of the keyboard.
                              decoration:  const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "What are you looking for?"), // Set the hint text that will be shown when TextField is empty
                            ),),
                        InkWell(
                            onTap: (){

                              Provider.of<APIProvider>(context, listen: false).fetchSearch(textController.text);

                            },
                            child: const Icon(Icons.search))
                      ],
                    ),
                  ),
                ),
              ),

              // Visibility(
              //   visible: Mypref.IsLogin(),
              //   child: Column(
              //     children: [
              //       Row(
              //
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.only(left: 15.0,right: 15,top: 15,bottom: 10),
              //             child: CustomText(text: "RECENTIY SEARCHED",color: Colors.black,alignment: Alignment.centerLeft,fontSize: 14,),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.only(left: 12.0,right: 12),
              //             child: SvgPicture.asset("assets/image/removeIcon.svg"),
              //           )
              //         ],
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(10.0),
              //         child: GridView.builder(
              //           shrinkWrap: true,
              //           physics: const NeverScrollableScrollPhysics(),
              //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //               crossAxisCount: 3,childAspectRatio: 2.8),
              //           itemBuilder: (_, index) => Padding(
              //             padding:
              //             const EdgeInsets.only(left: 5.0, right: 5, bottom: 10),
              //             child: InkWell(
              //               onTap: () {
              //
              //                 // To(context, ServiceScreen(id: item.items[index].id,name:item.items[index].name));
              //                 // Navigator.of(context).push(MaterialPageRoute(
              //                 //     builder: (BuildContext context) =>
              //                 //         VideosDetiles()));
              //                 //
              //               },
              //               child:Container(
              //                 color: Colors.grey[200],
              //                 child: Column(
              //                   children: [
              //
              //                     Padding(
              //                       padding: const EdgeInsets.all(8.0),
              //                       child: CustomText(
              //                         text: "",
              //                         fontSize: 13,
              //                         alignment: Alignment.centerLeft,
              //                         maxLine: 1,
              //                       ),
              //                     ),
              //
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //           itemCount: 5,
              //         ),
              //       )
              //     ],
              //   ),
              // )



            ],
          ),
        ),

      );
    });

  }
}
