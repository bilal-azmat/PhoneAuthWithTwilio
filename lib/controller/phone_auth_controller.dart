import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class PhoneAuthController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isCodeSent = false;

  late TwilioFlutter twilioFlutter;

  var sentOTP;

  showInvisibleWidgets() {
    isCodeSent = true;
    update();
  }

  sendSMS() {
    twilioFlutter = TwilioFlutter(
        accountSid: '', // replace it with your account SID
        authToken: '', // replace it with your auth token
        twilioNumber: '' // replace it with your purchased twilioNumber

        );

    var rnd = new Random();

    var digits = rnd.nextInt(900000) + 100000;

    sentOTP = digits;

    // lets print otp as well

    print(sentOTP);

    twilioFlutter.sendSMS(
        toNumber: phoneController.text,
        messageBody: 'Hello This is 6 digit otp code to verify phone $digits');
  }

  verifyOTP() {
    if (sentOTP.toString() == codeController.text) {
      Fluttertoast.showToast(
          msg: "OTP Verified SuccessFully!", backgroundColor: Colors.green);
    } else {
      Fluttertoast.showToast(
          msg: "OTP didn't match!", backgroundColor: Colors.red);
    }
  }
}
