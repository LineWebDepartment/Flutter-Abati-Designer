//
// import 'package:abati_new/Helper/extention.dart';
// import 'package:abati_new/Helper/Pref.dart';
// import 'package:abati_new/Helper/color.dart';
// import 'package:abati_new/custom_widget/custom_text.dart';
// import 'package:abati_new/custom_widget/exit_confirmation_dialog.dart';
// import 'package:abati_new/custom_widget/helper.dart';
// import 'package:abati_new/repo/APIProvider.dart';
// import 'package:abati_new/repo/auth.dart';
// import 'package:abati_new/view/CartScreen.dart';
// import 'package:abati_new/view/Home/Categories/ServiceScreen.dart';
// import 'package:abati_new/view/Home/ProductDetails.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class VideosDetiles extends StatefulWidget {
//   final int id;
//
//   const VideosDetiles({Key key, this.id}) : super(key: key);
//
//   @override
//   State<VideosDetiles> createState() => _VideosDetilesState();
// }
//
// class _VideosDetilesState extends State<VideosDetiles> {
//   var isVisble = false;
//   var isProduct = true;
//   var api = Api();
//
//   @override
//   void initState() {
//     super.initState();
//     // Provider.of<APIProvider>(context, listen: false)
//     //     .fetchVideoDetails(this.widget.id);
//
//     print("Mypref.getToken()");
//   }
//
//   Widget build(BuildContext context) {
//     return Consumer<APIProvider>(builder: (BuildContext context, data, _) {
//       var item = data.VideoDetails.data;
//       return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           title:  Text(
//             "VIDEOS DETAILS".tr(),
//             style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontSize: 18,fontWeight: FontWeight.w600),
//           ),
//           leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context, "");
//             },
//             icon: SvgPicture.asset( 'assets/image/back.svg'),
//           ),
//           actions: [
//             IconButton(
//                 onPressed: () {
//
//                   To(context, const CartScreen());
//                 },
//                 icon: SvgPicture.asset('assets/image/bag.svg'))
//           ],
//         ),
//         body: ListView(
//           children: [
//             Container(
//               height: 1,
//               color: Colors.grey[200],
//             ),
//             InkWell(
//
//               onTap: (){
//                 _launchURL(item.item.url);
//               },
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 260,
//                   // color: Colors.grey[100],
//                   color: Colors.grey[100],
//                   child: Stack(
//                     children: [
//                       Image(
//                         height: 260,
//                         image: NetworkImage(
//                           item.item.image,
//                         ),
//                         // fit: BoxFit.fill,
//                       ),
//                       Center(child: SvgPicture.asset('assets/image/youtube.svg')),
//                       Positioned(
//                           top: 15,
//                           left: 15,
//                           right: 15,
//                           child: Row(
//                             children: [
//                               SvgPicture.asset('assets/image/Component.svg'),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                               CustomText(
//                                 text: item.item.name,
//                                 maxLine: 1,
//                               )
//                             ],
//                           ))
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 15.0, right: 15),
//               child: Container(
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         CustomText(
//                           text: "Description".tr(),
//                         ),
//                         IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 isVisble = !isVisble;
//                               });
//                             },
//                             icon: Icon(
//                               !isVisble
//                                   ? Icons.keyboard_arrow_down_rounded
//                                   : Icons.keyboard_arrow_up_rounded,
//                               size: 25,
//                             )),
//                       ],
//                     ),
//                     Visibility(
//                         visible: isVisble,
//                         child: Row(
//                           children: [
//                             CustomText(
//                               text: item.item.description,
//                               alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,
//                               height: 1.2,
//                               color: grayColor,
//                               fontSize: 13,
//                             ),
//                           ],
//                         )),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               height: 1,
//               color: Colors.grey[200],
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 8.0, right: 15, left: 15),
//               child: Container(
//                 color: Colors.grey[200],
//                 height: 40,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(4.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           SizedBox(
//                               height: 30,
//                               child: TextButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       isProduct = true;
//                                     });
//                                   },
//                                   child: CustomText(
//                                     text: "Products".tr(),
//                                     fontWeight: isProduct
//                                         ? FontWeight.bold
//                                         : FontWeight.normal,
//                                   ))),
//                           Container(
//                             width: 1,
//                             height: 20,
//                             color: Colors.grey[300],
//                           ),
//                           SizedBox(
//                               height: 30,
//                               child: TextButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       isProduct = false;
//                                     });
//                                   },
//                                   child: CustomText(
//                                       text: "Services".tr(),
//                                       fontWeight: !isProduct
//                                           ? FontWeight.bold
//                                           : FontWeight.normal)))
//                         ],
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: isProduct
//                           ? MainAxisAlignment.start
//                           : MainAxisAlignment.end,
//                       children: [
//                         Container(
//                           height: 1,
//                           width: MediaQuery.of(context).size.width * 0.45,
//                           color: Colors.black,
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//
//
//              Visibility(
//
//                visible: isProduct ,
//                  child: item.item.products.length == 0 ? Padding(
//                padding: const EdgeInsets.all(50.0),
//                child: Column(
//                  children: [
//                    SvgPicture.asset("assets/image/noProduct.svg"),
//                    const SizedBox(
//                      height: 20,
//                    ),
//                    CustomText(
//                      text: "NO PRODUCT TO SHOW!".tr(),
//                      fontWeight: FontWeight.bold,
//                    )
//                  ],
//                ),
//              ): Padding(
//                padding: const EdgeInsets.all(10.0),
//                child: GridView.builder(
//                  shrinkWrap: true,
//                  physics: const NeverScrollableScrollPhysics(),
//                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                      crossAxisCount: 2, childAspectRatio: 0.6),
//                  itemBuilder: (_, index) => Padding(
//                    padding:
//                    const EdgeInsets.only(left: 5.0, right: 5, bottom: 10),
//                    child: InkWell(
//                      onTap: () {
//                        Navigator.of(context).push(MaterialPageRoute(
//                            builder: (BuildContext context) =>
//                                VideosDetiles()));
//                        //
//                      },
//                      child: InkWell(
//
//                        onTap: (){
//
//                          To(context,ProductDetails(id: item.item.products[index].product.id,));
//                        },
//                        child: Stack(
//                          children: [
//                            Column(
//                              children: [
//                                Container(
//                                  color: Colors.black,
//                                  height: 220,
//                                  child: Image(
//                                    image: NetworkImage(
//                                        item.item.products[index].product.image),
//                                    fit: BoxFit.cover,
//                                  ),
//                                ),
//                                const SizedBox(
//                                  height: 10,
//                                ),
//                                Row(
//                                  children: [
//                                    CustomText(
//                                      text: item.item.products[index].product.name,
//                                      fontSize: 13,
//                                      alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,
//                                      maxLine: 1,
//                                    ),
//                                  ],
//                                ),
//                                const SizedBox(
//                                  height: 10,
//                                ),
//                                Row(
//                                  children: [
//                                    CustomText(
//                                      text: item.item.products[index].product.priceOffer == null ? item.item.products[index].product.price.p:item.item.products[index].product.priceOffer.p,
//                                      fontSize: 13,
//                                      alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,
//                                      maxLine: 1,
//                                    ),
//                                    const SizedBox(
//                                      width: 5,
//                                    ),
//                                    Row(
//                                      children: [
//                                        Visibility(
//                                          visible: item.item.products[index].product.priceOffer != null,
//                                          child: Row(
//                                            children: [
//                                              CustomText(
//                                                text: item.item.products[index].product.price.p,
//                                                fontSize: 12,
//                                                alignment:Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,
//                                                maxLine: 1,
//
//                                                color: Colors.grey,
//                                                isPrice: true,
//                                              ),
//                                            ],
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ],
//                                ),
//                                const SizedBox(
//                                  height: 10,
//                                ),
//                                Row(
//                                  children: [
//                                    CustomText(
//                                      text:
//                                      "SKU : ${item.item.products[index].product.sku}",
//                                      fontSize: 12,
//                                      alignment: Mypref.getlang() == "en" ?Alignment.centerLeft:Alignment.centerRight,
//                                      maxLine: 1,
//                                      // color: Colors.grey,
//                                    ),
//                                  ],
//                                ),
//                              ],
//                            ),
//                            Positioned(
//                                top: -10,
//                                right: -10,
//                                child: InkWell(
//
//                                  onTap: (){
//                                    if (!Mypref.IsLogin()){
//
//                                      showDialog(context: context, builder: (context) => Addtowishlist(onPressed: () {
//
//                                        Navigator.pop(context);
//
//                                      },title: "",text: "",image: "", buttonText: '',));
//                                      return;
//                                    }
//                                    api.favorite(item.item.id, false,context);
//                                  },
//                                  child: SvgPicture.asset(  'assets/image/favIcon.svg'  ,
//                                  ),
//                                )),
//                          ],
//                        ),
//                      ),
//                    ),
//                  ),
//                  itemCount: item.item.products.length,
//                ),
//              )),
//
//
//              Visibility(
//
//                visible: !isProduct,
//                child: item.item.services.length == 0 ? Padding(
//                padding: const EdgeInsets.all(50.0),
//                child: Column(
//                  children: [
//                    SvgPicture.asset("assets/image/noProduct.svg"),
//                    const SizedBox(
//                      height: 20,
//                    ),
//                    CustomText(
//                      text: "NO SERVICE TO SHOW!".tr(),
//                      fontWeight: FontWeight.bold,
//                    )
//                  ],
//                ),
//              ): Padding(
//                padding: const EdgeInsets.all(10.0),
//                child: GridView.builder(
//                  shrinkWrap: true,
//                  physics: const NeverScrollableScrollPhysics(),
//                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                      crossAxisCount: 2, childAspectRatio: 1),
//                  itemBuilder: (_, index) => Padding(
//                    padding:
//                    const EdgeInsets.only(left: 5.0, right: 5, bottom: 10),
//                    child: InkWell(
//                      onTap: () {
//                        To(context, ServiceScreen(id: item.item.services[index].service.id,name:item.item.services[index].service.name));
//
//                        //
//                      },
//                      child: Stack(
//                        children: [
//                          Column(
//                            children: [
//                              Container(
//                                color: Colors.black,
//                                height: 120,
//                                child: Image(
//                                  image: NetworkImage(
//                                      item.item.services[index].service.image),
//                                  fit: BoxFit.cover,
//                                ),
//                              ),
//                              const SizedBox(
//                                height: 10,
//                              ),
//                              CustomText(
//                                text: item.item.services[index].service.name,
//                                fontSize: 13,
//                                alignment: Alignment.centerLeft,
//                                maxLine: 1,
//                              ),
//                              const SizedBox(
//                                height: 10,
//                              ),
//                              Row(
//                                children: [
//                                  CustomText(
//                                    text: item.item.services[index].service.priceOffer == null ?  item.item.services[index].service.price.p :item.item.services[index].service.priceOffer.p ,
//                                    fontSize: 13,
//                                    alignment: Alignment.centerLeft,
//                                    maxLine: 1,
//                                  ),
//                                  const SizedBox(
//                                    width: 5,
//                                  ),
//                                  Visibility(
//                                    visible: item.item.services[index].service.priceOffer != null,
//                                    child: CustomText(
//                                      text:item.item.services[index].service.price.p,
//                                      fontSize: 12,
//                                      alignment: Alignment.centerLeft,
//                                      maxLine: 1,
//                                      isPrice: true,
//                                      color: Colors.grey,
//
//                                    ),
//                                  ),
//                                ],
//                              )
//                            ],
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                  itemCount: item.item.services.length,
//                ),
//              ),)
//
//           ],
//         ),
//       );
//     });
//   }
//
//   _launchURL(String url) async {
//     url = url;
//     if (await canLaunchUrl(Uri.parse(url))) {
//       await launchUrl(Uri.parse(url));
//     } else {
//       throw 'Could not launch $url';
//     }}
// }
