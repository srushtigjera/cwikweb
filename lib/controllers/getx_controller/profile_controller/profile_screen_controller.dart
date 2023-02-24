import 'dart:developer';
import 'package:cwikapp/url/api.dart';
import 'package:cwikapp/views/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  RxDouble height = Get.height.obs;
  RxDouble width = Get.width.obs;
  RxBool updateProIsCheck = false.obs;
  RxBool changePassIsCheck = false.obs;
  var email ;
  var emaildata ;
  var agencyName ;
  var aboutOfAgency ;
  var agentProfile ;
  var name ;

  Dio dio = Dio();

  void signOut(int agentId, String token) async {
    log('$agentId');

    var uri = '${baseUrl.apiBaseUrl}agent/logout';
    var response = await dio.post(uri,
        data: {'agent_id': '$agentId'},
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }));
    log('${response.data}');
    var signOutStatus = response.data['status'];
    if (signOutStatus == 'Success') {
      Get.to(LoginScreen());
    }
  }

  Future profile(int agentId, String token) async {
    var uri = '${baseUrl.apiBaseUrl}agent/profile/details';
    var response = await dio.post(uri,
        data: {'agent_id': '$agentId'},
        options: Options(headers: {
          'Contant-Type': 'application/json',
          'Authorization': 'Bearer $token'
        }));
    var profileStatus = response.data['status'];
    if (profileStatus == 'Success') {
      email = response.data['data']['agent_email'];
      agencyName = response.data['data']['name_of_agency'];
      aboutOfAgency = response.data['data']['about_of_agency'];
      agentProfile = response.data['data']['agent_profile'];
      name = response.data['data']['agent_name'];
      print('imageData====$agentProfile');
    }
  }
}
