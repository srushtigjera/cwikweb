import 'dart:developer';
import 'dart:io';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/getx_controller/add_listin_controller.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_text_field.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_list.dart';
import '../utils/app_string.dart';

class AddListing extends StatefulWidget {
  const AddListing({Key? key}) : super(key: key);

  @override
  State<AddListing> createState() => _AddListingState();
}

class _AddListingState extends State<AddListing> {
  AddListingController controller = Get.put(AddListingController());

  @override
  void initState() {
    controller.getAmenities();
    //controller.getCity();
    super.initState();
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
    return FutureBuilder(
      future: controller.getCity(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: EdgeInsets.only(
              top: controller.height.value * 0.059,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: controller.height.value * 0.9,
                  width: controller.width.value * 0.15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        AppString.addNewListin,
                        style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: controller.height.value * 0.035,
                      ),
                      const Text(
                        AppString.addNewListinDetail1,
                        style: TextStyle(
                            color: AppColors.blackWithOp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: controller.height.value * 0.03,
                      ),
                      const Text(
                        AppString.addNewListinDetail2,
                        style: TextStyle(
                            color: AppColors.blackWithOp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: controller.height.value * 0.035,
                      ),
                      CustomButton(
                        color: AppColors.primary,
                        btnTitle: 'Save draft',
                        width: double.infinity,
                        fontSizes: 0.008,
                        titleColor: AppColors.white,
                        onTap: () {
                          controller.addListing('Drafts',context);
                        },
                      ),
                      SizedBox(
                        height: controller.height.value * 0.018,
                      ),
                      CustomButton(
                        color: AppColors.primary,
                        btnTitle: 'Publish',
                        width: double.infinity,
                        fontSizes: 0.008,
                        titleColor: AppColors.white,
                        onTap: () {
                          controller.addListing('Public',context);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: controller.width.value * 0.03,
                ),
                Obx(
                  () => Container(
                    // height: controller.height.value * 9,
                    width: controller.width.value * 0.63,
                    child: GestureDetector(
                      onTap: () async {
                        /*controller.picked = await FilePicker.platform.pickFiles();
                      print(controller.picked);*/
                      },
                      child: Column(
                        children: [
                          Container(
                            height: controller.height.value * 0.47,
                            width: controller.width.value * 0.63,
                            decoration: BoxDecoration(
                                color: AppColors.imgBack,
                                borderRadius: BorderRadius.circular(14)),
                            child: GestureDetector(
                                onTap: () async {
                                  pickImage(ImageSource.gallery);
                                },
                                child:
                                (controller.fileName != null)?CircleAvatar(child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: Image.network(controller.fileName!, fit: BoxFit.fill, height: controller.height.value * 0.47,
                                    width: controller.width.value * 0.63))): const Center(child: Text('Click to upload pictures'))
                            ),
                          ),
                          SizedBox(
                            height: controller.height.value * 0.035,
                          ),
                          (controller.fileName != null)? Container():Container(),
                          SizedBox(
                            height: controller.height.value * 0.035,
                          ),
                          CustomTextField(
                            obscureTexts: false,
                            textwidth: controller.width.value * 0.63,
                            textheight: 0.07,
                            cntrollers: controller.ctlTitle.value,
                            hint: 'Listing Title',
                          ),
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomTextField(
                                    obscureTexts: false,
                                    textwidth: 0.31,
                                    textheight: 0.07,
                                    cntrollers: controller.ctlFCU.value,
                                    hint: 'First Closest University / College',
                                  ),
                                  SizedBox(
                                    height: controller.height.value * 0.03,
                                  ),
                                  Container(
                                    height: Get.height * 0.07,
                                    width: Get.width * 0.31,
                                    padding: EdgeInsets.only(
                                        left: Get.width * 0.004,
                                        right: Get.width * 0.003),
                                    decoration: BoxDecoration(
                                      color: AppColors.offWhite,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButtonFormField<String>(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          value: controller.selectedCity,
                                          decoration: InputDecoration(
                                              border: const OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(12),
                                                  ),
                                                  borderSide: BorderSide.none),
                                              hintText: "City",
                                              hintStyle: TextStyle(
                                                  color: AppColors.blackWithOp
                                                      .withOpacity(0.5)),
                                              fillColor: AppColors.offWhite),
                                          onChanged: (value) {
                                            setState(() {
                                              controller.selectedCity = value;
                                              print(controller.selectedCity);
                                            });
                                          },
                                          icon: Image.asset(
                                            AppImages.downArrow,
                                            height: 16,
                                            width: 16,
                                          ),
                                          items: controller.cityList.map<
                                                      DropdownMenuItem<String>>(
                                                  (item) {
                                                return DropdownMenuItem<String>(
                                                  value: item['city_id']
                                                      .toString(),
                                                  child: Text(item['city_name']
                                                      .toString()),
                                                );
                                              }).toList() ??
                                              [],
                                        ),
                                      ),

                                      /* DropdownSearch(
                                              mode: Mode.MENU,
                                              items: controller.cities.map<DropdownMenuItem<String>>((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              */ /*controller.cityList.map<DropdownMenuItem<String>>((item) {
                                                return DropdownMenuItem<String>(
                                                  value: item['city_id'].toString(),
                                                  child: Text(item['city_name'].toString()),
                                                );
                                              }).toList() ?? [],*/ /*
                                              onChanged: (val){
                                                controller.selectedCity = val.toString();
                                                print(val);
                                              },
                                              dropdownSearchDecoration: InputDecoration(
                                                contentPadding: EdgeInsets.fromLTRB(20,13,7,13),
                                                border: InputBorder.none,
                                                //   fillColor: AppColors.lightGreyColor,
                                                filled: true,
                                                hintText: 'City',
                                                hintStyle: TextStyle(color: AppColors.blackWithOp.withOpacity(0.5)),
                                              ),
                                              // popupBackgroundColor: AppColors.lightGreyColor,
                                              popupShape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(14.0),
                                                ),
                                              ),
                                              dropDownButton: Image.asset(AppImages.downArrow,height: 16,width: 16,),
                                              selectedItem: controller.selectedCity),*/
                                    ),
                                  ),
                                  /* CustomTextField(
                                    obscureTexts: false,
                                    textwidth: 0.31,
                                    textheight: 0.07,
                                    cntrollers: controller.ctlCity.value,
                                    hint: 'City',
                                  ),*/
                                  SizedBox(
                                    height: controller.height.value * 0.03,
                                  ),
                                  CustomTextField(
                                    obscureTexts: false,
                                    textwidth: 0.31,
                                    textheight: 0.07,
                                    cntrollers: controller.ctlPostCode.value,
                                    hint: 'Post code',
                                  ),
                                  SizedBox(
                                    height: controller.height.value * 0.03,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: controller.width.value * 0.05,
                                        height: controller.height.value * 0.07,
                                        decoration: const BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                topLeft: Radius.circular(12))),
                                        child: const Center(
                                          child: Text(
                                            '£',
                                            style: TextStyle(
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: Get.width * 0.26,
                                        height: Get.height * 0.07,
                                        decoration: const BoxDecoration(
                                          color: AppColors.offWhite,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(12),
                                              bottomRight: Radius.circular(12)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: Get.height * 0.02),
                                          child: Center(
                                            child: TextFormField(
                                                controller:
                                                    controller.ctlPPW.value,
                                                decoration: InputDecoration(
                                                  hintText: AppString.pricePW,
                                                  hintStyle: TextStyle(
                                                      color: AppColors
                                                          .blackWithOp
                                                          .withOpacity(0.5)),
                                                  border: InputBorder.none,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: controller.height.value * 0.03,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: controller.width.value * 0.05,
                                        height: controller.height.value * 0.07,
                                        decoration: const BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                topLeft: Radius.circular(16))),
                                        child: const Center(
                                          child: Text(
                                            'm2',
                                            style: TextStyle(
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: Get.width * 0.26,
                                        height: Get.height * 0.07,
                                        decoration: const BoxDecoration(
                                          color: AppColors.offWhite,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(12),
                                              bottomRight: Radius.circular(12)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: Get.height * 0.02),
                                          child: Center(
                                            child: TextFormField(
                                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                                controller:
                                                    controller.ctlRoomS.value,
                                                decoration: InputDecoration(
                                                  hintText: AppString.roomSize,
                                                  hintStyle: TextStyle(
                                                      color: AppColors
                                                          .blackWithOp
                                                          .withOpacity(0.5)),
                                                  border: InputBorder.none,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: controller.height.value * 0.03,
                                  ),
                                  CustomTextField(
                                    obscureTexts: false,
                                    textheight: 0.07,
                                    textwidth: 0.31,
                                    cntrollers: controller.ctlBedSize.value,
                                    hint: AppString.bedSize,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: controller.width.value * 0.01,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: controller.height.value * 0.03,
                                  ),
                                  CustomTextField(
                                    obscureTexts: false,
                                    textheight: 0.07,
                                    textwidth: 0.31,
                                    cntrollers: controller.ctlSCU.value,
                                    hint: 'Second Closest University / College',
                                  ),
                                  SizedBox(
                                    height: controller.height.value * 0.03,
                                  ),
                                  CustomTextField(
                                    obscureTexts: false,
                                    textheight: 0.07,
                                    textwidth: 0.31,
                                    cntrollers: controller.ctlAddress.value,
                                    hint: 'Address',
                                  ),
                                  SizedBox(
                                    height: controller.height.value * 0.03,
                                  ),
                                  CustomTextField(
                                    number: [FilteringTextInputFormatter.digitsOnly],
                                    obscureTexts: false,
                                    textheight: 0.07,
                                    textwidth: 0.31,
                                    cntrollers: controller.ctlWDTT.value,
                                    hint: AppString.walkingDistoTow,
                                  ),
                                  SizedBox(
                                    height: controller.height.value * 0.03,
                                  ),
                                  Stack(
                                    children: [
                                      CustomTextField(
                                        number: [FilteringTextInputFormatter.digitsOnly],
                                        obscureTexts: false,
                                        textheight: 0.07,
                                        textwidth: 0.31,
                                        cntrollers: controller.ctlWDTU.value,
                                        hint: AppString.walkingDis,
                                      ),
                                      Positioned(
                                        right: 0,
                                        child: Container(
                                          width: controller.width.value * 0.05,
                                          height:
                                              controller.height.value * 0.07,
                                          decoration: const BoxDecoration(
                                              color: AppColors.primary,
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(12),
                                                  topRight:
                                                      Radius.circular(12))),
                                          child: const Center(
                                            child: Text(
                                              'mins',
                                              style: TextStyle(
                                                  color: AppColors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: controller.height.value * 0.03,
                                  ),
                                  Stack(
                                    children: [
                                      CustomTextField(
                                        number: [FilteringTextInputFormatter.digitsOnly],
                                        obscureTexts: false,
                                        textheight: 0.07,
                                        textwidth: 0.31,
                                        cntrollers: controller.ctlWDTP.value,
                                        hint: AppString.walkingDistoPub,
                                      ),
                                      Positioned(
                                        right: 0,
                                        child: Container(
                                          width: controller.width.value * 0.05,
                                          height:
                                              controller.height.value * 0.07,
                                          decoration: const BoxDecoration(
                                              color: AppColors.primary,
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(12),
                                                  topRight:
                                                      Radius.circular(12))),
                                          child: const Center(
                                            child: Text(
                                              'mins',
                                              style: TextStyle(
                                                  color: AppColors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: controller.height.value * 0.03,
                                  ),
                                  CustomTextField(
                                    obscureTexts: false,
                                    textheight: 0.07,
                                    textwidth: 0.31,
                                    cntrollers: controller.ctlFloor.value,
                                    hint: AppString.floor,
                                  ),
                                  SizedBox(
                                    height: controller.height.value * 0.03,
                                  ),
                                ],
                              )
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: DropdownSearch<String>(
                                mode: Mode.MENU,
                                items: propertyListing,
                                onChanged: (val) {
                                  setState(() {
                                    controller.selectedItem = val;
                                  });
                                },
                                dropdownSearchDecoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 13, 7, 13),
                                  border: InputBorder.none,
                                  //   fillColor: AppColors.lightGreyColor,
                                  filled: true,
                                  hintText: 'Listing Type',
                                  hintStyle: TextStyle(
                                      color: AppColors.blackWithOp
                                          .withOpacity(0.5)),
                                ),
                                // popupBackgroundColor: AppColors.lightGreyColor,
                                popupShape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(14.0),
                                  ),
                                ),
                                dropDownButton: Image.asset(
                                  AppImages.downArrow,
                                  height: 16,
                                  width: 16,
                                ),
                                selectedItem: controller.selectedItem),
                          ),
                          /* SizedBox(
                            height: controller.height.value * 0.09,
                          ),
                          Divider(
                            height: 2,
                            color: AppColors.black.withOpacity(0.10),
                          ),*/
                          SizedBox(
                            height: controller.height.value * 0.03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextField(
                                obscureTexts: false,
                                textheight: 0.31,
                                textwidth: 9,
                                cntrollers: controller.ctlaboutTP.value,
                                hint: AppString.aboutThePro,
                              ),
                              SizedBox(
                                height: controller.height.value * 0.03,
                              ),
                              CustomTextField(
                                obscureTexts: false,
                                textheight: 0.31,
                                textwidth: 9,
                                cntrollers: controller.ctlFacilities.value,
                                hint: AppString.facilities,
                              ),
                              SizedBox(
                                height: controller.height.value * 0.03,
                              ),
                              CustomTextField(
                                obscureTexts: false,
                                textheight: 0.31,
                                textwidth: 9,
                                cntrollers: controller.ctlBillsInc.value,
                                hint: AppString.billsInc,
                              ),
                              SizedBox(
                                height: controller.height.value * 0.05,
                              ),
                              const Text(
                                AppString.tickAllTRA,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary),
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
                                    return Obx(
                                      () => Row(
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                controller.isTrueList[index] =
                                                    !controller
                                                        .isTrueList[index];
                                              },
                                              child: (controller
                                                      .isTrueList[index])
                                                  ? Container(
                                                      height: controller
                                                              .height.value *
                                                          0.025,
                                                      width: controller
                                                              .width.value *
                                                          0.012,
                                                      // color: Colors.amber[200],
                                                      child: Image.asset(
                                                        AppImages.right,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    )
                                                  : Container(
                                                      height: controller
                                                              .height.value *
                                                          0.028,
                                                      width: controller
                                                              .width.value *
                                                          0.012,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .primary),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                    )),
                                          SizedBox(
                                            width:
                                                controller.width.value * 0.007,
                                          ),
                                          Text(
                                            amenities[index],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.blackLight
                                                    .withOpacity(0.8),
                                                fontSize:
                                                    controller.width.value *
                                                        0.008),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
