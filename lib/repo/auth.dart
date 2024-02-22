// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:abati_new/Model/MassegModel.dart';
import 'package:abati_new/Model/UserModel.dart';
import 'package:abati_new/Model/checkoutService.dart';
import 'package:abati_new/Model/orderedModel.dart';
import 'package:abati_new/Model/respons.dart';
import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/custom_widget/exit_confirmation_dialog.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/main.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/view/Home/web_view.dart';
import 'package:abati_new/webServec/api_path.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:abati_new/webServec/http_client.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../webServec/api_base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  //MARK: - Login
  Future<UserModel> signUp(String userName,String password,String size,String mobile,String email,BuildContext context) async {

    EasyLoading.show();
    Map<String, String> parm = {
      "name": userName,
      "email": email,
      "mobile": mobile,
      "size": size,
      "password": password,
      "fcm_token": "11",
      "device_type": Platform.isIOS ? "1":"0",
    };
    final response = await HttpClient.instance
        .postData(APIPathHelper.getValue(APIPath.signUp), parm);

    printGreen("Response - $response");
    var data = UserModel.fromJson(response);
    if (data.code == 200 && data.status == true) {
      EasyLoading.dismiss();
      Mypref.setIsLogin(true);
      Mypref.setUser(data);
      Mypref.setToken(data.item.accessToken);
      showDialog(context: context, builder: (context) => ExitConfirmationDialog(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));

      },title: "SUCCESSFULLY REGISTERED !".tr(),text: "Your email has been successfully registered!".tr(),image: "thumbs", buttonText: 'Explore Abati'.tr(),));

      return UserModel.fromJson(response);
    } else {
      EasyLoading.dismiss();
      AwesomeDialog(
        dismissOnBackKeyPress: true,
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: "Error".tr(),
        desc: data.message,
        btnCancelOnPress: () {
          // Navigator.of(context, rootNavigator: false).pop();

        },).show();

    }
  }
  Future<UserModel> login(String password,String email,BuildContext context) async {

    EasyLoading.show();
    Map<String, String> parm = {

      "email": email,
      "password": password,
      "fcm_token": "123",
      "device_type": Platform.isIOS ? "1":"0",
      "type": "2",
    };
    final response = await HttpClient.instance
        .postData(APIPathHelper.getValue(APIPath.login), parm);

    printGreen("Response - $response");
    var data = UserModel.fromJson(response);
    if (data.code == 200 && data.status == true) {
      // prefs.setString('apiToken', data.item.accessToken);
      EasyLoading.dismiss();
      Mypref.setIsLogin(true);
      Mypref.setUser(data);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
      return UserModel.fromJson(response);
    } else {
      EasyLoading.dismiss();
      AwesomeDialog(
        dismissOnBackKeyPress: true,
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: "Error".tr(),
        desc: data.message,
        btnCancelOnPress: () {
          // Navigator.of(context, rootNavigator: false).pop();

        },).show();

    }
  }
  Future<UserModel> editeProfile(String name,String mobile,String size,String email,BuildContext context) async {

    EasyLoading.show();
    Map<String, String> parm = {

      "name": name,
      "email": email,
      "mobile": mobile,
      "size": size,
      "fcm_token": "11",
      "device_type": Platform.isIOS ? "1":"0",
      "type": "1",
    };
    final response = await HttpClient.instance
        .postData(APIPathHelper.getValue(APIPath.editUserProfile), parm);

    printGreen("Response - $response");
    var data = UserModel.fromJson(response);
    if (data.code == 200 && data.status == true) {
      EasyLoading.dismiss();
      Mypref.setIsLogin(true);
      Mypref.setUser(data);
      showDialog(context: context, builder: (context) => ExitConfirmationDialog(onPressed: () {
        Navigator.pop(context);

      },title: "PROFILE UPDATED!".tr(),text: "Your profile has been updated Successfully .".tr(),image: "thumbs", buttonText: 'Go Back'.tr(),));
      return UserModel.fromJson(response);
    } else {
      EasyLoading.dismiss();
      AwesomeDialog(
        dismissOnBackKeyPress: true,
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: "Error".tr(),
        desc: data.message,
        btnCancelOnPress: () {
          // Navigator.of(context, rootNavigator: false).pop();

        },).show();

    }
  }
  Future<UserModel> changeOrderStatusFromDesignerApp(String id,BuildContext context) async {

    EasyLoading.show();
    Map<String, String> parm = {

      "designer_acceptance": id,

    };
    final response = await HttpClient.instance
        .postData(APIPathHelper.getValue(APIPath.changeOrderStatusFromDesignerApp), parm);

    printGreen("Response - $response");
    var data = UserModel.fromJson(response);
    if (data.code == 200 && data.status == true) {

      showDialog(context: context, builder: (context) => ExitConfirmationDialog(onPressed: () {
        Navigator.pop(context);

      },title: "Accept order?".tr(),text: "Are you sure you want to accept this order?".tr(),image: "thumbs", buttonText: 'Yes, Accept'.tr(),));

      return UserModel.fromJson(response);
    } else {
      EasyLoading.dismiss();
      AwesomeDialog(
        dismissOnBackKeyPress: true,
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: "Error".tr(),
        desc: data.message,
        btnCancelOnPress: () {
          // Navigator.of(context, rootNavigator: false).pop();

        },).show();

    }
  }
  Future<UserModel> forgotPassword(String email,BuildContext context) async {

    EasyLoading.show();
    Map<String, String> parm = {

      "email": email,

    };
    final response = await HttpClient.instance
        .postData(APIPathHelper.getValue(APIPath.forgotPassword), parm);

    printGreen("Response - $response");
    var data = UserModel.fromJson(response);
    if (data.code == 200 && data.status == true) {

      showDialog(context: context, builder: (context) => ExitConfirmationDialog(onPressed: () {
        Navigator.pop(context);

      },title: "Check email".tr(),text: "We sent an reset password link on  your Registered email address! .".tr(),image: "thumbs", buttonText: 'Continue'.tr(),));

      return UserModel.fromJson(response);
    } else {
      EasyLoading.dismiss();
      AwesomeDialog(
        dismissOnBackKeyPress: true,
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: "Error".tr(),
        desc: data.message,
        btnCancelOnPress: () {
          // Navigator.of(context, rootNavigator: false).pop();

        },).show();

    }
  }


}

