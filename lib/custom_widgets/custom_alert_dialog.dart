import 'package:cwikapp/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';

class CustomAlertDialog extends StatelessWidget {
  String? error;
  CustomAlertDialog({Key? key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: const EdgeInsets.only(top: 10.0),
      content: Container(
        width: size.width / 5,
        height: size.height / 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.006),
              child: Text(
                'Error',
                style: TextStyle(
                    color: AppColors.blackWithOp.withOpacity(0.5),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.006),
              child: Text(
                error!,
                style: TextStyle(
                    color: AppColors.blackWithOp.withOpacity(0.5),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.005, vertical: size.height * 0.01),
              child: CustomButton(
                  color: AppColors.primary,
                  btnTitle: 'Ok',
                  width: double.infinity,
                  fontSizes: 0.008,
                  titleColor: AppColors.white,
                  onTap: (){
                    Get.back();
                  },
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
