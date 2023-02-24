import 'package:cwikapp/controllers/getx_controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/getx_controller/profile_controller/profile_screen_controller.dart';
import '../../custom_widgets/custom_button.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_string.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileScreenController controller = Get.put(ProfileScreenController());
  loginController logincontroller = Get.put(loginController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:  controller.profile(logincontroller.agentId, logincontroller.token),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return  CircularProgressIndicator();
        }else if(snapshot.connectionState == ConnectionState.done){
          return Container(
            width: controller.width.value,
            color: AppColors.white,
            child: Column(
              children: [
                SizedBox(
                  height: controller.height.value * 0.07,
                ),
                Container(
                  height: controller.height.value * 0.57,
                  width: controller.width.value * 0.35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.offWhiteColor,
                        offset: Offset(0, 0),
                        blurRadius: 11,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: controller.width.value * 0.06,
                        vertical: controller.height.value * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppString.yourPro,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                              fontSize: controller.height.value * 0.025),
                        ),
                        SizedBox(
                          height: controller.height.value * 0.035,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(controller.height.value * 0.1),
                              child: Image.network('${controller.agentProfile}',fit:BoxFit.fill,height: controller.height.value * 0.057,
                                width: controller.width.value * 0.027,),
                            ),
                            SizedBox(
                              width: controller.width.value * 0.01,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  controller.email.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary,
                                      fontSize: controller.height.value * 0.02),
                                ),
                                SizedBox(
                                  width: controller.width.value * 0.01,
                                ),
                                Text(
                                  controller.agencyName.toString(),
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: controller.height.value * 0.025,
                        ),
                        Text(
                          'About the agency',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                              fontSize: controller.height.value * 0.016),
                        ),
                        SizedBox(
                          height: controller.height.value * 0.01,
                        ),
                        Text(
                          controller.aboutOfAgency.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.gray,
                              fontSize: controller.height.value * 0.016),
                        ),
                        SizedBox(
                          height: controller.height.value * 0.08,
                        ),
                        CustomButton(
                          color: AppColors.primary,
                          btnTitle: 'Edit profile',
                          width: double.infinity,
                          fontSizes: 0.008,
                          titleColor: AppColors.white,
                          onTap: () {
                            controller.updateProIsCheck.value = true;
                          },
                        ),
                        SizedBox(
                          height: controller.height.value * 0.02,
                        ),
                        CustomButton(
                          color: AppColors.offWhite,
                          btnTitle: 'Sign Out',
                          width: double.infinity,
                          fontSizes: 0.008,
                          titleColor: AppColors.black,
                          onTap: () {
                            controller.signOut(
                                logincontroller.agentId, logincontroller.token);
                          },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: controller.height.value * 0.06,
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
