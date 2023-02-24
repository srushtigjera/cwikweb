import 'dart:convert';
import 'dart:io';
import 'package:cwikapp/url/api.dart';
import 'package:cwikapp/utils/validation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../custom_widgets/custom_alert_dialog.dart';

class UpdateProfileController extends GetxController{

  RxDouble height = Get.height.obs;
  RxDouble width = Get.width.obs;
  Dio dio = Dio();
  var responseData;
  String? fileName;
  File? imageFile;
  var imagePicked;

  var ctrName = TextEditingController().obs;
  var ctrEmail = TextEditingController().obs;
  var ctrAgency = TextEditingController().obs;
  var ctrAboutAgency = TextEditingController().obs;

  Future updateProfile(var token, var agentId, var id,var userId, var adminId,context) async{

    FormData formData  = FormData.fromMap ( {
      'agent_id': agentId.toString(),
      'agent_name': ctrName.value.text.toString(),
      'agent_email': ctrEmail.value.text.toString(),
      'about_of_agency': ctrAboutAgency.value.text.toString(),
      'name_of_agency': ctrAgency.value.text.toString(),
      'agent_profile': (imagePicked != null)     ?
       MultipartFile.fromBytes(
        await imagePicked!.readAsBytes(),
        filename: fileName!,
       ):'',
      'apiParameters': jsonEncode({
        'id': id.toString(),
        'admin_id': adminId.toString(),
        'user_id' : userId.toString(),
        'agent_id' : agentId.toString(),
        'token': token.toString()
      })
    });

    var uri = '${baseUrl.apiBaseUrl}agent/update/profile';
    var response = await dio.post(uri,data:formData, options: Options(headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    }));
    responseData = response.data['message'];
    var apiStatus = response.data["status"];

    if(apiStatus == 'Success'){

    }else{
      validation(context);
    }
  }
  void validation(context){
    if(ctrName.value.text.obs.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter name",));
    }else if(ctrEmail.value.text.obs.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter email id",));
    }else if(!isEmail(ctrEmail.value.text.obs.toString())){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter valid email id",));
    }else if(ctrAgency.value.text.obs.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter agency name",));
    }else if(ctrAboutAgency.value.text.obs.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter about the agency",));
    }else{
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: responseData,));
    }
  }
}