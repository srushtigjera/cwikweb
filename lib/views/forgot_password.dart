import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/getx_controller/forgot_password_controller.dart';
import '../controllers/getx_controller/login_controller.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_text_field.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_string.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  ForgotPasswordController controller = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: controller.height.value * 0.2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.cwik),
                  ],
                ),
                SizedBox(height: controller.height.value * 0.06),
                Container(
                  height: controller.height.value * 0.38,
                  width: controller.width.value * 0.29,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.offWhiteColor,
                        offset: Offset(0, 0),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical:controller.height.value * 0.055 , horizontal:controller.width.value * 0.04 ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppString.forgotPassword,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: controller.width.value * 0.011,
                                color: AppColors.primary),
                          ),
                          SizedBox(height: controller.height.value * 0.035),
                          Obx( ()=>
                              CustomTextField(
                                obscureTexts :false,
                                textheight: 0.07,
                                textwidth: double.infinity,
                                cntrollers: controller.emailCtrl.value,
                                hint: 'Email',
                              ),
                          ),

                          SizedBox(height: controller.height.value * 0.045),
                          CustomButton(
                            color: AppColors.primary,
                            btnTitle: 'Submit',
                            titleColor: AppColors.white,
                            onTap: () {
                              controller.forgotPasswordCall(context);
                            },
                            width: double.infinity,
                            fontSizes: 0.008,
                          ),
                          SizedBox(
                            height: controller.height.value * 0.013,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
