import 'dart:developer';
import 'dart:io';
import 'package:cwikapp/controllers/getx_controller/login_controller.dart';
import 'package:cwikapp/controllers/getx_controller/profile_controller/update_profile_controller.dart';
import 'package:cwikapp/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../controllers/getx_controller/profile_controller/profile_screen_controller.dart';
import '../../custom_widgets/custom_text_field.dart';
import '../../utils/app_colors.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {

  UpdateProfileController controller = Get.put(UpdateProfileController());
  loginController logincontroller = Get.put(loginController());

  ProfileScreenController profilecontroller =
      Get.put(ProfileScreenController());

  @override
  void initState() {
    super.initState();
    controller.ctrEmail.value.text = profilecontroller.email;
    controller.ctrName.value.text = profilecontroller.name;
    controller.ctrAgency.value.text = profilecontroller.agencyName;
    controller.ctrAboutAgency.value.text = profilecontroller.aboutOfAgency;
    controller.fileName = profilecontroller.agentProfile;
    print('FILE NAME   ==== ${controller.fileName}');
    print('AGENT NAME == ${profilecontroller.agentProfile}');
  }

  Future pickImage(ImageSource imageSource) async {

    final pickImage = ImagePicker();
    controller.imagePicked = await pickImage.pickImage(
      source: imageSource,
      maxHeight: 200,
      maxWidth: 200,
    );
    if (controller.imagePicked != null) {
      setState(() {
        controller.imageFile = File(controller.imagePicked.path);
        controller.fileName = (controller.imageFile!.path);
        log('imageFile == ${controller.imagePicked}');
        log('fileName == ${controller.fileName}');
      });
    } else {
      log('No image selected!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () {
          profilecontroller.updateProIsCheck.value = false;
          Get.back();
          return new Future(() => true);
        },
        child: Container(
          height: controller.height.value * 0.75,
          width: controller.width.value * 0.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Update profile',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: controller.height.value * 0.018,
                    color: Colors.black),
              ),
              SizedBox(
                height: controller.height.value * 0.045,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      pickImage(ImageSource.gallery);
                    },
                    child:
                    CircleAvatar(
                      radius: 50,
                      child: ClipOval(
                        child: Image.network(controller.fileName!,height: controller.height.value * 0.12,
                          width: controller.width.value * 0.057, fit: BoxFit.fill,),
                      ),
                    )

                  ),
                ],
              ),
              SizedBox(
                height: controller.height.value * 0.03,
              ),
              CustomTextField(
                cntrollers: controller.ctrName.value,
                obscureTexts: false,
                textheight: 0.07,
                textwidth: double.infinity,
                hint: 'Name',
              ),
              SizedBox(
                height: controller.height.value * 0.02,
              ),
              CustomTextField(
                cntrollers: controller.ctrEmail.value,
                obscureTexts: false,
                textheight: 0.07,
                textwidth: double.infinity,
                hint: 'Email',
              ),
              SizedBox(
                height: controller.height.value * 0.02,
              ),
              CustomTextField(
                cntrollers: controller.ctrAgency.value,
                obscureTexts: false,
                textheight: 0.07,
                textwidth: double.infinity,
                hint: 'Agency name',
              ),
              SizedBox(
                height: controller.height.value * 0.02,
              ),
              CustomTextField(
                cntrollers: controller.ctrAboutAgency.value,
                obscureTexts: false,
                textheight: 0.07,
                textwidth: double.infinity,
                hint: 'About the agency',
              ),
              SizedBox(
                height: controller.height.value * 0.025,
              ),
              CustomButton(
                color: AppColors.primary,
                btnTitle: 'Update profile',
                width: double.infinity,
                fontSizes: 0.008,
                titleColor: AppColors.white,
                onTap: () {
                  controller.updateProfile(logincontroller.token,logincontroller.agentId,logincontroller.id,logincontroller.user_id,logincontroller.admin_id,context);
                },
              ),
              SizedBox(
                height: controller.height.value * 0.015,
              ),
              CustomButton(
                color: AppColors.primary,
                btnTitle: 'Change Password',
                width: double.infinity,
                fontSizes: 0.008,
                titleColor: AppColors.white,
                onTap: () {
                  profilecontroller.changePassIsCheck.value = true;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
