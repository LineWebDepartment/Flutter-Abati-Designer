// import 'package:abati_new/Helper/Pref.dart';
// import 'package:abati_new/custom_widget/custom_text.dart';
// import 'package:abati_new/custom_widget/helper.dart';
// import 'package:abati_new/repo/APIProvider.dart';
// import 'package:abati_new/view/CartScreen.dart';
// import 'package:abati_new/view/Home/Videos/VideosDetiles.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
//
// class VideosScreen extends StatefulWidget {
//   const VideosScreen({Key key}) : super(key: key);
//
//   @override
//   State<VideosScreen> createState() => _VideosScreenState();
// }
//
// class _VideosScreenState extends State<VideosScreen> {
//
//   void initState() {
//     super.initState();
//     // Provider.of<APIProvider>(context, listen: false).fetchVideo();
//
//     print("Mypref.getToken()");
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return Consumer<APIProvider>(builder:  (BuildContext context, data, _) {
//
//       // var item = data.Video.data;
//       return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           title:  Text(
//             "Videos".tr(),
//             style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontSize: 18,fontWeight: FontWeight.w600),
//           ),
//           leading: Row(
//             children: [
//               const SizedBox(
//                 width: 5,
//               ),
//               Row(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(9.0),
//                     child: SvgPicture.network(Mypref.getCurrency().image,
//                       width: 18,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 4,
//                   ),
//                   CustomText(
//                     text: Mypref.getCurrency().shortName,
//                     alignment: Alignment.center,
//                     fontSize: 12,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   To(context, const CartScreen());
//                 }, icon: SvgPicture.asset('assets/image/bag.svg'))
//           ],
//         ),
//         body: ListView(
//           children: [
//             Container(
//               height: 1,
//               color: Colors.grey[200],
//             ),
//             InkWell(
//               onTap: (){
//                 Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => VideosDetiles(id: item.items[0].id,)));
//
//               },
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 260,
//                   color: Colors.grey[100],
//                   child: Stack(
//                     children: [
//                        Center(
//                           child: Image(
//                             image: NetworkImage(
//                               item.items[0].image,
//                             ),
//                             fit: BoxFit.contain,
//                           )),
//                       Center(child: SvgPicture.asset('assets/image/Iconplay.svg')),
//                       Positioned(
//                           bottom: 0,
//                           left: 0,
//                           right: 0,
//                           child: Container(
//                             height: 35,
//                             color: Colors.white.withOpacity(0.4),
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 8.0, right: 8),
//                               child: CustomText(
//                                 text: item.items[0].name,
//                                 fontSize: 13,
//                                 alignment: Alignment.center,
//                                 maxLine: 1,
//                               ),
//                             ),
//                           ))
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate:
//                 const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1.3),
//                 itemBuilder: (_, index) => Padding(
//                   padding: const EdgeInsets.only(left: 5.0, right: 5,bottom: 10),
//                   child: InkWell(
//
//                     onTap: (){
//                       Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => VideosDetiles(id: item.items[index +1].id,)));
//                       //
//                     },
//                     child: Stack(
//
//                       children: [
//
//                         Column(
//                           children: [
//                             Container(
//                               height: 110,
//                               child: Image(image: NetworkImage(item.items[index +1].image),fit: BoxFit.cover,),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             CustomText(
//                               text: item.items[index +1].name,
//                               fontSize: 13,
//                               alignment: Alignment.centerLeft,
//                               maxLine: 1,
//                             )
//                           ],
//                         ),
//                         Center(child: SvgPicture.asset('assets/image/Iconplay.svg',width: 20,)),
//                       ],
//                     ),
//                   ),
//                 ),
//                 itemCount: item.items.length -1,
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//
//
// }}
