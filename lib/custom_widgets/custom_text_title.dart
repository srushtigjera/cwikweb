import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';

class CustomTextTitle extends StatelessWidget {
  String? textTitle;
   CustomTextTitle({Key? key, this.textTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Text(
        textTitle!,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
            fontSize: Get.height * 0.023),
      ),
    );
  }
}
