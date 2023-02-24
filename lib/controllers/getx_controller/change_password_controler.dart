import 'dart:convert';
import 'package:cwikapp/controllers/getx_controller/login_controller.dart';
import 'package:cwikapp/custom_widgets/custom_alert_dialog.dart';
import 'package:cwikapp/url/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  RxDouble height = Get.height.obs;
  RxDouble width = Get.width.obs;

  var oldPassword = TextEditingController().obs;
  RxBool oldPass = false.obs;
  RxBool obscureTexts = true.obs;

  var newPassword = TextEditingController().obs;
  RxBool newPass = false.obs;
  RxBool newObscureTexts = true.obs;

  var confirmPassword = TextEditingController().obs;
  RxBool confirmPass = false.obs;
  RxBool confirmObscureTexts = true.obs;
  Dio dio = Dio();
  var changeMsg;
  loginController logincontroller = Get.put(loginController());


  void changePassword(
      var token, var agentId, var id, var userId, var adminId,context) async {
    var peram = {
      'id': agentId.toString(),
      'password': oldPassword.value.text.toString(),
      'new_password': newPassword.value.text.toString(),
      'apiParameters': jsonEncode({
        'id': id.toString(),
        'admin_id': adminId.toString(),
        'user_id': userId.toString(),
        'agent_id': agentId.toString(),
        'token': token.toString()
      })
    };
    var uri = '${baseUrl.apiBaseUrl}agent/change/password';
    var response = await dio.post(uri,
        data: peram,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }));

    var responseData = response.data;
    changeMsg = responseData['message'];
    var changeStatus = responseData['status'];

    if(changeStatus == 'Success'){

    }else{
      validation (context);
    }

  }
  void validation (context){

    if(oldPassword.value.text.obs.isEmpty){
      showDialog(context: context, builder: (context) => CustomAlertDialog(error: 'Please enter old password',));
   }else if(oldPassword.value.text.obs.toString() != logincontroller.password.obs.toString()){
      showDialog(context: context, builder: (context) => CustomAlertDialog(error: 'Please enter valid old password',));
    }else if(newPassword.value.text.obs.isEmpty){
      showDialog(context: context, builder: (context) => CustomAlertDialog(error: 'Please enter new password',));
    }else if(confirmPassword.value.text.obs.isEmpty){
      showDialog(context: context, builder: (context) => CustomAlertDialog(error: 'Please enter conformation password',));
    }else if(newPassword.value.text.obs.isEmpty != confirmPassword.value.text.obs.isEmpty){
      showDialog(context: context, builder: (context) => CustomAlertDialog(error: 'your password and conformation password do not match',));
    }
}
}
