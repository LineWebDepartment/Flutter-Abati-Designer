// ignore: file_names
// ignore_for_file: file_names

import 'dart:convert';
import 'package:abati_new/Model/CategoriesModel.dart';
import 'package:abati_new/Model/CategoryDetails.dart';
import 'package:abati_new/Model/CelebritiesModel.dart';
import 'package:abati_new/Model/CheckoutModel.dart';
import 'package:abati_new/Model/DesignerDetailsModel.dart';
import 'package:abati_new/Model/DesignersModle.dart';
import 'package:abati_new/Model/HomeModel.dart';
import 'package:abati_new/Model/MyCart.dart';
import 'package:abati_new/Model/MyOrderDetailsModel.dart';
import 'package:abati_new/Model/MyorderModle.dart';
import 'package:abati_new/Model/OrderModel.dart';
import 'package:abati_new/Model/ProductDetails.dart';
import 'package:abati_new/Model/ServiceCategoriesModel.dart';
import 'package:abati_new/Model/Services.dart';
import 'package:abati_new/Model/VideoModel.dart';
import 'package:abati_new/Model/bestSellerModel.dart';
import 'package:abati_new/Model/bookingDetailsModel.dart';
import 'package:abati_new/Model/celebrityDetails.dart';
import 'package:abati_new/Model/celebrityServices.dart';
import 'package:abati_new/Model/checkoutService.dart';
import 'package:abati_new/Model/designerRatesModel.dart';
import 'package:abati_new/Model/designerStatistics.dart';
import 'package:abati_new/Model/myAddresseModel.dart';
import 'package:abati_new/Model/myBookings.dart';
import 'package:abati_new/Model/myFavorites.dart';
import 'package:abati_new/Model/searchModel.dart';
import 'package:abati_new/Model/serviceDetails.dart';
import 'package:abati_new/Model/servicesModel.dart';
import 'package:abati_new/Model/videoDetails.dart';
import 'package:abati_new/view/Home/Videos/VideosDetiles.dart';
import 'package:abati_new/webServec/api_path.dart';
import 'package:abati_new/webServec/http_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Model/SettingModel.dart';
import '../view/Home/DesignerDetails.dart';
import 'APIProvider.dart';

class APIService {

Future<SettingModel> getSetting(bool isLoad) async {
    final response = await HttpClient.instance
        .fetchData(
        APIPathHelper.getValue(APIPath.getSetting), isLoad: isLoad);
    var data = SettingModel.fromJson(response);
    return SettingModel.fromJson(response);
  }

Future<DesignerStatisticsModel> designerStatistics() async {
  final response = await HttpClient.instance
      .fetchData(
      APIPathHelper.getValue(APIPath.designerStatistics), isLoad: true);
  var data = DesignerStatisticsModel.fromJson(response);
  return DesignerStatisticsModel.fromJson(response);
}
Future<OrderModel> getOrders(int id,String sharch,bool isSerch) async {


  // id
  Map<String, String> parm = {
    "id": sharch,

  };

  final response = await HttpClient.instance
      .fetchData(APIPathHelper.getValue(APIPath.designerOrders) + "/${id}",params:isSerch ? parm:null , isLoad: true);
  var data = OrderModel.fromJson(response);
  return OrderModel.fromJson(response);
}
Future<MyAddressesModel> getMyAddress() async {
  final response = await HttpClient.instance
      .fetchData(APIPathHelper.getValue(APIPath.myAddresses), isLoad: true);
  var data = MyAddressesModel.fromJson(response);
  return MyAddressesModel.fromJson(response);
}
Future<MyFavoritesModel> getMyFavorites() async {
  final response = await HttpClient.instance
      .fetchData(APIPathHelper.getValue(APIPath.myFavorites), isLoad: false);
  var data = MyFavoritesModel.fromJson(response);
  return MyFavoritesModel.fromJson(response);
}
Future<CategoriesModel> getCategories() async {
  final response = await HttpClient.instance
      .fetchData(APIPathHelper.getValue(APIPath.getCategories), isLoad: true);
  var data = CategoriesModel.fromJson(response);
  return CategoriesModel.fromJson(response);
}
Future<ServiceCategoriesModel> getServices() async {
  final response = await HttpClient.instance
      .fetchData(APIPathHelper.getValue(APIPath.getServiceCategories), isLoad: true);
  var data = ServiceCategoriesModel.fromJson(response);
  return ServiceCategoriesModel.fromJson(response);
}
Future<HomeModel> getHome() async {
  final response = await HttpClient.instance
      .fetchData(APIPathHelper.getValue(APIPath.home), isLoad: true);
  var data = HomeModel.fromJson(response);
  return HomeModel.fromJson(response);
}

Future<DesignersModel> getDesigners() async {
  final response = await HttpClient.instance
      .fetchData(APIPathHelper.getValue(APIPath.getDesigners), isLoad: true);
  var data = DesignersModel.fromJson(response);
  return DesignersModel.fromJson(response);
}

Future<CelebritiesModel> getCelebrities() async {
  final response = await HttpClient.instance
      .fetchData(APIPathHelper.getValue(APIPath.getCelebrities), isLoad: true);
  var data = CelebritiesModel.fromJson(response);
  return CelebritiesModel.fromJson(response);
}
Future<CelebrityDetailsModel> getCelebrityDetails(int id) async {
  final response = await HttpClient.instance
      .fetchData(APIPathHelper.getValue(APIPath.celebrityDetails) + "/${id}", isLoad: true);
  var data = CelebrityDetailsModel.fromJson(response);
  return CelebrityDetailsModel.fromJson(response);
}

Future<CelebrityServicesModel> getCelebrityServices(int id) async {
  final response = await HttpClient.instance
      .fetchData(APIPathHelper.getValue(APIPath.celebrityServices) + "/${id}", isLoad: true);
  var data = CelebrityServicesModel.fromJson(response);
  return CelebrityServicesModel.fromJson(response);
}


Future<ServicesModel> getService(int id) async {
  final response = await HttpClient.instance
      .fetchData(APIPathHelper.getValue(APIPath.getServices) + "/${id}", isLoad: true);
  var data = ServicesModel.fromJson(response);
  return ServicesModel.fromJson(response);
}
Future<ServiceDetailModel> getServiceDetails(int id) async {
  final response = await HttpClient.instance
      .fetchData(APIPathHelper.getValue(APIPath.serviceDetails) + "/${id}", isLoad: true);
  var data = ServiceDetailModel.fromJson(response);
  return ServiceDetailModel.fromJson(response);
}
Future<CheckoutServiceModel> checkoutBookService(int id,String code) async {

  Map<String, String> parm = {
    "code": code,
    "id": "${id}",
  };
  final response = await HttpClient.instance.postData(APIPathHelper.getValue(APIPath.checkoutBookService) , parm);
  var data = CheckoutServiceModel.fromJson(response);
  return CheckoutServiceModel.fromJson(response);
}

Future<MyBookingModel> getMyBooking() async {
  final response = await HttpClient.instance
      .fetchData(APIPathHelper.getValue(APIPath.myBookings), isLoad: true);
  var data = MyBookingModel.fromJson(response);
  return MyBookingModel.fromJson(response);
}


Future<BookingDetailsModel> getBookingDetails(int id) async {
  final response = await HttpClient.instance
      .fetchData(APIPathHelper.getValue(APIPath.bookingDetails) + "/${id}", isLoad: true);
  var data = BookingDetailsModel.fromJson(response);
  return BookingDetailsModel.fromJson(response);
}


Future<CategoryDetailsModel> getCategoryDetails(int id) async {
  final response = await HttpClient.instance
      .fetchData(APIPathHelper.getValue(APIPath.getCategoryDetails) + "/${id}", isLoad: true);
  var data = CategoryDetailsModel.fromJson(response);
  return CategoryDetailsModel.fromJson(response);
}

Future<ProductDetailsModel> getProductDetails(int id) async {
  final response = await HttpClient.instance
      .fetchData(APIPathHelper.getValue(APIPath.productDetails) + "/${id}", isLoad: true);
  var data = ProductDetailsModel.fromJson(response);
  return ProductDetailsModel.fromJson(response);
}

Future<MyCartModel> getMyCart() async {
  final response = await HttpClient.instance
      .fetchData(APIPathHelper.getValue(APIPath.myCart), isLoad: true);
  var data = MyCartModel.fromJson(response);
  return MyCartModel.fromJson(response);
}
Future<CheckoutModel> checkout(int addressId,int areaId,String code) async {

  Map<String, String> parm = {
    "address_country_id": "$addressId",
    "area_id": "$areaId",
    "code": code,
  };
  final response = await HttpClient.instance.fetchData(APIPathHelper.getValue(APIPath.checkoutPage) , params: parm);
  var data = CheckoutModel.fromJson(response);
  return CheckoutModel.fromJson(response);
}
Future<MyOrderModel> myOrder() async {

  final response = await HttpClient.instance.fetchData(APIPathHelper.getValue(APIPath.myOrders) , params: null);
  var data = MyOrderModel.fromJson(response);
  return MyOrderModel.fromJson(response);
}
Future<MyOrderDetailsModel> MyOrderDetails(int id) async {

  final response = await HttpClient.instance.fetchData(APIPathHelper.getValue(APIPath.orderDetails) + "/$id" , params: null);
  var data = MyOrderDetailsModel.fromJson(response);
  return MyOrderDetailsModel.fromJson(response);
}
Future<MainServicesModel> services() async {

  final response = await HttpClient.instance.fetchData(APIPathHelper.getValue(APIPath.services)  , params: null);
  var data = MainServicesModel.fromJson(response);
  return MainServicesModel.fromJson(response);
}
Future<BestSellerModel> BestSeller() async {

  final response = await HttpClient.instance.fetchData(APIPathHelper.getValue(APIPath.bestSeller)  , params: null);
  var data = BestSellerModel.fromJson(response);
  return BestSellerModel.fromJson(response);
}
Future<BestSellerModel> newCollection() async {

  final response = await HttpClient.instance.fetchData(APIPathHelper.getValue(APIPath.newCollection)  , params: null);
  var data = BestSellerModel.fromJson(response);
  return BestSellerModel.fromJson(response);
}
Future<DesignerDetailsModel> designerDetails(int id) async {

  final response = await HttpClient.instance.fetchData(APIPathHelper.getValue(APIPath.designerDetails)  + "/${id}" , params: null);
  var data = DesignerDetailsModel.fromJson(response);
  return DesignerDetailsModel.fromJson(response);
}
Future<DesignerRatesModel> DesignerRates(int id) async {

  final response = await HttpClient.instance.fetchData(APIPathHelper.getValue(APIPath.designerRates)  + "/${id}" , params: null);
  var data = DesignerRatesModel.fromJson(response);
  return DesignerRatesModel.fromJson(response);
}


Future<SearchModel> search(String name) async {

  Map<String, String> parm = {
    "name": name,

  };
  final response = await HttpClient.instance.fetchData(APIPathHelper.getValue(APIPath.search) , params: parm);
  var data = SearchModel.fromJson(response);
  return SearchModel.fromJson(response);
}


}