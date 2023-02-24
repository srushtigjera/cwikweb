import 'package:get/get.dart';

class DetailScreenController extends GetxController{

  RxDouble height = Get.height.obs;
  RxDouble width = Get.width.obs;

  RxInt imgIndex = 0.obs;
  RxBool detailIsCheck = false.obs;
  RxBool addListIsCheck = false.obs;

}