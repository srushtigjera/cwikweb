import 'dart:developer';

import 'package:cwikapp/custom_widgets/custom_alert_dialog.dart';
import 'package:cwikapp/url/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  RxDouble height = Get.height.obs;
  RxDouble width = Get.width.obs;
  Dio dio = Dio();

  final formKey = GlobalKey<FormState>();
  var emailCtrl = TextEditingController().obs;

  void forgotPasswordCall(context) async {

    log('${emailCtrl.value.text}');
    var uri = '${baseUrl.apiBaseUrl}agent/forgot/password';
    var responce = await dio.post(uri,
        data: {'email': emailCtrl.value.text});

    var forgotPassStatus = responce.data['status'];
    var forgotPassMsg = responce.data['message'];

    if(forgotPassStatus == 'Success'){
      showDialog(context: context, builder: (context) => CustomAlertDialog(error: forgotPassMsg,));
    }else{
      showDialog(context: context, builder: (context) => CustomAlertDialog(error: forgotPassMsg,));   }
  }
}
