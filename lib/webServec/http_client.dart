import 'dart:async';
import 'dart:convert';
import 'dart:io';
// import 'package:alsour/main.dart';
// import 'package:alsour/src/helper/Pref.dart';
// import 'package:alsour/src/screen/NoWifi.dart';
// import 'package:alsour/src/widget/custom_text.dart';
// import 'package:easy_localization/src/public_ext.dart';
import 'package:abati_new/Helper/Pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
// import 'package:smh_user/Helpers/Pref.dart';
import 'api_base_url.dart';
import 'api_exceptions_error.dart';
import 'package:http/http.dart' as http;
// import 'package:connectivity_plus/connectivity_plus.dart';

class HttpClient {
  static final HttpClient _singleton = HttpClient();

  static HttpClient get instance => _singleton;
  Future<dynamic> fetchData(String url, { Map<String, String> params,bool isLoad = true }) async {



    //
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.mobile) {
    //   // I am connected to a mobile network.
    // } else if (connectivityResult == ConnectivityResult.wifi) {
    //   // I am connected to a wifi network.
    // }else{
    //   // Navigator.push(, NoWifi());
    //
    //   pushNewScreen(
    //     NavigationService.navigatorKey.currentContext,
    //     screen: NoWifi(),
    //     withNavBar: false, // OPTIONAL VALUE. True by default.
    //     pageTransitionAnimation: PageTransitionAnimation.fade,
    //   );
    // }
    // print("${Mypref.getCurrency()}232323");
    if(isLoad){
      EasyLoading.show(status: '');

    }
    var responseJson;
    var uri = APIBase.baseURL +
        url + ((params != null) ? this.queryParameters(params) : "");
    print("hhhhhh--->>$uri");
    var header = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: Mypref.IsLogin() == true ? 'Bearer ${Mypref.getUser().item.accessToken}' :"",
      HttpHeaders.acceptLanguageHeader: Mypref.getDlang(),
      "countryId": "${Mypref.getCurrency() == null ? "1":Mypref.getCurrency().id}",
      "fcmToken": "123",
    };

    try {
      final uri = Uri.parse(APIBase.baseURL + url+ ((params != null) ? this.queryParameters(params) : ""));
      final response = await http.get(uri, headers: header);
      print("response.statusCoderesponse.statusCode-->>${response.statusCode}");

      if( response.statusCode == 500){

        // showAlert(NavigationService.navigatorKey.currentContext);
      }
      responseJson = _returnResponse(response);
    } on SocketException {
      EasyLoading.dismiss();
      // EasyLoading.showToast("No Internet connection");
      // pushNewScreen(
      //       NavigationService.navigatorKey.currentContext,
      //       screen: NoWifi(),
      //       withNavBar: false, // OPTIONAL VALUE. True by default.
      //       pageTransitionAnimation: PageTransitionAnimation.fade,
      //     );
      EasyLoading.dismiss();
      throw FetchDataException('No Internet connection');
    }

