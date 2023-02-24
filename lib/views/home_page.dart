import 'dart:developer';

import 'package:cwikapp/views/change_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/getx_controller/detail_screen_controller.dart';
import '../controllers/getx_controller/homepage_controller.dart';
import '../controllers/getx_controller/profile_controller/profile_screen_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_list.dart';
import '../utils/app_string.dart';
import 'add_listing.dart';
import 'detail_screen.dart';
import 'messages_screen.dart';
import 'profile/profile_screen.dart';
import 'profile/update_Profile.dart';
import 'your_listing_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController controller = Get.put(HomePageController());
  DetailScreenController controllers = Get.put(DetailScreenController());
  ProfileScreenController profilecontroller = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: controller.height.value * 0.2),
                child: Column(
                  children: [
                    SizedBox(
                      height: controller.height.value * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(AppImages.cwik),
                        Padding(
                          padding: EdgeInsets.only(
                              top: controller.height.value * 0.07),
                          child: Container(
                            width: controller.width * 0.23,
                            height: controller.height * 0.1,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: navigation.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left: controller.width * 0.02),
                                    child: Obx(
                                      () => GestureDetector(
                                          onTap: () {
                                            controller.textColor.value = index;
                                            if (index == 0) {
                                              yourListing();
                                            } else if (index == 1) {
                                              addListing();
                                            } else if (index == 2) {
                                              message();
                                            } else if (index == 3) {
                                              profile();
                                            }
                                          },
                                          child: Text(
                                            navigation[index],
                                            style: TextStyle(
                                                color: controller.textColor.value == index
                                                    ? AppColors.primary
                                                    : AppColors.blackWithOp,
                                                fontWeight: FontWeight.w600),
                                          )),
                                    ),
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                    Obx(
                      () => (controller.textColor.value == 0)
                              ? (controllers.detailIsCheck.value == true)
                                  ? const DetaiScreen()
                                      : const YourListing()
                              : (controller.textColor.value == 1)
                                  ? const AddListing()
                                  : (controller.textColor.value == 2)
                                      ? const MessagesScreen()
                                      : (controller.textColor.value == 3)
                                          ? (profilecontroller.updateProIsCheck.value == true)
                                            ? (profilecontroller.changePassIsCheck.value == true)
                                            ? const ChangePassword()
                                            : const UpdateProfile()
                                            : const ProfileScreen()
                                            : const YourListing()
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: controller.height.value * 0.03,
              ),
              Divider(
                height: controller.height * 0.03,
              ),
              SizedBox(
                height: controller.height.value * 0.03,
              ),
              Text(
                AppString.copyRight,
                style: TextStyle(
                    color: AppColors.blackLight.withOpacity(0.4),
                    fontSize: controller.height * 0.015,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: controller.height.value * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void yourListing() {
    controllers.detailIsCheck.value = false;
    profilecontroller.updateProIsCheck.value = false;
    profilecontroller.changePassIsCheck.value = false;
  }

  void addListing() {
    controllers.detailIsCheck.value = false;
    profilecontroller.updateProIsCheck.value = false;
    profilecontroller.changePassIsCheck.value = false;
  }

  void message() {
    controllers.detailIsCheck.value = false;
    profilecontroller.updateProIsCheck.value = false;
    profilecontroller.changePassIsCheck.value = false;
  }

  void profile() {
    controllers.detailIsCheck.value = false;
    profilecontroller.updateProIsCheck.value = false;
    profilecontroller.changePassIsCheck.value = false;
  }
}
