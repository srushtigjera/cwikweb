import 'dart:convert';
import 'dart:io';
import 'package:cwikapp/custom_widgets/custom_alert_dialog.dart';
import 'package:cwikapp/url/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../utils/app_list.dart';
import 'login_controller.dart';

class AddListingController extends GetxController{

  RxDouble height = Get.height.obs;
  RxDouble width = Get.width.obs;
  Dio dio = Dio();
  var ctlTitle = TextEditingController().obs;
  var ctlFCU = TextEditingController().obs;
  var ctlSCU = TextEditingController().obs;
  var ctlWDTT = TextEditingController().obs;
  var ctlUni = TextEditingController().obs;
  var ctlCity = TextEditingController().obs;
  var ctlPostCode = TextEditingController().obs;
  var ctlAddress = TextEditingController().obs;
  var ctlWDTP = TextEditingController().obs;
  var ctlWDTU = TextEditingController().obs;
  var ctlPPW = TextEditingController().obs;
  var ctlRoomS = TextEditingController().obs;
  var ctlFloor = TextEditingController().obs;
  var ctlBedSize = TextEditingController().obs;
  var ctlaboutTP = TextEditingController().obs;
  var ctlFacilities = TextEditingController().obs;
  var ctlBillsInc = TextEditingController().obs;
  RxList isTrueList = List.generate(amenities.length, (index) => false).obs;
  var selectedamenities = '2';
  var picked;
  String? fileName;
  File? imageFile;
  String? selectedItem;
  var selectedCity ;
  var imagePicked;
  var loginMsg;

  var cityList = [];
  var amenitiesList = [];

  final loginController controllerlogin = Get.put(loginController());


  Future getCity()async{

    var uri = '${baseUrl.apiBaseUrl}${baseUrl.getCityList}';
    var responce = await dio.post(uri);

    var responseData = responce.data;

    cityList = responseData['data']['cityList'] as List;
   /* List<CityList> city = cityList.map((data) => CityList.fromJson(data)).toList();
    List<String> cityName = [];
    for(int i=0; i< city.length; i++){
      var data = city[i].cityName.toString();
      cityName.add(data);
    }*/

  //  print('cityDataList=======${cities}');
  }

  void addListing(String Public,context)async{
    var id = controllerlogin.id.toString();
    var adminId = controllerlogin.admin_id.toString();
    var userId = controllerlogin.user_id.toString();
    var agentId = controllerlogin.agentId.toString();
    var token = controllerlogin.token.toString();

    FormData parameter  = FormData.fromMap({
      'listing_title': ctlTitle.value.text.toString(),
      'first_closest_university': ctlFCU.value.text.toString(),
      'second_closest_university': ctlSCU.value.text.toString(),
      'city_id': selectedCity.toString(),
      'address': ctlAddress.value.text.toString(),
      'post_code': ctlPostCode.value.text.toString(),
      'walk_dist_first_uni': ctlWDTU.value.text.toString(),
      'price_per_week': ctlPPW.value.text.toString(),
      'walk_dist_town_center': ctlWDTT.value.text.toString(),
      'room_size': ctlRoomS.value.text.toString(),
      'walk_dist_public_trans': ctlWDTP.value.text.toString(),
      'bed_size': ctlBedSize.value.text.toString(),
      'floor': ctlFloor.value.text.toString(),
      'listing_type': selectedItem.toString(),
      'about_property': ctlaboutTP.value.text.toString(),
      'facilities_include': ctlFacilities.value.text.toString(),
      'bills_include': ctlBillsInc.value.text.toString(),
      'agent_id': agentId.toString(),
      'trend_listing': 'yes',
      'listing_status': Public.toString(),
      'amenities_id': selectedamenities.toString(),
      'apiParameters': jsonEncode({
        'id': id.toString(),
        'admin_id': adminId.toString(),
        'user_id': userId.toString(),
        'agent_id': agentId.toString(),
        'token': token.toString()
      }),
      'images': (imagePicked != null) ?
      MultipartFile.fromBytes(
        await imagePicked!.readAsBytes(),
        filename: fileName!,
      ):'',
    });
    print(parameter);
    var uri = '${baseUrl.apiBaseUrl}${baseUrl.addList}';
    var response = await dio.post(uri, data: parameter ,options: Options(headers: {
    "Content-Type": "application/json",
    "Authorization": "Bearer ${controllerlogin.token}",
    }));

    var data = response.data;
    var loginStatus = data['status'];
    loginMsg = data['message'];
    print('addListing====== ${data}');
    if(loginStatus == 'Success'){

    }else{
      validation(context);
    }
  }

  Future getAmenities()async{

    var uri = '${baseUrl.apiBaseUrl}${baseUrl.getAmenitiesList}';
    var responce = await dio.post(uri);

    amenitiesList = responce.data['data']['amenitiesList'] as List;
  //  print('amenitiesList=======$amenitiesList');
  }

  void validation(context){
    if(fileName != null){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please upload picture",));
    }else if(ctlTitle.value.text.obs.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter listing title",));
    }else if(ctlFCU.value.text.obs.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter your first closest university / collage",));
    }else if(ctlSCU.value.text.obs.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter your second closest university / collage",));
    }else if(selectedCity.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please select your city",));
    }else if(ctlAddress.value.text.obs.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter your address",));
    }else if(ctlPostCode.value.text.obs.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter your postcode",));
    }else if(ctlWDTT.value.text.obs.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter walking distance to town center",));
    }else if(ctlPPW.value.text.obs.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter price per week",));
    }else if(ctlWDTU.value.text.obs.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter walking distance to university / collage",));
    }else if(ctlRoomS.value.text.obs.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter your room size",));
    }else if(ctlWDTP.value.text.obs.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter walking distance to public transport",));
    }else if(ctlBedSize.value.text.obs.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter your bed size",));
    }else if(ctlFloor.value.text.obs.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter your floor number",));
    }else if(selectedItem!.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please select your listing type",));
    }else if(ctlaboutTP.value.text.obs.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter your property details",));
    }else if(ctlFacilities.value.text.obs.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter your facilities",));
    }else if(ctlBillsInc.value.text.obs.isEmpty){
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: "Please enter bills",));
    }else {
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(error: loginMsg,));
    }
  }
}