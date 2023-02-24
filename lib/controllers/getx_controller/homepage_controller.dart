import 'package:get/get.dart';

class HomePageController extends GetxController{
  RxDouble height = Get.height.obs;
  RxDouble width = Get.width.obs;

  RxInt textColor = 0.obs;
}