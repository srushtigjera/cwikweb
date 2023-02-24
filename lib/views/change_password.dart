import 'package:cwikapp/controllers/getx_controller/change_password_controler.dart';
import 'package:cwikapp/controllers/getx_controller/login_controller.dart';
import 'package:cwikapp/controllers/getx_controller/profile_controller/profile_screen_controller.dart';
import 'package:cwikapp/custom_widgets/custom_button.dart';
import 'package:cwikapp/custom_widgets/custom_text_field.dart';
import 'package:cwikapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  ChangePasswordController controller = Get.put(ChangePasswordController());
  ProfileScreenController profilecontroller =
      Get.put(ProfileScreenController());
  loginController logincontroller = Get.put(loginController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () {
          profilecontroller.changePassIsCheck.value = false;
          return new Future(() => true);
        },
        child: Container(
          height: controller.height.value * 0.75,
          width: controller.width.value * 0.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: controller.height.value * 0.2,
              ),
              Text(
                'change password',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: controller.height.value * 0.018,
                    color: Colors.black),
              ),
              SizedBox(
                height: controller.height.value * 0.04,
              ),
              Obx(
                () => CustomTextField(
                  obscureTexts :controller.obscureTexts.value,
                  textheight: 0.07,
                  textwidth: double.infinity,
                  cntrollers: controller.oldPassword.value,
                  hint: 'Old Password',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: IconButton(
                      onPressed: () {
                        controller.oldPass.value = !controller.oldPass.value;
                        controller.obscureTexts.value =
                            !controller.obscureTexts.value;
                      },
                      icon: controller.oldPass.value
                          ? Icon(
                              Icons.lock_open,
                              color: AppColors.primary,
                            )
                          : Icon(
                              Icons.lock_outline,
                              color: AppColors.primary,
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: controller.height.value * 0.02,
              ),
              Obx(
                () => CustomTextField(
                  obscureTexts :controller.newObscureTexts.value,
                  textheight: 0.07,
                  textwidth: double.infinity,
                  cntrollers: controller.newPassword.value,
                  hint: 'New Password',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: IconButton(
                      onPressed: () {
                        controller.newPass.value = !controller.newPass.value;
                        controller.newObscureTexts.value =
                            !controller.newObscureTexts.value;
                      },
                      icon: controller.newPass.value
                          ? Icon(
                              Icons.lock_open,
                              color: AppColors.primary,
                            )
                          : Icon(
                              Icons.lock_outline,
                              color: AppColors.primary,
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: controller.height.value * 0.02,
              ),
              Obx(
                () => CustomTextField(
                  obscureTexts :controller.confirmObscureTexts.value,
                  textheight: 0.07,
                  textwidth: double.infinity,
                  cntrollers: controller.confirmPassword.value,
                  hint: 'Confirm Password',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: IconButton(
                      onPressed: () {
                        controller.confirmPass.value =
                            !controller.confirmPass.value;
                        controller.confirmObscureTexts.value =
                            !controller.confirmObscureTexts.value;
                      },
                      icon: controller.confirmPass.value
                          ? Icon(
                              Icons.lock_open,
                              color: AppColors.primary,
                            )
                          : Icon(
                              Icons.lock_outline,
                              color: AppColors.primary,
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: controller.height.value * 0.02,
              ),
              CustomButton(
                  color: AppColors.primary,
                  btnTitle: 'Update Password',
                  width: double.infinity,
                  fontSizes: 0.008,
                  titleColor: AppColors.white,
                  onTap: (){
                    controller.changePassword(logincontroller.token,logincontroller.agentId,logincontroller.id,logincontroller.user_id,logincontroller.admin_id,context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
