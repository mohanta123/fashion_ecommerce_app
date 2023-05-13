import 'package:flutter/material.dart';
import 'package:cc_avenue/cc_avenue.dart';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  @override
  void initState() {
    super.initState();

  }

  /// [initPlatformState] this calls the [cCAvenueInit]
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      await CcAvenue.cCAvenueInit(
          transUrl: 'https://secure.ccavenue.com/transaction/initTrans',
          accessCode: '4YRUXLSRO20O8NIH',
          amount: '10',
          cancelUrl: 'http://122.182.6.216/merchant/ccavResponseHandler.jsp',
          currencyType: 'INR',
          merchantId: '2',
          orderId: '519',
          redirectUrl: 'http://122.182.6.216/merchant/ccavResponseHandler.jsp',
          rsaKeyUrl: 'https://secure.ccavenue.com/transaction/jsp/GetRSA.jsp'
      );

    } on PlatformException {
      print('PlatformException');
    }
  }

 /* Future<void> makePayment() async {
    var paymentResponse = await CCAvenueFlutter.makePayment({
      "access_code": "YOUR_ACCESS_CODE",
      "merchant_id": "YOUR_MERCHANT_ID",
      "order_id": "ORDER_ID",
      "amount": "AMOUNT",
      "currency": "CURRENCY",
      "redirect_url": "REDIRECT_URL",
      "cancel_url": "CANCEL_URL",
      "rsa_key": "YOUR_RSA_KEY",
      "billing_name": "BILLING_NAME",
      "billing_address": "BILLING_ADDRESS",
      "billing_city": "BILLING_CITY",
      "billing_state": "BILLING_STATE",
      "billing_zip": "BILLING_ZIP",
      "billing_country": "BILLING_COUNTRY",
      "billing_tel": "BILLING_TEL",
      "billing_email": "BILLING_EMAIL"
    });
    print(paymentResponse);
  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            initPlatformState();
          }, child: Text('Payment'),
        ),
      ),
    );
  }
}

