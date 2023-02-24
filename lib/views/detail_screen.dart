import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/getx_controller/detail_screen_controller.dart';
import '../controllers/getx_controller/homepage_controller.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_text_title.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_list.dart';

class DetaiScreen extends StatefulWidget {
  const DetaiScreen({Key? key}) : super(key: key);

  @override
  State<DetaiScreen> createState() => _DetaiScreenState();
}

class _DetaiScreenState extends State<DetaiScreen> {
  DetailScreenController controller = Get.put(DetailScreenController());
  HomePageController homecontroller = Get.put(HomePageController());


  @override
  Widget build(BuildContext context) {
    return Obx(()
     => WillPopScope(
        onWillPop: () {
          controller.detailIsCheck.value = false;
          Get.back();
          return new Future(() => true);
        },
        child: Padding(
          padding:
          EdgeInsets.only(top: controller.height.value * 0.018,),
          child: Column(
            children: [
              SizedBox(
                height: controller.height.value * 0.06,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: controller.height * 0.3,
                          width: controller.width * 0.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: AppColors.offWhite),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: controller.width.value * 0.025,
                                vertical: controller.height.value * 0.06),
                            child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Unpublish Listing',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.blackWithOp,
                                        fontSize:
                                        controller.width.value * 0.008),
                                  ),
                                  Text(
                                    'Mark as rented',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.blackWithOp,
                                        fontSize:
                                        controller.width.value * 0.008),
                                  ),
                                  Text(
                                    'Delete Listing',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.red,
                                        fontSize:
                                        controller.width.value * 0.008),
                                  ),
                                ]),
                          ),
                        ),
                        SizedBox(
                          height: controller.height.value * 0.05,
                        ),
                        CustomButton(
                          color: AppColors.primary,
                          btnTitle: 'Edit Listing',
                          width: controller.width.value * 0.2,
                          fontSizes: 0.008,
                          titleColor: AppColors.white,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: controller.height.value * 0.018,
                  ),
                  SizedBox(
                    width: controller.width.value * 0.03,
                  ),
                  Container(
                    // height: controller.height.value * 5,
                    width: controller.width.value * 0.57,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                              () => Container(
                            width: double.infinity,
                            height: controller.height.value * 0.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Image.asset(
                              image[controller.imgIndex.value],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: controller.height.value * 0.015,
                        ),
                        Container(
                          height: controller.height.value * 0.15,
                          width: controller.width.value * 0.6,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: image.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 10, bottom: 10),
                                  child: Center(
                                    child: Obx(
                                          () => GestureDetector(
                                        onTap: () {
                                          controller.imgIndex.value = index;
                                        },
                                        child: Container(
                                          height:
                                          controller.height.value * 0.17,
                                          width:
                                          controller.width.value * 0.06,
                                          decoration: BoxDecoration(
                                              color: Colors.amber[200],
                                              borderRadius:
                                              BorderRadius.circular(16)),
                                          child: Image.asset(image[index],
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          height: controller.height.value * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Westwood Student Mews',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary,
                                      fontSize:
                                      controller.height.value * 0.025),
                                ),
                                Text(
                                  'University of Warwick',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.blackLight
                                          .withOpacity(0.8),
                                      fontSize:
                                      controller.height.value * 0.018),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '£',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primary,
                                          fontSize:
                                          controller.height.value * 0.02),
                                    ),
                                    Text(
                                      '156',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primary,
                                          fontSize:
                                          controller.height.value * 0.02),
                                    ),
                                    Text(
                                      ' / week',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primary,
                                          fontSize: controller.height.value *
                                              0.014),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: controller.height.value * 0.009,
                                ),
                                Container(
                                  height: controller.height.value * 0.05,
                                  width: controller.width.value * 0.05,
                                  decoration: BoxDecoration(
                                      color: AppColors.offWhite,
                                      borderRadius:
                                      BorderRadius.circular(12)),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        AppImages.pin,
                                        height:
                                        controller.height.value * 0.03,
                                        width: controller.width.value * 0.01,
                                      ),
                                      SizedBox(
                                        width: controller.width.value * 0.003,
                                      ),
                                      Text(
                                        'Map',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.blackLight
                                                .withOpacity(0.8),
                                            fontSize:
                                            controller.height.value *
                                                0.018),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Divider(
                          height: controller.height.value * 0.06,
                          color: AppColors.black.withOpacity(0.1),
                        ),
                        SizedBox(
                          height: controller.height.value * 0.015,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: controller.height.value * 0.07,
                                  width: controller.width.value * 0.28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.offWhite,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: controller.height.value * 0.02),
                                    child: Row(
                                      children: [
                                        Image.asset(AppImages.besSize),
                                        SizedBox(
                                          width:
                                          controller.width.value * 0.013,
                                        ),
                                        const Text(
                                          'Small double bed',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.blackWithOp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: controller.height.value * 0.03,
                                ),
                                Container(
                                  height: controller.height.value * 0.07,
                                  width: controller.width.value * 0.28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.offWhite,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: controller.height.value * 0.02),
                                    child: Row(
                                      children: [
                                        Image.asset(AppImages.faci),
                                        SizedBox(
                                          width:
                                          controller.width.value * 0.013,
                                        ),
                                        const Text(
                                          'Private Bathroom',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.blackWithOp),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: controller.width.value * 0.01,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: controller.height.value * 0.07,
                                  width: controller.width.value * 0.28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.offWhite,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: controller.height.value * 0.02),
                                    child: Row(
                                      children: [
                                        Image.asset(AppImages.sqft),
                                        SizedBox(
                                          width:
                                          controller.width.value * 0.013,
                                        ),
                                        const Text(
                                          '13 m2 / 139 sq ft',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.blackWithOp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: controller.height.value * 0.03,
                                ),
                                Container(
                                  height: controller.height.value * 0.07,
                                  width: controller.width.value * 0.28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.offWhite,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: controller.height.value * 0.02),
                                    child: Row(
                                      children: [
                                        Image.asset(AppImages.type),
                                        SizedBox(
                                          width:
                                          controller.width.value * 0.013,
                                        ),
                                        const Text(
                                          'SGround floor',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.blackWithOp),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: controller.height.value * 0.04,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextTitle(
                              textTitle: 'About the property 🏠',
                            ),
                            SizedBox(
                              height: controller.height.value * 0.01,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed arcu quam laoreet aliquet amet, ipsum mi. In molestie fames mollis feugiat ultricies ultrices integer in.',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.gray,
                                  fontSize: controller.height.value * 0.02),
                            ),
                            SizedBox(
                              height: controller.height.value * 0.03,
                            ),
                            CustomTextTitle(
                              textTitle: 'Facilities include ⭐️',
                            ),
                            SizedBox(
                              height: controller.height.value * 0.01,
                            ),
                            Text(
                              'Wifi, Cinema Room, Gym, Refrigerator, Reception, Elevators, Communal Kitchen, Fully Furnished ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.gray,
                                  fontSize: controller.height.value * 0.02),
                            ),
                            SizedBox(
                              height: controller.height.value * 0.03,
                            ),
                            CustomTextTitle(
                              textTitle: 'Bills included️',
                            ),
                            SizedBox(
                              height: controller.height.value * 0.01,
                            ),
                            Text(
                              'Wifi, Gas, Electricity, Heating, Water',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.gray,
                                  fontSize: controller.height.value * 0.02),
                            ),
                            SizedBox(
                              height: controller.height.value * 0.03,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: controller.height.value * 0.07,
                                  width: controller.width.value * 0.28,
                                  decoration: BoxDecoration(
                                      color: AppColors.showC4C4C4
                                          .withOpacity(0.1),
                                      borderRadius:
                                      BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                        controller.width.value * 0.012),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Distance to University',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.blackLight
                                                  .withOpacity(0.8),
                                              fontSize:
                                              controller.height * 0.023),
                                        ),
                                        Text(
                                          '13 min walk',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.blackLight
                                                .withOpacity(0.6),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: controller.width.value * 0.01,
                                ),
                                Container(
                                  height: controller.height.value * 0.07,
                                  width: controller.width.value * 0.28,
                                  decoration: BoxDecoration(
                                      color: AppColors.showC4C4C4
                                          .withOpacity(0.1),
                                      borderRadius:
                                      BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                        controller.width.value * 0.012),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Public Transport',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.blackLight
                                                  .withOpacity(0.8),
                                              fontSize:
                                              controller.height * 0.023),
                                        ),
                                        Text(
                                          '3 min walk',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.blackLight
                                                .withOpacity(0.6),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: controller.height.value * 0.03,
                            ),
                            CustomTextTitle(
                              textTitle: 'Other Amenities',
                            ),
                            SizedBox(
                              height: controller.height.value * 0.017,
                            ),
                            GridView.builder(
                                itemCount: amenities.length,
                                shrinkWrap: true,
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 7),
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      Container(
                                          height:
                                          controller.height.value * 0.025,
                                          width:
                                          controller.width.value * 0.01,
                                          child: Image.asset(
                                            AppImages.right,
                                            fit: BoxFit.fill,
                                          )),
                                      SizedBox(
                                        width: controller.width.value * 0.007,
                                      ),
                                      Text(
                                        amenities[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.blackLight
                                                .withOpacity(0.8),
                                            fontSize: controller.width.value *
                                                0.008),
                                      ),
                                    ],
                                  );
                                }),
                            SizedBox(
                              height: controller.height.value * 0.045,
                            ),
                            Divider(
                              color: AppColors.black.withOpacity(0.1),
                            ),
                            SizedBox(
                              height: controller.height.value * 0.045,
                            ),
                            CustomTextTitle(
                              textTitle: 'Agent Details',
                            ),
                            SizedBox(
                              height: controller.height.value * 0.02,
                            ),
                            Container(
                              height: controller.height.value * 0.15,
                              width: controller.width.value * 0.27,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.offWhite),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                    controller.width.value * 0.015,
                                    vertical: controller.height.value * 0.03),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Warwick Estates',
                                      style: TextStyle(
                                        fontSize:
                                        controller.height.value * 0.023,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.blackLight
                                            .withOpacity(0.8),
                                      ),
                                    ),
                                    Text(
                                      'Edward McCarren',
                                      style: TextStyle(
                                        fontSize:
                                        controller.height.value * 0.023,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.blackLight
                                            .withOpacity(0.8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: controller.height.value * 0.025,
                            ),
                            Container(
                              height: controller.height.value * 0.08,
                              width: controller.width.value * 0.27,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color:
                                    AppColors.primary.withOpacity(0.2)),
                              ),
                              child: Center(
                                child: CustomTextTitle(
                                  textTitle: 'View agent profile',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: controller.height.value * 0.04,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
