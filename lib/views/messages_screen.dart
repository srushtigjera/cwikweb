


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/getx_controller/msg_screen_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_list.dart';
import '../utils/app_string.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MassagesScreenState();
}

class _MassagesScreenState extends State<MessagesScreen> {
  MsgScreenController controller = Get.put(MsgScreenController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: controller.height * 0.04,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  height: controller.height * 0.9,
                  width: controller.width * 0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        AppString.yourMsg,
                        style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: controller.height * 0.03,
                      ),
                      Container(
                        height: controller.height * 0.75,
                        width: controller.width * 0.25,
                        child: ListView.builder(
                            itemCount: chateUserModel.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    height: controller.height * 0.15,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.showF6F6F6),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: controller.width * 0.01,
                                          vertical: controller.height * 0.02),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                height: controller.height * 0.055,
                                                width: controller.width * 0.025,
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: controller.width * 0.01,
                                          ),
                                          Container(
                                            width: controller.width * 0.176,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  chateUserModel[index]
                                                      .userName,
                                                  style: TextStyle(
                                                      fontSize:
                                                          controller.width *
                                                              0.009,
                                                      color:
                                                          AppColors.blackLight,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  chateUserModel[index]
                                                      .propertyName,
                                                  style: TextStyle(
                                                      fontSize:
                                                          controller.width *
                                                              0.0069,
                                                      color: AppColors.black
                                                          .withOpacity(0.6),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  chateUserModel[index]
                                                      .propertyType,
                                                  style: TextStyle(
                                                      fontSize:
                                                          controller.width *
                                                              0.0069,
                                                      color: AppColors.black
                                                          .withOpacity(0.6),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height:
                                                      controller.height * 0.01,
                                                ),
                                                Text(
                                                  chateUserModel[index].msg,
                                                  style: TextStyle(
                                                      fontSize:
                                                          controller.width *
                                                              0.006,
                                                      color: AppColors.black
                                                          .withOpacity(0.6),
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                chateUserModel[index].date,
                                                style: TextStyle(
                                                    fontSize: controller.width *
                                                        0.0055,
                                                    color: AppColors.black
                                                        .withOpacity(0.6),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                chateUserModel[index].time,
                                                style: TextStyle(
                                                    fontSize: controller.width *
                                                        0.0055,
                                                    color: AppColors.black
                                                        .withOpacity(0.6),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: controller.height * 0.028,
                                  ),
                                ],
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: controller.width * 0.03,
            ),
            Column(
              children: [
                Container(
                  height: controller.height * 0.85,
                  width: controller.width * 0.53,
                  decoration: BoxDecoration(
                      // color: Colors.green[300],
                      borderRadius: BorderRadius.circular(12),
                      border:
                          Border.all(color: AppColors.showEDEBE6, width: 2)),
                  child: Column(
                    children: [
                      Container(
                        height: controller.height * 0.1,
                        width: controller.width * 0.53,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              topLeft: Radius.circular(12)),
                          color: AppColors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: controller.width * 0.012),
                          child: Row(
                            children: [
                              Container(
                                height: controller.height * 0.06,
                                width: controller.width * 0.026,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                              SizedBox(
                                width: controller.width * 0.01,
                              ),
                              Expanded(
                                child: Text(
                                  'Clara Simpson',
                                  style: TextStyle(
                                      fontSize: controller.width * 0.009,
                                      color: AppColors.blackLight,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.more_vert_rounded,
                                    color: AppColors.black,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: controller.width * 0.53,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                              color: AppColors.showF6F6F6),
                          child: Stack(
                            children: [
                              ListView.builder(
                                  itemCount: chatMassage.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: controller.width * 0.008,
                                          vertical: controller.height * 0.02),
                                      child: Align(
                                        alignment:
                                            ((chatMassage[index].msgType ==
                                                    "receiver")
                                                ? Alignment.topLeft
                                                : Alignment.topRight),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color:
                                                  chatMassage[index].msgType ==
                                                          "receiver"
                                                      ? AppColors.white
                                                      : AppColors.primary),
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  controller.width * 0.01,
                                              vertical:
                                                  controller.height * 0.018),
                                          child: Text(
                                            chatMassage[index].msgContent,
                                            style: TextStyle(
                                                fontSize:
                                                    controller.width * 0.008,
                                                fontWeight: FontWeight.w400,
                                                color: chatMassage[index]
                                                            .msgType ==
                                                        "receiver"
                                                    ? AppColors.show262626
                                                    : AppColors.white),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: controller.width * 0.01,
                                      vertical: controller.height * 0.02),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: controller.width * 0.01),
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                                hintText: "Type message...",
                                                hintStyle: TextStyle(
                                                    color:
                                                        AppColors.showB0B0B0),
                                                border: InputBorder.none),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: AppColors.primary),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    controller.width * 0.01,
                                                vertical:
                                                    controller.height * 0.018),
                                            child: Image.asset(AppImages.shar),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
