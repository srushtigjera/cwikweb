import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/getx_controller/login_controller.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_text_field.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_string.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController controller = Get.put(loginController());

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
                SizedBox(height: controller.heightSize.value * 0.11),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.cwik),
                  ],
                ),
                SizedBox(height: controller.heightSize.value * 0.06),
                Container(
                  height: controller.heightSize.value * 0.63,
                  width: controller.widthSize.value * 0.35,
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
                    padding: EdgeInsets.symmetric(vertical:controller.heightSize.value * 0.055 , horizontal:controller.widthSize.value * 0.05 ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppString.loginAccount,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: controller.widthSize.value * 0.011,
                                color: AppColors.primary),
                          ),
                          SizedBox(height: controller.heightSize.value * 0.035),

                          Obx( ()=>
                             CustomTextField(
                                obscureTexts :false,
                                textheight: 0.07,
                                textwidth: double.infinity,
                                cntrollers: controller.emailCtrl.value,
                                hint: 'Email',
                              ),
                          ),

                          SizedBox(height: controller.heightSize.value * 0.017),

                          Obx(()=>
                             CustomTextField(
                                obscureTexts: controller.obscureTexts.value,
                                textheight: 0.07,
                                textwidth: double.infinity,
                                cntrollers: controller.passCtrl.value,
                                hint: 'Password',
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: IconButton(
                                    onPressed: () {
                                     controller.btnPress.value = !controller.btnPress.value;
                                     controller.obscureTexts.value = !controller.obscureTexts.value;
                                    },
                                    icon: controller.btnPress.value ? Icon(Icons.lock_open, color: AppColors.primary,): Icon(Icons.lock_outline ,color: AppColors.primary,),
                                  ),
                                ),
                              ),
                          ),

                          SizedBox(
                            height: controller.heightSize.value * 0.022,
                          ),
                           CustomButton(
                                  color: AppColors.primary,
                                  btnTitle: 'Log in',
                                  titleColor: AppColors.white,
                                  onTap: () {
                                    // controller.movetoHome(context);
                                    //}
                                 //  controller.validation();
                                    controller.login(context);
                                    // controller.passCtrl.value.obs;
                                  },
                                  width: double.infinity,
                                  fontSizes: 0.008,
                                ),
                          SizedBox(
                            height: controller.heightSize.value * 0.013,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Get.to(ForgotPassword());
                                },
                                  child: Text(AppString.forgotPass,style: TextStyle(fontWeight: FontWeight.w600,color: AppColors.primary,fontSize: 12),))
                            ],
                          ),
                          SizedBox(height: controller.heightSize * 0.09,),
                          CustomButton(
                            color: AppColors.offWhite,
                            btnTitle: AppString.applyAccount,
                            titleColor: AppColors.blackWithOp,
                            onTap: () {},
                            width: double.infinity,
                            fontSizes: 0.008,
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
