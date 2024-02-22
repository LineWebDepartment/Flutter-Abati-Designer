
// import 'package:alsour/src/model/user.dart';
import 'package:abati_new/Model/UserModel.dart';
import 'package:abati_new/view/auth/ChooseCuntry.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:smh_user/Helpers/Constant.dart';
// import 'package:smh_user/Model/login.dart';
// import 'package:smh_user/Model/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mypref{



  static void setDLang(String lang){
    GetStorage().write("dlang",lang);
  }
  static String getDlang(){
    return   GetStorage().read("dlang") ;

  }
  static void setLang(String lang){
    GetStorage().write("lang",lang);
  }
  static String getlang(){
    return   GetStorage().read("lang") ;

  }

  static void setLong(String long){
    GetStorage().write("long",long);
  }
  static String getLong(){
    return   GetStorage().read("long") ;
  }

  static void setToken(String token){
    GetStorage().write("token", token);
  }
  static String getToken() {
    return GetStorage().read("token");
  }

  static void setSeen(String token){
    GetStorage().write("seen", token);
  }
  static String getSeen() {
    return GetStorage().read("seen");
  }

  static void setUserToken(String token){
    GetStorage().write("user_token", token);
  }
  static String getUserToken() {
    return  GetStorage().read("user_token");
  }
  static void setUserCridet(String token){
    GetStorage().write("credit", token);
  }
  static String getUserCridet() {
    return  GetStorage().read("credit");
  }
  static void setUsergender(String token){
    GetStorage().write("gender", token);
  }
  static String getUsergendr() {
    return  GetStorage().read("gender");
  }
  static void setUserFgender(String token){
    GetStorage().write("fgender", token);
  }
  static String getUserFgendr() {
    return  GetStorage().read("fgender");
  }
  static void setUserFCMToken(String token){
    GetStorage().write("fcm_token", token);
  }
  static String getUserFCMToken() {
    return  GetStorage().read("fcm_token");
  }

  static void setIsLogin(bool isLogin){
    GetStorage().write("isLogin",isLogin);
  }
  static bool IsLogin(){
    return GetStorage().hasData("isLogin")? GetStorage().read("isLogin") : false ;
  }

  // static Setting getSettings() {
  //   return Setting.fromJson(GetStorage().read("settings")) ;
  // }
  static void removeUser(){
    GetStorage().erase();
    GetStorage().remove("user");
  }

  // static void remove(){
  //   GetStorage().erase();
  // }

  static void removeToken() {
    GetStorage().remove("token");
  }

  static void setUser(UserModel user){
    GetStorage().write("user", user.toJson());
    // GetStorage().writeInMemory("user", user);
  }
static void setCurrency(CurrencyModel currency){
    GetStorage().write("currency", currency);
    // GetStorage().writeInMemory("user", user);
  }

  static UserModel getUser() {
    // GetStorage().erase();

    return  UserModel.fromJson(GetStorage().read("user"));



  }
static CurrencyModel getCurrency() {
    // GetStorage().erase();

    return  GetStorage().read("currency");



  }


  // static void setSetting(Setting user){
  //   GetStorage().write("setting", user.toJson());
  //   // GetStorage().writeInMemory("user", user);
  // }

  // static Setting getSetting() {
  //   // GetStorage().erase();
  //
  //   return  Setting.fromJson(GetStorage().read("setting"));
  //
  //
  //
  // }




  // static void setUse // static void setUserCridet(String user){
//   //   GetStorage().write("num", user.toJson());
//   //   // GetStorage().writeInMemory("user", user);
//   // }
//   //
//   // static User getUserCridet() {
//   //   // GetStorage().erase();
//   //
//   //   return  User.fromJson(GetStorage().read("num"));
//   //   return  GetStorage().read<User>("user");
//   //
//   //
//   //
//   // }rCridet(String user){
  //   GetStorage().write("num", user.toJson());
  //   // GetStorage().writeInMemory("user", user);
  // }
  //
  // static User getUserCridet() {
  //   // GetStorage().erase();
  //
  //   return  User.fromJson(GetStorage().read("num"));
  //   return  GetStorage().read<User>("user");
  //
  //
  //
  // }




  // static void setGendrUser(String Gender){
  //   GetStorage().write("gendr", user.toJson());
  //   // GetStorage().writeInMemory("user", user);
  // }
  //
  // static User getGendrUser() {
  //   // GetStorage().erase();
  //
  //   return  User.fromJson(GetStorage().read("gendr"));
  //   return  GetStorage().read<User>("user");
  //
  //
  //
  // }
}
