import 'dart:convert';
import 'package:cwikapp/controllers/getx_controller/login_controller.dart';
import 'package:cwikapp/models/get_data_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:cwikapp/url/api.dart';

class YourListingController extends GetxController{

  RxDouble height = Get.height.obs;
  RxDouble width = Get.width.obs;
  RxInt buttonIndex = 0.obs;
  RxInt counter = 1.obs ;
  var pages = 0;
  var getFilterData ='Public';


  final loginController controllerlogin = Get.put(loginController());
  Dio dio = Dio();

  List<AgentList> agentListDatas = [];

  Future getData(String filter) async {
    var peram = {
      "agent_id": controllerlogin.agentId.toString(),
      "filter" : filter.toString(),
      "page": pages.toString(),
      "size" : 6,
      "apiParameters": jsonEncode({
        "id": controllerlogin.id.toString(),
        "admin_id": controllerlogin.admin_id.toString(),
        "user_id": controllerlogin.user_id.toString(),
        "agent_id": controllerlogin.agentId.toString(),
        "token": controllerlogin.token.toString()
      })
    };

    print('getData===$peram');
    var uri = '${baseUrl.apiBaseUrl}${baseUrl.getHomeData}';
    var response = await dio.post(uri,
        data: peram,
        options: Options(headers: {
          'Contant-Type': 'application/json',
          'Authorization': 'Bearer ${controllerlogin.token.toString()}'
        }));
    var responseData = response.data;
    var profileStatus = response.data['status'];
    if (profileStatus == 'Success') {
      var agentList = responseData['data']['agentList'] as List;

      List<AgentList> agentListData = agentList.map<AgentList>((json) => AgentList.fromJson(json)).toList();

      agentListDatas = agentListData;
      print('profileStatus===$agentListDatas');
      return agentListDatas;

    }
  }
}