    print(responseJson);
    return responseJson;
  }
  Future<dynamic> postData(String url, dynamic body) async {
    EasyLoading.show(status: '');
    var responseJson;
    var header = {
      //FIX THAT
      // HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: Mypref.IsLogin() == true ? 'Bearer ${Mypref.getUser().item.accessToken}' :"",
      // HttpHeaders.authorizationHeader: 'Bearer ${Mypref.getUser().item.accessToken}' ,
      HttpHeaders.acceptLanguageHeader: Mypref.getDlang(),
      "countryId": "${Mypref.getCurrency() == null ? "1":Mypref.getCurrency().id}",
      "fcmToken": "123",

    };
    try {

      final uri = Uri.parse(APIBase.baseURL + url);
      final response =
      await http.post(uri, body: body, headers: header);

      EasyLoading.dismiss();
      print("response.statusCoderesponse.statusCode${response.statusCode}");
      if( response.statusCode == 500){

        EasyLoading.showError("Error --> 500");
      }
      responseJson = _returnResponse(response);
    } on SocketException {
      EasyLoading.dismiss();
      // pushNewScreen(
      //   NavigationService.navigatorKey.currentContext,
      //   screen: NoWifi(),
      //   withNavBar: false, // OPTIONAL VALUE. True by default.
      //   pageTransitionAnimation: PageTransitionAnimation.fade,
      // );
      throw FetchDataException('No Internet connection');
    }
    EasyLoading.dismiss();
    return responseJson;
  }



  //FIXME:- token is error
  String queryParameters(Map<String, String> params) {
    if (params != null) {
      final jsonString = Uri(queryParameters: params);
      return '?${jsonString.query}';
    }
    return '';
  }
  Future<dynamic> fetchDataWhere(String url, String Id) async {
    // EasyLoading.show(status: '');
    var responseJson;
    // var uri = APIBase.baseURL + url + Id;
    var uri = "http://offermycars.me/api/deletePost/8";
    var header = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer ${Mypref.getToken()}'

      // 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiODIwMThmZjY3NDcxNGIxMGE5YmNmZjYzNDY5MzcxMTRkOWJkY2M4MDQxN2E4MmJmNzhiNzFhMzIzMzg1ZjJhMmExYWQzYTYxYmZlMmRmOTUiLCJpYXQiOiIxNjE4NjcwNjg0LjE2MDIxNyIsIm5iZiI6IjE2MTg2NzA2ODQuMTYwMjIyIiwiZXhwIjoiMTY1MDIwNjY4NC4xNTU0MzIiLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.EzeCsZuEPBsvwJbesbctWsSMavxECJXIcQSKRqFRUU1lTsa2WCaC3zTVLF7g3sgJxRs0Bwno1I8BeQcXsscPZNy7HbOqE7Mcwl-4oUBn9xA8qHR3uvZqSCZT3_kPTypXvh0bzt8GnW_OX_FzvGjZ37JqNc1l60is909wttRmtI5extOw_WiVpnLvHU2GVmGbqo-SsZNs1KKhJW6zpOTccWTNlQlwVon6d9eVQuYZOBz60-i72wMM3SJz5IzLYweQ10AFTqP2awIzI4-Zs5cHbGXSwUkzShZ8_k_aoEgrUWOhRoG9L37HBBaLjO-MhB_r91EDz66WQ17p57Yli3y8LJtn53ytYsPXmbBUU9IDOKFATHwhAW8HIg9bBf_Q-N3dzXh5dOUoBCUWPUPnQvAvyPFaVwleqSSlAI1Nu_EL_dMtvsa6m_yq7UO9HxUYkv8F3SfL4N3gUdn6ZpPhQEEOMcIjH4TuSkKKJfTHfG-1ZRtFWQeKNNS9MR39bJebyDvkAScOXg9reSPGU8Jq8aadg6YUeENcxJYBT429LtrSUaKTZ4SogzZlZcE441nBLgef-7kdsJqvPGImXQleobmBimXk_zvRo4GjAq1NndISUvHlc3elmIu8ZuAUkPvBdEyaWMCYNi0Fe2Tv79QuAp07rgW-QdQNA1IBmzbUQOfi67E'

    };
    try {

      var  base = APIBase.baseURL + url;
      var requseturl = Uri.http(base,"");

      final response = await http.get(requseturl, headers: header);
      print(response.statusCode);
      responseJson = _returnResponse(response);

      if (response.statusCode == 404){
        print("osamaa abu dahi22");

      }
      // EasyLoading.showToast("No Internet connection");

    } on SocketException {
      // EasyLoading.showToast("No Internet connection");
      throw FetchDataException('No Internet connection');
    }

    print(responseJson);
    print("osamaa abu dahi");
    return responseJson;
  }
  Future<dynamic> getwherId(String Url,String Id) async {
    final response = await http.get(
      Uri.parse('$Url$Id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',

        // 'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZDVmNDAzOWU0NWRhZWRjZWEwYTJkNjg5NDYyNjEwOTIwYTUxZTViZjBiZGVlYTA1MGUxYmQyODllY2JjMzMzNzE3NmYxY2NjMjRhZDRkZjQiLCJpYXQiOiIxNjIxMzI1MDY5LjY0MjA3OCIsIm5iZiI6IjE2MjEzMjUwNjkuNjQyMDg0IiwiZXhwIjoiMTY1Mjg2MTA2OS42Mzc4NjYiLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.A4BOlLvVYaUUnIEr_T518ovi1pW8223txT3SC32C4cZdx9qssM4DHlpNfMe-7qtLsKXO_KmbyN14mKisw1ZaDyH-hMVgyIqEj6u3Qfl91pgeTSCq7j2qKstBzFNvAplPWu17aBry3RZCHdg0L5_ZqrrwsSBXgrR8p3CSzzRP13pcRORcNyR2LkZdKhhQjxBmg5pSl4hHd4TwT5PS9_smfjmrIji4GrhWW5z5rfPAxtmJwloJgLF6Bwz5uoBLeJH8e2PeJMzBd0U28wRAHRGoHePtY3lMmoDmzZ-gCa6xDT0KBbcs-4hMmk6RmOv1Mme7EZEO98um0ssw-JjoCa62K23A5ddIcis5BsaUXzEA43Sor9bZWpFD6AayOk9tI_d_bBOusDD2dtuno7BtulEF6TuQMMxWgif078U3TEyjqeFftJymxRD22XN9KzAW6IMgVfPmoMRm_dJ2En6tKwdMQU9m6FsyJeySS7OLpQg2fy3tfDvAT-VhxQIDLB54mxKprax2ZSTrwvkmkanhj9QI8WejlKTM0EAH8iJqk_nutHzkFihHK5BsTmw-U1Ns6V-ce-KxSHM6tmIMOQzuQCwDH9SDY-1ID8zcYAfIPwYELUtdePyFYT0hf_3wNx3dVf5EpXvFxs_oCMku-IYpLGPArnOMi-lNvWEAYNICO6h-7DM'
        // 'Authorization': "Bearer" + Mypref.getUser().accessToken
      },
    );
    print("-------------------------------response.statusCode-----------------------------------");
    print(response.statusCode);
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  dynamic _returnResponse(http.Response response) {

    EasyLoading.dismiss();


    switch (response.statusCode) {

    case 200:
        var responseJson = json.decode(response.body.toString());
        print(response.body,);
        EasyLoading.dismiss();
        return responseJson;
      case 400:
        EasyLoading.dismiss();

        print("400 BadRequestException");
        EasyLoading.showError("400 BadRequestException");

        print(response.body.toString());
        throw BadRequestException(response.body.toString());
      case 401:
        EasyLoading.dismiss();

        print("401 Unauthorized BadRequestException");
        EasyLoading.showError("401 Unauthorized BadRequestException");

        print(response.body.toString());
        throw BadRequestException(response.body.toString());
      case 403:

        EasyLoading.showError("403 BadRequestException");

        EasyLoading.dismiss();

        print("400 BadRequestException");
        print(response.body.toString());
        EasyLoading.showError("400 BadRequestException");

        throw UnauthorisedException(response.body.toString());

      case 404:
        EasyLoading.dismiss();

        print("404 BadRequestException");
        EasyLoading.showError("404 BadRequestException");

        print(response.body.toString());

        // Navigator.pop(NavigationService.navigatorKey.currentContext);

        throw BadRequestException(response.body.toString());
      case 500:
        EasyLoading.dismiss();
        print("500 Internal Server Error");
        //
        // EasyLoading.showError("500 Internal Server Error");
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }}
//   void showAlert(BuildContext context) {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Dialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0)), //this right here
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.4,
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   // crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//
//                     Container(
//
//
//                       child: SvgPicture.asset(
//
//                         "assets/image/logouts.svg",
//
//                         // fit: BoxFit.cover,
//                       ),
//                     ),
//
//                     CustomText(
//
//                       text: "Session Expired".tr(),
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                       alignment: Alignment.center,
//                     ),
//                     SizedBox(height: 30,),
//                     CustomText(
//                       height: 1.5,
//                       text:
//                       "You’ve logged in using another device,\n Do you want to login here? ".tr() ,
//                       fontSize: 15,
//                       fontWeight: FontWeight.normal,
//                       alignment: Alignment.center,
//                     ),
//                     SizedBox(height: 30,),
//                     Container(
//                         width: 150,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10.0),
//                           // color: primaryColor,
//                           gradient:
//
//
//                           LinearGradient(
//                             begin: Alignment(1.0, 0.0),
//                             end: Alignment(-1.0, 0.0),
//                             colors:  [
//                               // primaryColor
//                               const Color(0xff2957a4),
//                               const Color(0xff136cb4),
//                               const Color(0xff1070b7),
//                               const Color(0xff3a80c1),
//                               const Color(0xff2878b7)
//                             ],
//                             stops: [0.0, 0.345, 0.576, 0.764, 1.0],
//                           ) ,
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color(0x291466cc),
//                               offset: Offset(0, 6),
//                               blurRadius: 15,
//                             ),
//                           ],
//                         ),
//                         child:TextButton(
//
//                           onPressed: (){
//                             Mypref.removeUser();
//                             Mypref.removeToken();
//                             // Mypref.remove();
//                             // RestartWidget.restartApp(context);                          },
//                           // child: CustomText(text: "LOGIN HERE".tr(),fontWeight: FontWeight.bold,color: Colors.white,),)
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
//
// }

// class NavigationService {
//   static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// }
