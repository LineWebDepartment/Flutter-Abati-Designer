import 'dart:async';

import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/Helper/color.dart';
import 'package:abati_new/repo/APIProvider.dart';
import 'package:abati_new/view/Home/ProductDetails.dart';
import 'package:abati_new/view/Home/TabBar/AccountScreen.dart';
import 'package:abati_new/view/Home/TabBar/CategorieScreen.dart';
import 'package:abati_new/view/Home/TabBar/HomeScreen.dart';
import 'package:abati_new/view/Home/TabBar/VideosScreen.dart';
import 'package:abati_new/view/auth/ChooesLanguge.dart';
import 'package:abati_new/view/auth/LoginScreen.dart';
import 'package:abati_new/view/auth/SignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:easy_localization/easy_localization.dart';

import 'view/Home/TabBar/MainServices.dart';

Future<void> main() async {
  ErrorWidget.builder = (FlutterErrorDetails details) => Container(
    color: Colors.white,child:  const Center(
  //     child: CircularProgressIndicator(
  //     color: primaryColor,
  // ),
    ),);
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  EasyLoading.init();
  Loader().configLoading();
  await GetStorage.init();
  runApp(

    MultiProvider(providers: providers,
      child:EasyLocalization(
          supportedLocales: [Locale('ar', 'SA'), Locale('en', 'US')],
          path: 'assets/locales', // <-- change the path of the translation files
          fallbackLocale: Locale('en', 'US'),
          // useFallbackTranslations: true,

          // fallbackLocale: Locale('en', 'US'),
          child: RestartWidget(child: MyApp())
      ),),

  );




}
List<SingleChildWidget> providers = [
  ChangeNotifierProvider<APIProvider>(create: (_) => APIProvider()),
];
class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(

        fontFamily:  Mypref.getlang() == "en"? 'RobotoSlab':'Cairo'
      ),
      home: SplashScreen(),
      // home:  const Dashboard(),
      builder: EasyLoading.init(),
    );
  }
}


class Dashboard extends StatefulWidget {
  final int seletedIndex ;
  const Dashboard({Key key, this.seletedIndex}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;



  final tabs = [
    const HomeScreen(),
    const CategoriesScreen(),
    const AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        selectedItemColor: primaryColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items:  [

          BottomNavigationBarItem(
            icon: _currentIndex == 0 ? SvgPicture.asset('assets/image/tab1.svg',):SvgPicture.asset('assets/image/tab11.svg'),
            label: ''.tr(),
          ),
          BottomNavigationBarItem(

            icon: _currentIndex == 1 ? SvgPicture.asset('assets/image/tab22.svg',color:Colors.black,):SvgPicture.asset('assets/image/tab2.svg',color:Colors.black,),
            label: ''.tr(),
          ),
          BottomNavigationBarItem(

            icon: _currentIndex == 2 ? SvgPicture.asset('assets/image/tab33.svg',color:Colors.black,):SvgPicture.asset('assets/image/tab3.svg',color:Colors.black,),

            label: ''.tr(),
          ),

        ],
      ),
    );
  }
}


class Loader {
  void  configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 1000)
      ..indicatorType = EasyLoadingIndicatorType.threeBounce
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 50.0
      ..radius = 10.0
      ..progressColor = primaryColor
      ..backgroundColor = Colors.white
      ..indicatorColor = primaryColor
      ..textColor = primaryColor
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;
  }
}

class RestartWidget extends StatefulWidget {
  RestartWidget({this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>().restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // MyViewObjApiController controller =MyViewObjApiController() ;
  AsyncSnapshot asyncSnapshot ;
  Alignment logo =  const Alignment(0.0, -1.0) ;
  Alignment txt =  const Alignment(0.0, 1.0) ;
  fetchApi() async {

    Timer(const Duration(
      milliseconds: 1500,
    ), () {

      ToRemove(context ,Mypref.IsLogin() == true ? const Dashboard(): const ChooesLanguge(),) ;
      // startFCMlisten() ;

    });

  }

  @override
  void initState() {
    super.initState();
    fetchApi() ;
    Timer(const Duration(
      milliseconds: 500,
    ), () {
      setState(() {
        logo =const Alignment(0.0, -0.1);
        txt =const Alignment(0.0, 0.2);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    asyncSnapshot =  const AsyncSnapshot.withData( ConnectionState.done, '');

    return Scaffold(
        backgroundColor: Colors.white,
        body:   Image.asset('assets/image/Splash.png',height:MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width ,)

      // SvgPicture.asset('assets/image/Splash.svg',fit: BoxFit.fill,width: MediaQuery.of(context).size.width,height:  MediaQuery.of(context).size.height,)
    );
  }

}

Future ToRemove(BuildContext context, Widget widget) async {
  return await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => widget));
}
