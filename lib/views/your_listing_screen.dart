import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_pagination/flutter_web_pagination.dart';
import 'package:get/get.dart';
import '../controllers/getx_controller/detail_screen_controller.dart';
import '../controllers/getx_controller/homepage_controller.dart';
import '../controllers/getx_controller/your_listing_controller.dart';
import '../custom_widgets/custom_button.dart';
import '../utils/app_colors.dart';
import '../utils/app_list.dart';
import '../utils/app_string.dart';

class YourListing extends StatefulWidget {
  const YourListing({Key? key}) : super(key: key);

  @override
  State<YourListing> createState() => _YourListingState();
}

class _YourListingState extends State<YourListing> {
  YourListingController controller = Get.put(YourListingController());
  DetailScreenController controllers = Get.put(DetailScreenController());
  HomePageController controllerHome = Get.put(HomePageController());


  @override
  void initState() {
    super.initState();
   // controller.getData(controller.getFilterData);

    print(controller.getFilterData);
  }

  void _onTabTapped(int index) {

    if(index == 0){
      controller.getFilterData = 'Public' ;
      print('Button $index tapped');
    }else if(index == 1){
      controller.getFilterData = 'Drafts' ;
      print('Button $index tapped');
    }else if(index == 2){
      controller.getFilterData = 'Rented' ;
      print('Button $index tapped');
    }else{
      controller.getFilterData = 'Public' ;
    }

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: controller.height * 0.04,
          ),
          Container(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: controller.height * 0.075,
                        child: ButtonsTabBar(
                          onTap: _onTabTapped,
                          radius: 12,
                          contentPadding: EdgeInsets.only(
                            left: controller.width.value * 0.037,
                            right: controller.width.value * 0.037,
                          ),
                          backgroundColor:AppColors.primary,
                          unselectedBackgroundColor: AppColors.offWhite,
                          labelStyle:
                          const TextStyle(color: AppColors.white),
                          unselectedLabelStyle: const TextStyle(
                              color: AppColors.black),
                          tabs:  const [
                            Tab(
                              text: 'publish ',
                            ),
                            Tab(
                              text:'  Drafts  ',
                            ),
                            Tab(
                              text: '  Rented  ',
                            ),
                          ],
                        ),
                      ),
                      Obx(() =>
                          SizedBox(
                            height: controller.height * 0.067,
                            child: CustomButton(
                                color: AppColors.offWhite,
                                btnTitle: AppString.addNewListing,
                                width: controller.height * 0.23,
                                fontSizes: 0.006,
                                titleColor: AppColors.blackWithOp,
                                onTap: () {
                                  controllerHome.textColor.value = 1;
                                }
                              // controllers.addListIsCheck.value = true;
                              // log("Add List = ${controllers.addListIsCheck.value}");
                              //  Get.to(AddListing());
                            ),
                          ),
                      ),
                    ],
                  ),
                  SizedBox( height: controller.height * 0.03,),
                  Container(
                    height: controller.height.value * 1,
                    width: controller.width.value,
                    child: TabBarView(
                      children: <Widget>[
                        FutureBuilder(
                    future:  controller.getData('Public'),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return  CircularProgressIndicator();
                      }else if(snapshot.connectionState == ConnectionState.done){
                        return  GridView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15
                            //controller.agentListDatas.length
                          ),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return
                              GestureDetector(
                                onTap: () {
                                  controllers.detailIsCheck.value = true;
                                },
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          height: controller.height * 0.35,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(23),
                                          ),
                                          child: Image.asset(
                                            image[index],
                                            fit: BoxFit.fill,
                                          )),
                                      SizedBox(
                                        height: controller.height * 0.01,
                                      ),
                                      Text(
                                        snapshot.data[index].listingType.toString(),
                                        style: TextStyle(
                                            color: AppColors.blackWithOp
                                                .withOpacity(0.5),
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: controller.height * 0.001,
                                      ),
                                      Text(
                                        snapshot.data[index].listingTitle.toString(),
                                        style: TextStyle(
                                            color: AppColors.black.withOpacity(0.7),
                                            fontSize: controller.height * 0.025,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: controller.height * 0.001,
                                      ),
                                      Text(
                                        snapshot.data[index].firstClosestUniversity.toString(),
                                        style: TextStyle(
                                            color: AppColors.blackLight
                                                .withOpacity(0.6),
                                            fontSize: controller.height * 0.018,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: controller.height * 0.001,
                                      ),
                                      Text(
                                        snapshot.data[index].city.cityName.toString(),
                                        style: TextStyle(
                                            color: AppColors.blackLight
                                                .withOpacity(0.6),
                                            // fontSize: controller.height * 0.017,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: controller.height * 0.001,
                                      ),
                                      Text(
                                       '${snapshot
                                                  .data[index].walkDistFirstUni
                                                  .toString()
                                            }min',
                                        style: TextStyle(
                                            color: AppColors.blackLight
                                                .withOpacity(0.6),
                                            // fontSize: controller.height * 0.017,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: controller.height * 0.001,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '£${snapshot.data[index].pricePerWeek.toString()}',
                                            style: TextStyle(
                                                color: AppColors.blackWithOp
                                                    .withOpacity(0.6),
                                                fontSize:
                                                controller.height * 0.022,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            ' p/w',
                                            style: TextStyle(
                                                color: AppColors.blackWithOp
                                                    .withOpacity(0.6),
                                                fontSize:
                                                controller.height * 0.014,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: controller.height * 0.001,
                                      ),
                                      Text(
                                        snapshot.data[index].agent.agentName.toString(),
                                        style: TextStyle(
                                            color: AppColors.blackLight
                                                .withOpacity(0.6),
                                            fontSize: controller.height * 0.018,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                          },
                        );
                      }
                      return Container();
                    },
                  ),
                        FutureBuilder(
                          future:  controller.getData('Drafts'),
                          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                            if(snapshot.connectionState == ConnectionState.waiting){
                              return  CircularProgressIndicator();
                            }else if(snapshot.connectionState == ConnectionState.done){
                              return  GridView.builder(
                                physics: const AlwaysScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15
                                  //controller.agentListDatas.length
                                ),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return
                                    GestureDetector(
                                      onTap: () {
                                        controllers.detailIsCheck.value = true;
                                      },
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                height: controller.height * 0.35,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(23),
                                                ),
                                                child: Image.asset(
                                                  image[index],
                                                  fit: BoxFit.fill,
                                                )),
                                            SizedBox(
                                              height: controller.height * 0.01,
                                            ),
                                            Text(
                                              snapshot.data[index].listingType.toString(),
                                              style: TextStyle(
                                                  color: AppColors.blackWithOp
                                                      .withOpacity(0.5),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: controller.height * 0.001,
                                            ),
                                            Text(
                                              snapshot.data[index].listingTitle.toString(),
                                              style: TextStyle(
                                                  color: AppColors.black.withOpacity(0.7),
                                                  fontSize: controller.height * 0.025,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: controller.height * 0.001,
                                            ),
                                            Text(
                                              snapshot.data[index].firstClosestUniversity.toString(),
                                              style: TextStyle(
                                                  color: AppColors.blackLight
                                                      .withOpacity(0.6),
                                                  fontSize: controller.height * 0.018,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: controller.height * 0.001,
                                            ),
                                            Text(
                                              snapshot.data[index].city.cityName.toString(),
                                              style: TextStyle(
                                                  color: AppColors.blackLight
                                                      .withOpacity(0.6),
                                                  // fontSize: controller.height * 0.017,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: controller.height * 0.001,
                                            ),
                                            Text(
                                              '${snapshot
                                                  .data[index].walkDistFirstUni
                                                  .toString()
                                              }min',
                                              style: TextStyle(
                                                  color: AppColors.blackLight
                                                      .withOpacity(0.6),
                                                  // fontSize: controller.height * 0.017,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: controller.height * 0.001,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '£${snapshot.data[index].pricePerWeek.toString()}',
                                                  style: TextStyle(
                                                      color: AppColors.blackWithOp
                                                          .withOpacity(0.6),
                                                      fontSize:
                                                      controller.height * 0.022,
                                                      fontWeight: FontWeight.w700),
                                                ),
                                                Text(
                                                  ' p/w',
                                                  style: TextStyle(
                                                      color: AppColors.blackWithOp
                                                          .withOpacity(0.6),
                                                      fontSize:
                                                      controller.height * 0.014,
                                                      fontWeight: FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: controller.height * 0.001,
                                            ),
                                            Text(
                                              snapshot.data[index].agent.agentName.toString(),
                                              style: TextStyle(
                                                  color: AppColors.blackLight
                                                      .withOpacity(0.6),
                                                  fontSize: controller.height * 0.018,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                },
                              );
                            }
                            return Container();
                          },
                        ),
                        FutureBuilder(
                          future:  controller.getData('Rented'),
                          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                            if(snapshot.connectionState == ConnectionState.waiting){
                              return  CircularProgressIndicator();
                            }else if(snapshot.connectionState == ConnectionState.done){
                              return  GridView.builder(
                                physics: const AlwaysScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15
                                  //controller.agentListDatas.length
                                ),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return
                                    GestureDetector(
                                      onTap: () {
                                        controllers.detailIsCheck.value = true;
                                      },
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                height: controller.height * 0.35,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(23),
                                                ),
                                                child: Image.asset(
                                                  image[index],
                                                  fit: BoxFit.fill,
                                                )),
                                            SizedBox(
                                              height: controller.height * 0.01,
                                            ),
                                            Text(
                                              snapshot.data[index].listingType.toString(),
                                              style: TextStyle(
                                                  color: AppColors.blackWithOp
                                                      .withOpacity(0.5),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: controller.height * 0.001,
                                            ),
                                            Text(
                                              snapshot.data[index].listingTitle.toString(),
                                              style: TextStyle(
                                                  color: AppColors.black.withOpacity(0.7),
                                                  fontSize: controller.height * 0.025,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: controller.height * 0.001,
                                            ),
                                            Text(
                                              snapshot.data[index].firstClosestUniversity.toString(),
                                              style: TextStyle(
                                                  color: AppColors.blackLight
                                                      .withOpacity(0.6),
                                                  fontSize: controller.height * 0.018,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: controller.height * 0.001,
                                            ),
                                            Text(
                                              snapshot.data[index].city.cityName.toString(),
                                              style: TextStyle(
                                                  color: AppColors.blackLight
                                                      .withOpacity(0.6),
                                                  // fontSize: controller.height * 0.017,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: controller.height * 0.001,
                                            ),
                                            Text(
                                              '${snapshot
                                                  .data[index].walkDistFirstUni
                                                  .toString()
                                              }min',
                                              style: TextStyle(
                                                  color: AppColors.blackLight
                                                      .withOpacity(0.6),
                                                  // fontSize: controller.height * 0.017,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: controller.height * 0.001,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '£${snapshot.data[index].pricePerWeek.toString()}',
                                                  style: TextStyle(
                                                      color: AppColors.blackWithOp
                                                          .withOpacity(0.6),
                                                      fontSize:
                                                      controller.height * 0.022,
                                                      fontWeight: FontWeight.w700),
                                                ),
                                                Text(
                                                  ' p/w',
                                                  style: TextStyle(
                                                      color: AppColors.blackWithOp
                                                          .withOpacity(0.6),
                                                      fontSize:
                                                      controller.height * 0.014,
                                                      fontWeight: FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: controller.height * 0.001,
                                            ),
                                            Text(
                                              snapshot.data[index].agent.agentName.toString(),
                                              style: TextStyle(
                                                  color: AppColors.blackLight
                                                      .withOpacity(0.6),
                                                  fontSize: controller.height * 0.018,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                },
                              );
                            }
                            return Container();
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox( height: controller.height * 0.03,),
                  Obx(() =>
                   Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        WebPagination(
                            currentPage: controller.counter.value,
                            totalPage: 5,
                            onPageChanged: (page) {
                                controller.counter.value = page;
                                controller.pages = controller.counter.value - 1;
                                controller.getData(controller.getFilterData);
                                print(controller.pages);
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
