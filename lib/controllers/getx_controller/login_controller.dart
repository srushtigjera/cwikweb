import 'dart:developer';
import 'package:cwikapp/url/api.dart';
import 'package:cwikapp/utils/app_routes.dart';
import 'package:cwikapp/utils/validation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../custom_widgets/custom_alert_dialog.dart';
import '../../views/home_page.dart';

class loginController extends GetxController {
  RxDouble heightSize = Get.height.obs;
  RxDouble widthSize = Get.width.obs;
  RxBool btnPress = false.obs;
  RxBool obscureTexts = true.obs;
  var agentId;
  var token;
  var id;
  var admin_id;
  var user_id;
  var agent_id;


  final formKey = GlobalKey<FormState>();
  var emailCtrl = TextEditingController().obs;
  var passCtrl = TextEditingController().obs;
  var errorMsg;
  var dio = Dio();

  RxString? emailId;
  RxString? password;

  void login(context) async {
    var parameter = {
      'email': emailCtrl.value.text,
      'password': passCtrl.value.text
    };

    var url = '${baseUrl.apiBaseUrl}agent/login';
    var responce = await dio.post(url, data: parameter);
    var data = responce.data;
    var loginStatus = data['status'];
    errorMsg = data['message'];

    if (loginStatus == 'Success') {
      agentId = data['data']['agent_id'];
      token = data['data']['token'];
      id = data['data']['apiParameters']['id'];
      admin_id = data['data']['apiParameters']['admin_id'];
      user_id = data['data']['apiParameters']['user_id'];
      agent_id = data['data']['apiParameters']['agent_id'];

      emailId = emailCtrl.value.text.obs;
      password = passCtrl.value.text.obs;

      AppRoutes().nextScreenReplace(context,HomePage());

     // Get.to(HomePage());
      emailCtrl.value.clear();
      passCtrl.value.clear();

      log('${agentId} ....... ${token}......${id}');

    } else {
      validation(context);
    }
  }

  void validation(context){
    if(emailCtrl.value.text.obs.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter email id",));
    }else if(!isEmail(emailCtrl.value.text.obs.toString())){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter valid email id",));
    }else if(passCtrl.value.text.obs.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter password",));
    }else if(passCtrl.value.text.length < 6){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Password must be at least 6 characters long",));
    }else{
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: 'Please enter valid credential',));
    }
  }
}



