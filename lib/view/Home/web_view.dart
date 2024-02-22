import 'dart:async';
import 'dart:io';
import 'package:abati_new/Helper/Pref.dart';
import 'package:abati_new/custom_widget/helper.dart';
import 'package:abati_new/view/Home/PaymentSarvice.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final bool isOrder;
  final String url ;
  final int orderID ;

  const WebViewScreen({Key key, this.url, this.isOrder, this.orderID}) : super(key: key);
  @override
  WebViewScreenState createState() => WebViewScreenState();
}

class WebViewScreenState extends State<WebViewScreen> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  void initState() {
    super.initState();

    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.url) ;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:  Text(
          "pay".tr(),
          style: TextStyle(color: Colors.black,fontFamily: Mypref.getlang() == "en"? 'RobotoSlab':'Cairo',fontSize: 18,fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, "");
          },
          icon: SvgPicture.asset( 'assets/image/back.svg'),
        ),


      ),
      body: WebView(

        initialUrl:widget.url,
          javascriptChannels: <JavascriptChannel>{
            _toasterJavascriptChannel(context),
          },
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        onWebResourceError: (error) {
          print(error.toString()) ;
        },
        javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (String url) {
            print('Page finished loading: $url');
            if(url.contains('success')){
              if (widget.isOrder){

                To(context, PaymentSarvice(id: widget.orderID,isorder: true,));
              }else{

                To(context, PaymentSarvice(id: widget.orderID,isorder: false,));
              }


              // Navigator.pop(context,true);
              print('success') ;
            }
          },

        gestureNavigationEnabled: true,
      ),
    );
  }
  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          // Scaffold.of(context).showSnackBar(
          //   SnackBar(content: Text(message.message)),
          // );
        });
  }
}