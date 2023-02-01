import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneAuthController extends GetxController{
  TextEditingController phoneController=TextEditingController();
  TextEditingController codeController=TextEditingController();


  final formKey=GlobalKey<FormState>();

  bool isCodeSent=false;


  showInvisibleWgts(){
    isCodeSent=true;
    update();
  }


}