class Api{
  Future<MassegModel> changeOrderStatusFromDesignerApp(String id,int Status,int selected,BuildContext context) async {

    EasyLoading.show();
    Map<String, String> parm = {

      "designer_acceptance": "$Status",

    };
    final response = await HttpClient.instance
        .postData(APIPathHelper.getValue(APIPath.changeOrderStatusFromDesignerApp) + "/${id}", parm);

    printGreen("Response - $response");
    var data = MassegModel.fromJson(response);
    if (data.code == 200 && data.status == true) {

      if (selected == 4){

      }else{
        Provider.of<APIProvider>(context, listen: false).fetchDesinerOrders(selected,"",false);



        Navigator.pop(context);
      }



      return MassegModel.fromJson(response);
    } else {
      EasyLoading.dismiss();
      AwesomeDialog(
        dismissOnBackKeyPress: true,
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: "Error".tr(),
        desc: data.message,
        btnCancelOnPress: () {
          // Navigator.of(context, rootNavigator: false).pop();

        },).show();

    }
  }

  Future<ResponsModel> favorite(int id,bool iswish,BuildContext context) async {


    EasyLoading.show();

    final response = await HttpClient.instance.fetchData(APIPathHelper.getValue(APIPath.favorite) + "/${id}");

    printGreen("Response - $response");
    var data = UserModel.fromJson(response);
    if (data.code == 200 && data.status == true) {
      EasyLoading.dismiss();
      Provider.of<APIProvider>(context, listen: false).fetchMyFavorite();
      // Navigator.pop(context);
      AwesomeDialog(
        dismissOnBackKeyPress: true,
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.scale,
        title: "Successfully".tr(),
        desc: data.message,
        btnOkOnPress: (){

          if (iswish){
          Navigator.pop(context);
          }


        },).show();


      return ResponsModel.fromJson(response);
    } else {
      EasyLoading.dismiss();
      AwesomeDialog(
        dismissOnTouchOutside: true,
        dismissOnBackKeyPress: true,
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: "Error".tr(),
        desc: data.message,
        btnCancelOnPress: () {
          // Navigator.of(context, rootNavigator: false).pop();

        },).show();

    }
  }
  Future<CheckoutServiceModel> checkPromoCodeForBookingService(int id,String code,BuildContext context) async {


    EasyLoading.show();
    Map<String, String> parm = {
      "code": code,
      "id": "6",
    };
    final response = await HttpClient.instance.postData(APIPathHelper.getValue(APIPath.checkPromoCodeForBookingService), parm);

    printGreen("Response - $response");
    var data = UserModel.fromJson(response);
    if (data.code == 200 && data.status == true) {
      EasyLoading.dismiss();
      // AwesomeDialog(
      //   dismissOnBackKeyPress: true,
      //   context: context,
      //   dialogType: DialogType.success,
      //   animType: AnimType.scale,
      //   title: "Successfully",
      //   desc: data.message,
      //   btnOkOnPress: (){
      //
      //   },).show();


      return CheckoutServiceModel.fromJson(response);
    } else {
      EasyLoading.dismiss();
      AwesomeDialog(
        dismissOnTouchOutside: true,
        dismissOnBackKeyPress: true,
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: "Error".tr(),
        desc: data.message,
        btnCancelOnPress: () {
          // Navigator.of(context, rootNavigator: false).pop();

        },).show();

    }
  }
  Future<MassegModel> addToCart(int productId,String quantity,int colorId,int sizeId,int heightId,String userSpecialSize,String giftWrapping,String note,BuildContext context) async {


    EasyLoading.show();
    Map<String, String> parm = {
      "product_id": "$productId",
      "quantity": quantity,
      "color_id": "$colorId",
      "size_id": "$sizeId",
      "height_id": "$heightId",
      "user_special_size": userSpecialSize,
      "gift_wrapping": giftWrapping,
      "note": note,
    };
    final response = await HttpClient.instance.postData(APIPathHelper.getValue(APIPath.addToCart), parm);

    printGreen("Response - $response");
    var data = MassegModel.fromJson(response);
    if (data.code == 200 && data.status == true) {
      EasyLoading.dismiss();
      AwesomeDialog(
        dismissOnBackKeyPress: true,
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.scale,
        title: "Successfully".tr(),
        desc: data.message,
        btnOkOnPress: (){

        },).show();


      return MassegModel.fromJson(response);
    } else {
      EasyLoading.dismiss();
      AwesomeDialog(
        dismissOnTouchOutside: true,
        dismissOnBackKeyPress: true,
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: "Error".tr(),
        desc: data.message,
        btnCancelOnPress: () {
          // Navigator.of(context, rootNavigator: false).pop();

        },).show();

    }
  }
  Future<MassegModel> removeFromCart(int productId,BuildContext context) async {


    EasyLoading.show();
    final response = await HttpClient.instance.postData(APIPathHelper.getValue(APIPath.removeFromCart) + "/${productId}", null);

    printGreen("Response - $response");
    var data = MassegModel.fromJson(response);
    if (data.code == 200 && data.status == true) {
      Provider.of<APIProvider>(context, listen: false).fetchMyCart();

      EasyLoading.dismiss();
      // AwesomeDialog(
      //   dismissOnBackKeyPress: true,
      //   context: context,
      //   dialogType: DialogType.success,
      //   animType: AnimType.scale,
      //   title: "Successfully",
      //   desc: data.message,
      //   btnOkOnPress: (){
      //
      //   },).show();


      return MassegModel.fromJson(response);
    } else {
      EasyLoading.dismiss();
      AwesomeDialog(
        dismissOnTouchOutside: true,
        dismissOnBackKeyPress: true,
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: "Error".tr(),
        desc: data.message,
        btnCancelOnPress: () {
          // Navigator.of(context, rootNavigator: false).pop();

        },).show();

    }
  }
  Future<MassegModel> changeQuantity(int productId,int type,BuildContext context) async {


    EasyLoading.show();
    Map<String, String> parm = {

      "type": "$type",

    };
    final response = await HttpClient.instance.postData(APIPathHelper.getValue(APIPath.changeQuantity) + "/${productId}", parm);

    printGreen("Response - $response");
    var data = MassegModel.fromJson(response);
    if (data.code == 200 && data.status == true) {
      Provider.of<APIProvider>(context, listen: false).fetchMyCart();

      EasyLoading.dismiss();
      // AwesomeDialog(
      //   dismissOnBackKeyPress: true,
      //   context: context,
      //   dialogType: DialogType.success,
      //   animType: AnimType.scale,
      //   title: "Successfully",
      //   desc: data.message,
      //   btnOkOnPress: (){
      //
      //   },).show();


      return MassegModel.fromJson(response);
    } else {
      EasyLoading.dismiss();
      AwesomeDialog(
        dismissOnTouchOutside: true,
        dismissOnBackKeyPress: true,
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: "Error".tr(),
        desc: data.message,
        btnCancelOnPress: () {
          // Navigator.of(context, rootNavigator: false).pop();

        },).show();

    }
  }
  Future<MassegModel> addNewAddress(String title,int countryId,int areaId,String firstAddressLine,String secondAddressLine,String extraDirections,BuildContext context) async {


    EasyLoading.show();
    Map<String, String> parm = {

      "title": title,
      "country_id": "$countryId",
      "area_id": "$areaId",
      "first_address_line": firstAddressLine,
      "second_address_line": secondAddressLine,
      "extra_directions": extraDirections,

    };
    final response = await HttpClient.instance.postData(APIPathHelper.getValue(APIPath.addNewAddress) , parm);

    printGreen("Response - $response");
    var data = MassegModel.fromJson(response);
    if (data.code == 200 && data.status == true) {
      Provider.of<APIProvider>(context, listen: false).fetchMyAddresses();

      EasyLoading.dismiss();
      Navigator.pop(context);
      // AwesomeDialog(
      //   dismissOnBackKeyPress: true,
      //   context: context,
      //   dialogType: DialogType.success,
      //   animType: AnimType.scale,
      //   title: "Successfully",
      //   desc: data.message,
      //   btnOkOnPress: (){
      //
      //   },).show();


      return MassegModel.fromJson(response);
    } else {
      EasyLoading.dismiss();
      AwesomeDialog(
        dismissOnTouchOutside: true,
        dismissOnBackKeyPress: true,
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: "Error",
        desc: data.message,
        btnCancelOnPress: () {
          // Navigator.of(context, rootNavigator: false).pop();

        },).show();

    }
  }
  Future<MassegModel> editeAddress(int addressId , String title,int countryId,int areaId,String firstAddressLine,String secondAddressLine,String extraDirections,BuildContext context) async {


    EasyLoading.show();
    Map<String, String> parm = {

      "title": title,
      "country_id": "$countryId",
      "area_id": "$areaId",
      "first_address_line": firstAddressLine,
      "second_address_line": secondAddressLine,
      "extra_directions": extraDirections,

    };
    final response = await HttpClient.instance.postData(APIPathHelper.getValue(APIPath.editAddress)  + "/$addressId", parm);

    printGreen("Response - $response");
    var data = MassegModel.fromJson(response);
    if (data.code == 200 && data.status == true) {
      Provider.of<APIProvider>(context, listen: false).fetchMyAddresses();

      EasyLoading.dismiss();
      Navigator.pop(context);
      // AwesomeDialog(
      //   dismissOnBackKeyPress: true,
      //   context: context,
      //   dialogType: DialogType.success,
      //   animType: AnimType.scale,
      //   title: "Successfully",
      //   desc: data.message,
      //   btnOkOnPress: (){
      //
      //   },).show();


      return MassegModel.fromJson(response);
    } else {
      EasyLoading.dismiss();
      AwesomeDialog(
        dismissOnTouchOutside: true,
        dismissOnBackKeyPress: true,
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: "Error".tr(),
        desc: data.message,
        btnCancelOnPress: () {
          // Navigator.of(context, rootNavigator: false).pop();

        },).show();

    }
  }
  Future<MassegModel> deleteAddress(int addressId,BuildContext context) async {


    EasyLoading.show();
    final response = await HttpClient.instance.postData(APIPathHelper.getValue(APIPath.deleteAddress) + "/$addressId", null);

    printGreen("Response - $response");
    var data = MassegModel.fromJson(response);
    if (data.code == 200 && data.status == true) {
      Provider.of<APIProvider>(context, listen: false).fetchMyAddresses();

      EasyLoading.dismiss();
      // Navigator.pop(context);
      AwesomeDialog(
        dismissOnBackKeyPress: true,
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.scale,
        title: "Successfully".tr(),
        desc: data.message,
        btnOkOnPress: (){

        },).show();


      return MassegModel.fromJson(response);
    } else {
      EasyLoading.dismiss();
      AwesomeDialog(
        dismissOnTouchOutside: true,
        dismissOnBackKeyPress: true,
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: "Error".tr(),
        desc: data.message,
        btnCancelOnPress: () {
          // Navigator.of(context, rootNavigator: false).pop();

        },).show();

    }
  }
  Future<CheckoutServiceModel> checkPromoCodeForProducts(String addressId,String areaId,String code,BuildContext context) async {


    EasyLoading.show();
    Map<String, String> parm = {
      "code": code,
      "address_country_id": addressId,
      "area_id": areaId,
    };
    final response = await HttpClient.instance.postData(APIPathHelper.getValue(APIPath.checkPromoCodeForProducts), parm);

    printGreen("Response - $response");
    var data = UserModel.fromJson(response);
    if (data.code == 200 && data.status == true) {
      EasyLoading.dismiss();
      // AwesomeDialog(
      //   dismissOnBackKeyPress: true,
      //   context: context,
      //   dialogType: DialogType.success,
      //   animType: AnimType.scale,
      //   title: "Successfully",
      //   desc: data.message,
      //   btnOkOnPress: (){
      //
      //   },).show();


      return CheckoutServiceModel.fromJson(response);
    } else {
      EasyLoading.dismiss();
      AwesomeDialog(
        dismissOnTouchOutside: true,
        dismissOnBackKeyPress: true,
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: "Error".tr(),
        desc: data.message,
        btnCancelOnPress: () {
          // Navigator.of(context, rootNavigator: false).pop();

        },).show();

    }
  }
  Future<OrderedModel> storeOrder(String paymentMethod,String addressId,String code,BuildContext context) async {


    EasyLoading.show();
    Map<String, String> parm = {
      "payment_method": paymentMethod,
      "address_id": addressId,
      "code": code,

    };
    final response = await HttpClient.instance.postData(APIPathHelper.getValue(APIPath.storeOrder), parm);

    printGreen("Response - $response");
    var data = OrderedModel.fromJson(response);
    if (data.code == 200 && data.status == true) {
      EasyLoading.dismiss();
      // launchURL(data.url);
      // Navigator.pop(context);


      To(context, WebViewScreen(url: data.url,isOrder: true,orderID: data.orderId,));

      return OrderedModel.fromJson(response);
    } else {
      EasyLoading.dismiss();
      AwesomeDialog(
        dismissOnTouchOutside: true,
        dismissOnBackKeyPress: true,
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: "Error",
        desc: data.message,
        btnCancelOnPress: () {
          // Navigator.of(context, rootNavigator: false).pop();

        },).show();

    }
  }
  Future<OrderedModel> RstoreOrder(String paymentMethod,String addressId,String customerName,String customerEmail,String customerMobile,String addressCountryId,String areaId,String firstAddressLine,String secondAddressLine,String extraDirections,String code,BuildContext context) async {


    EasyLoading.show();
    Map<String, String> parm = {
      "payment_method": paymentMethod,
      "address_id": addressId,
      "customer_name": customerName,
      "customer_email": customerEmail,
      "customer_mobile": customerMobile,
      "address_country_id": addressCountryId,
      "area_id": areaId,
      "first_address_line": firstAddressLine,
      "second_address_line": secondAddressLine,
      "extra_directions": extraDirections,
      "code": code,

    };
    final response = await HttpClient.instance.postData(APIPathHelper.getValue(APIPath.storeOrder), parm);

    printGreen("Response - $response");
    var data = OrderedModel.fromJson(response);
    if (data.code == 200 && data.status == true) {
      EasyLoading.dismiss();
      // launchURL(data.url);
      // Navigator.pop(context);


      To(context, WebViewScreen(url: data.url,isOrder: true,orderID: data.orderId,));

      return OrderedModel.fromJson(response);
    } else {
      EasyLoading.dismiss();
      AwesomeDialog(
        dismissOnTouchOutside: true,
        dismissOnBackKeyPress: true,
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: "Error",
        desc: data.message,
        btnCancelOnPress: () {
          // Navigator.of(context, rootNavigator: false).pop();

        },).show();

    }
  }
  Future<UserModel> ContactUs(String name,String mobile,String email,String message,BuildContext context) async {

    EasyLoading.show();
    Map<String, String> parm = {

      "name": name,
      "email": email,
      "mobile": mobile,
      "message": message,

    };
    final response = await HttpClient.instance
        .postData(APIPathHelper.getValue(APIPath.contactUs), parm);

    printGreen("Response - $response");
    var data = UserModel.fromJson(response);
    if (data.status == true) {
      EasyLoading.dismiss();
      showDialog(context: context, builder: (context) => ExitConfirmationDialog(onPressed: () {
        Navigator.pop(context);

      },title: "Form Submitted!".tr(),text: "Your form has been submitted successfully".tr(),image: "thumbs", buttonText: 'Go Back'.tr(),));
      return UserModel.fromJson(response);
    } else {
      EasyLoading.dismiss();
      AwesomeDialog(
        dismissOnBackKeyPress: true,
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: "Error".tr(),
        desc: data.message,
        btnCancelOnPress: () {
          // Navigator.of(context, rootNavigator: false).pop();

        },).show();

    }
  }
  Future<OrderedModel> bookService(String paymentMethod,String code,String dateId,String slotId,String Id,String customerName,String customerEmail,String customerMobile,BuildContext context) async {


    EasyLoading.show();
    Map<String, String> parm = {
      "payment_method": paymentMethod,
      "code": code,
      "date_id": dateId,
      "slot_id": slotId ,
      "id": Id,
      "customer_name":  customerName,
      "customer_email": customerEmail,
      "customer_mobile": customerMobile,

    };
    printGreen("parmparm - $parm");
    final response = await HttpClient.instance.postData(APIPathHelper.getValue(APIPath.bookService), parm);

    printGreen("Response - $response");

    var data = OrderedModel.fromJson(response);
    if (data.code == 200 && data.status == true) {
      EasyLoading.dismiss();
      // launchURL(data.url);


      // Navigator.pop(context);

      To(context, WebViewScreen(url: data.url,isOrder: false,orderID: data.orderId,));

      return OrderedModel.fromJson(response);
    } else {
      EasyLoading.dismiss();
      AwesomeDialog(
        dismissOnTouchOutside: true,
        dismissOnBackKeyPress: true,
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: "Error".tr(),
        desc: data.message,
        btnCancelOnPress: () {
          // Navigator.of(context, rootNavigator: false).pop();

        },).show();

    }
  }


}


launchURL(String url) async {
  url = url;
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }}