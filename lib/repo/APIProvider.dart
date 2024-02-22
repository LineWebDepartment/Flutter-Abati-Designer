// ignore_for_file: file_names

import 'dart:math';


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
import 'package:abati_new/Model/SettingModel.dart';
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
import 'package:abati_new/webServec/api_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../view/Home/DesignerDetails.dart';
import 'APIService.dart';

class APIProvider with ChangeNotifier {
  APIService _apiRepository;


  ApiResponse<SettingModel> _setting;
  ApiResponse<DesignerStatisticsModel> _Statistics;
  ApiResponse<OrderModel> _order;
  ApiResponse<MyAddressesModel> _myAddresses;
  ApiResponse<MyFavoritesModel> _myFavorite;
  ApiResponse<CategoriesModel> _categories;
  ApiResponse<ServiceCategoriesModel> _services;
  ApiResponse<HomeModel> _home;
  ApiResponse<DesignersModel> _designers;
  ApiResponse<CelebritiesModel> _celebrities;
  ApiResponse<CelebrityDetailsModel> _celebritiesDetails;
  ApiResponse<CelebrityServicesModel> _celebritiesServices;
  ApiResponse<ServicesModel> _service;
  ApiResponse<ServiceDetailModel> _serviceDetail;
  ApiResponse<CheckoutServiceModel> _checkoutservice;
  ApiResponse<MyBookingModel> _myBooking;
  ApiResponse<BookingDetailsModel> _bookingdetails;
  ApiResponse<CategoryDetailsModel> _categoryDetails;
  ApiResponse<ProductDetailsModel> _productDetails;
  ApiResponse<MyCartModel> _myCart;
  ApiResponse<CheckoutModel> _checkout;
  ApiResponse<MyOrderModel> _myorder;
  ApiResponse<MyOrderDetailsModel> _myorderdetails;
  ApiResponse<MainServicesModel> _mainservices;
  ApiResponse<BestSellerModel> _bestSeller;
  ApiResponse<BestSellerModel> _newCollection;
  ApiResponse<DesignerDetailsModel> _designerDetails;
  ApiResponse<DesignerRatesModel> _designerRates;
  ApiResponse<SearchModel> _search;



  ApiResponse<SearchModel> get Search => _search;
  ApiResponse<DesignerRatesModel> get DesignerRates => _designerRates;
  ApiResponse<DesignerDetailsModel> get DesignerDetail => _designerDetails;
  ApiResponse<BestSellerModel> get BestSeller => _bestSeller;
  ApiResponse<BestSellerModel> get NewCollection => _newCollection;

  ApiResponse<SettingModel> get Setting => _setting;
  ApiResponse<DesignerStatisticsModel> get Statistics => _Statistics;
  ApiResponse<OrderModel> get Order => _order;

  ApiResponse<MyAddressesModel> get MyAddres => _myAddresses;
  ApiResponse<MyFavoritesModel> get MyFavorite => _myFavorite;
  ApiResponse<CategoriesModel> get Categories => _categories;
  ApiResponse<ServiceCategoriesModel> get Services => _services;
  ApiResponse<HomeModel> get Home => _home;
  ApiResponse<DesignersModel> get Designers => _designers;
  ApiResponse<CelebritiesModel> get Celebrities => _celebrities;
  ApiResponse<CelebrityDetailsModel> get CelebritiesDetails => _celebritiesDetails;
  ApiResponse<CelebrityServicesModel> get CelebritiesServices => _celebritiesServices;
  ApiResponse<ServicesModel> get Service => _service;
  ApiResponse<ServiceDetailModel> get ServiceDetail => _serviceDetail;
  ApiResponse<CheckoutServiceModel> get CheckoutService => _checkoutservice;
  ApiResponse<MyBookingModel> get MyBooking => _myBooking;
  ApiResponse<BookingDetailsModel> get Bookingdetails => _bookingdetails;
  ApiResponse<CategoryDetailsModel> get CategoryDetails => _categoryDetails;
  ApiResponse<ProductDetailsModel> get ProductDetails => _productDetails;
  ApiResponse<MyCartModel> get MyCart => _myCart;
  ApiResponse<CheckoutModel> get Checkout => _checkout;
  ApiResponse<MyOrderModel> get MyOrders => _myorder;
  ApiResponse<MyOrderDetailsModel> get MyOrderDetails => _myorderdetails;
  ApiResponse<MainServicesModel> get MainServices => _mainservices;

  APIProvider(){
    _apiRepository = APIService();

  }


  /////--------------------------Driver------------------------------------------



  fetchSetting(bool isLoad) async {
    try {
      SettingModel data = await _apiRepository.getSetting(isLoad);
      print(data);
      _setting = ApiResponse.completed(data);
      print(data);
    } catch (e) {
      _setting = ApiResponse.error(e.toString());
      print(e.toString());
    }
    notifyListeners();
  }
  fetchDesignerStatistics() async {
    try {
      DesignerStatisticsModel data = await _apiRepository.designerStatistics();
      print(data);
      _Statistics = ApiResponse.completed(data);
      print(data);
    } catch (e) {
      _Statistics = ApiResponse.error(e.toString());
      print(e.toString());
    }
    notifyListeners();
  }
  fetchDesinerOrders(int id,String sharch,bool isSerch) async {
    try {
      // _order = null;
      OrderModel data = await _apiRepository.getOrders(id,sharch,isSerch);
      print(data);
      _order = ApiResponse.completed(data);
      print(data);
    } catch (e) {
      _order = ApiResponse.error(e.toString());
      print(e.toString());
    }
    notifyListeners();
  }
  fetchMyAddresses() async {
    try {
      MyAddressesModel data = await _apiRepository.getMyAddress();
      print(data);
      _myAddresses = ApiResponse.completed(data);
      print(data);
    } catch (e) {
      _myAddresses = ApiResponse.error(e.toString());
      print(e.toString());
    }
    notifyListeners();
  }
  fetchMyFavorite() async {
    try {
      MyFavoritesModel data = await _apiRepository.getMyFavorites();
      print(data);
      _myFavorite = ApiResponse.completed(data);
      print(data);
    } catch (e) {
      _myFavorite = ApiResponse.error(e.toString());
      print(e.toString());
    }
    notifyListeners();
  }
  fetchCategories() async {
    try {
      CategoriesModel data = await _apiRepository.getCategories();
      print(data);
      _categories = ApiResponse.completed(data);
      print(data);
    } catch (e) {
      _categories = ApiResponse.error(e.toString());
      print(e.toString());
    }
    notifyListeners();
  }
  fetchServices() async {
    try {
      ServiceCategoriesModel data = await _apiRepository.getServices();

      _services = ApiResponse.completed(data);
      print(data);
    } catch (e) {
      _services = ApiResponse.error(e.toString());
      print(e.toString());
    }
    notifyListeners();
  }
  fetchHome() async {
    try {
      HomeModel data = await _apiRepository.getHome();

      _home = ApiResponse.completed(data);
      print(data);
    } catch (e) {
      _home = ApiResponse.error(e.toString());
      print(e.toString());
    }
    notifyListeners();
  }
  fetchDesigners() async {
    try {
      DesignersModel  data = await _apiRepository.getDesigners();

      _designers = ApiResponse.completed(data);
      print(data);
    } catch (e) {
      _designers = ApiResponse.error(e.toString());
      print(e.toString());
    }
    notifyListeners();
  }
  fetchCelebrities() async {
    try {
      CelebritiesModel  data = await _apiRepository.getCelebrities();

      _celebrities = ApiResponse.completed(data);
      print(data);
    } catch (e) {
      _celebrities = ApiResponse.error(e.toString());
      print(e.toString());
    }
    notifyListeners();
  }
  fetchCelebrityDetails(int id) async {
    try {
      CelebrityDetailsModel data = await _apiRepository.getCelebrityDetails(id);
      print(data);
      _celebritiesDetails = ApiResponse.completed(data);
      print(data);
    } catch (e) {
      _celebritiesDetails = ApiResponse.error(e.toString());
      print(e.toString());
    }
    notifyListeners();
  }

  fetchCelebrityServices(int id) async {
    try {
      CelebrityServicesModel data = await _apiRepository.getCelebrityServices(id);
      print(data);
      _celebritiesServices = ApiResponse.completed(data);
      print(data);
    } catch (e) {
      _celebritiesServices = ApiResponse.error(e.toString());
      print(e.toString());
    }
    notifyListeners();
  }

  fetchService(int id) async {
    try {
      ServicesModel data = await _apiRepository.getService(id);
      print(data);
      _service = ApiResponse.completed(data);
      print(data);
    } catch (e) {
      _service = ApiResponse.error(e.toString());
      print(e.toString());
    }
    notifyListeners();
  }
    fetchServiceDetails(int id) async {
    try {
      ServiceDetailModel data = await _apiRepository.getServiceDetails(id);
      print(data);
      _serviceDetail = ApiResponse.completed(data);
      print(data);
    } catch (e) {
      _serviceDetail = ApiResponse.error(e.toString());
      print(e.toString());
    }
    notifyListeners();
  }
    fetchServiceCheckout(int id,String code) async {
    try {
      CheckoutServiceModel data = await _apiRepository.checkoutBookService(id,code);
      print(data);
      _checkoutservice = ApiResponse.completed(data);
      print(data);
    } catch (e) {
      _checkoutservice = ApiResponse.error(e.toString());
      print(e.toString());
    }
    notifyListeners();
  }
  fetchMyBooking() async {
    try {
      MyBookingModel data = await _apiRepository.getMyBooking();

      _myBooking = ApiResponse.completed(data);
      print(data);
    } catch (e) {
      _myBooking = ApiResponse.error(e.toString());
      print(e.toString());
    }
    notifyListeners();
  }
  fetchMyBookingDetails(int id) async {
    try {
      BookingDetailsModel data = await _apiRepository.getBookingDetails(id);

      _bookingdetails = ApiResponse.completed(data);
      print(data);
    } catch (e) {
      _bookingdetails = ApiResponse.error(e.toString());
      print(e.toString());
    }
    notifyListeners();
  }
  fetchMyCategoryDetails(int id) async {
    try {
      CategoryDetailsModel data = await _apiRepository.getCategoryDetails(id);

      _categoryDetails = ApiResponse.completed(data);
      print(data);
    } catch (e) {
      _categoryDetails = ApiResponse.error(e.toString());
      print(e.toString());
    }
    notifyListeners();
  }
  fetchProductDetails(int id) async {
    try {
      ProductDetailsModel data = await _apiRepository.getProductDetails(id);

      _productDetails = ApiResponse.completed(data);

    } catch (e) {
      _productDetails = ApiResponse.error(e.toString());

    }
    notifyListeners();
  }
  fetchMyCart ()async {
    try {
      MyCartModel data = await _apiRepository.getMyCart();

      _myCart = ApiResponse.completed(data);

    } catch (e) {
      _myCart = ApiResponse.error(e.toString());

    }
    notifyListeners();
  }
  fetchCheckout (int addressId,int areaId,String code)async {
    try {
      CheckoutModel data = await _apiRepository.checkout(addressId, areaId,code);

      _checkout = ApiResponse.completed(data);

    } catch (e) {
      _checkout = ApiResponse.error(e.toString());

    }
    notifyListeners();
  }
  fetchMyOrder ()async {
    try {
      MyOrderModel data = await _apiRepository.myOrder();

      _myorder = ApiResponse.completed(data);

    } catch (e) {
      _myorder = ApiResponse.error(e.toString());

    }
    notifyListeners();
  }
  fetchMyOrderDetails (int id)async {
    try {
      MyOrderDetailsModel data = await _apiRepository.MyOrderDetails(id);

      _myorderdetails = ApiResponse.completed(data);

    } catch (e) {
      _myorderdetails = ApiResponse.error(e.toString());

    }
    notifyListeners();
  }

  fetchMainServices ()async {
    try {
      MainServicesModel data = await _apiRepository.services();

      _mainservices = ApiResponse.completed(data);

    } catch (e) {
      _mainservices = ApiResponse.error(e.toString());

    }
    notifyListeners();
  }
  fetchBestSeller ()async {
    try {
      BestSellerModel data = await _apiRepository.BestSeller();

      _bestSeller = ApiResponse.completed(data);

    } catch (e) {
      _bestSeller = ApiResponse.error(e.toString());

    }
    notifyListeners();
  }
  fetchNewCollection ()async {
    try {
      BestSellerModel data = await _apiRepository.newCollection();

      _newCollection = ApiResponse.completed(data);

    } catch (e) {
      _newCollection = ApiResponse.error(e.toString());

    }
    notifyListeners();
  }
  fetchDesignerDetails(int id)async {
    try {
      DesignerDetailsModel data = await _apiRepository.designerDetails(id);

      _designerDetails = ApiResponse.completed(data);

    } catch (e) {
      _designerDetails = ApiResponse.error(e.toString());

    }
    notifyListeners();
  }
  fetchSearch(String name)async {
    try {
      SearchModel data = await _apiRepository.search(name);

      _search = ApiResponse.completed(data);

    } catch (e) {
      _search = ApiResponse.error(e.toString());

    }
    notifyListeners();
  }
  fetchDesignerRates(int id)async {
    try {
      DesignerRatesModel data = await _apiRepository.DesignerRates(id);

      _designerRates = ApiResponse.completed(data);

    } catch (e) {
      _designerRates = ApiResponse.error(e.toString());

    }
    notifyListeners();
  }

}
