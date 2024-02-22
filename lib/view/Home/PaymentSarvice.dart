import 'package:abati_new/custom_widget/custom_text.dart';
import 'package:abati_new/custom_widget/default_button.dart';
import 'package:abati_new/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class PaymentSarvice extends StatefulWidget {
  final int id;
  final bool isorder;
  const PaymentSarvice({Key key, this.id, this.isorder}) : super(key: key);

  @override
  State<PaymentSarvice> createState() => _PaymentSarviceState();
}

class _PaymentSarviceState extends State<PaymentSarvice> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(

          children: [
            const SizedBox(height: 100,),
            SvgPicture.asset("assets/image/payment.svg"),
            const SizedBox(height: 50,),
            CustomText(text: widget.isorder ?  "Booking Successful !".tr() :"Order Placed!".tr(),fontWeight: FontWeight.bold,),
            const SizedBox(height: 20,),
            CustomText(text: widget.isorder ?"Your booking was successful.".tr() :"Your order was placed successfully. For more details, check All My Orders page under Profile  !".tr(),color: Colors.grey,),


          ],
        ),
        Positioned(
          bottom: 20,
          left: 15,right: 15,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(height: 130,color: Colors.grey[200],

                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: "Order ID".tr(),),
                          CustomText(text: "---",)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(text: "Payment Method".tr(),),
                            CustomText(text: "---",)
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: "Invoice reference".tr(),),
                          CustomText(text: "---",)
                        ],
                      ),
                    ],
                  ),
                ),
                ),
              ),
              const SizedBox(height: 20,),
              DefaultButton(text: "Continue shopping".tr(),background: Colors.white,textColor: Colors.black,onPressed: (){

                RestartWidget.restartApp(context);


              },)
            ],
          ),
        )
      ],
    );
  }
}
