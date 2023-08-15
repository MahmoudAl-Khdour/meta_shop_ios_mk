import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:meta_shop/res/assets_res.dart';
import 'package:meta_shop/services/urls/api_url.dart';
import 'package:meta_shop/view/components/component/button/button/button.dart';
import 'package:meta_shop/view/components/component/headerWidget/header_widget.dart';
import 'package:meta_shop/view/components/component/items/itemPic/item_pic.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/constants/actions/add_to_cart.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:shimmer/shimmer.dart';

import 'controller/product_page_controller.dart';

class RelatedProductPage extends GetWidget<ProductPageController> {
  const RelatedProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AssetsRes.BACKGROUND_1,
                ))),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 70,
              ),
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.productDetailModel.value = null;
                  Future.delayed(const Duration(milliseconds: 500), () {
                    controller.onInit();
                  });
                },
                backgroundColor: AppColor.globalDefaultColor,
                color: Colors.white,
                child: Obx(() {
                  return controller.productDetailModel.value == null
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[200]!,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: SizeConfig.screenHeight * 0.4,
                                  width: SizeConfig.screenWidth * 0.9,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(25)),
                                    border: Border.all(
                                      width: 0.4,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.screenHeight * 0.02,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  child: SizedBox(
                                    height: 80,
                                    child: ListView.separated(
                                      clipBehavior: Clip.hardEdge,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: 10,
                                      itemBuilder: (BuildContext ctx, index) {
                                        return Shimmer.fromColors(
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[200]!,
                                            child: Container(
                                              clipBehavior: Clip.antiAlias,
                                              width: 80,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20)),
                                                border: Border.all(
                                                  width: 0.1,
                                                  color: AppColor
                                                      .globalBorderColor,
                                                ),
                                              ),
                                            ));
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const SizedBox(
                                          width: 10,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.screenHeight * 0.02,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      height: 15,
                                                      width: 100,
                                                      color: Colors.white,
                                                    )),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 8.0,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: Container(
                                                          height: 100,
                                                          width: 200,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    )),
                                                    SizedBox(
                                                      width: SizeConfig
                                                              .screenWidth *
                                                          0.08,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 40,
                                                        width: 100,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          50)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                SizeConfig.screenWidth * 0.02,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: SizeConfig.screenHeight * 0.005,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amberAccent,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width:
                                                SizeConfig.screenWidth * 0.005,
                                          ),
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amberAccent,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width:
                                                SizeConfig.screenWidth * 0.005,
                                          ),
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amberAccent,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width:
                                                SizeConfig.screenWidth * 0.005,
                                          ),
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amberAccent,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width:
                                                SizeConfig.screenWidth * 0.005,
                                          ),
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amberAccent,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width:
                                                SizeConfig.screenWidth * 0.005,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.screenHeight * 0.01,
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 30,
                                    ),
                                    child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      width: 300,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          width: 0.1,
                                          color: AppColor.globalBorderColor,
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: SizeConfig.screenHeight * 0.01,
                                ),
                                Button(
                                  width: SizeConfig.screenWidth * 0.8,
                                  height: 45,
                                  radius: 50,
                                  onTap: () {},
                                  text: 'add_to_cart'.tr,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        )
                      : Align(
                          alignment: Alignment.topCenter,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Obx(() {
                                  return controller.productDetailModel.value ==
                                          null
                                      ? Container()
                                      : Container(
                                          height: SizeConfig.screenHeight * 0.4,
                                          width: SizeConfig.screenWidth * 0.9,
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(25)),
                                            border: Border.all(
                                              width: 0.4,
                                              color: AppColor.globalBorderColor,
                                            ),
                                          ),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.fill,
                                            imageUrl:
                                                '${UrlAPI.baseUrlImage}${controller.productDetailModel.value!.data!.images![controller.index.value].url!}',
                                            placeholder: (context, url) =>
                                                const CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        );
                                }),
                                Obx(() => controller.productDetailModel.value!
                                            .data!.images!.length ==
                                        1
                                    ? Container(
                                        height: 15,
                                      )
                                    : SizedBox(
                                        height: SizeConfig.screenHeight * 0.02,
                                      )),
                                Obx(() {
                                  return controller.productDetailModel.value!
                                                  .data ==
                                              null ||
                                          controller.productDetailModel.value!
                                                  .data!.images!.length ==
                                              1
                                      ? Container()
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 5,
                                          ),
                                          child: SizedBox(
                                            height: 80,
                                            child: ListView.separated(
                                              clipBehavior: Clip.hardEdge,
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemCount: controller
                                                  .productDetailModel
                                                  .value!
                                                  .data!
                                                  .images!
                                                  .length,
                                              itemBuilder:
                                                  (BuildContext ctx, index) {
                                                return controller
                                                            .productDetailModel
                                                            .value!
                                                            .data!
                                                            .images!
                                                            .length ==
                                                        1
                                                    ? Container()
                                                    : ItemPic(
                                                        onTap: () {
                                                          controller.index
                                                              .value = index;
                                                        },
                                                        imagePath: controller
                                                            .productDetailModel
                                                            .value!
                                                            .data!
                                                            .images![index]
                                                            .url!,
                                                      );
                                              },
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return const SizedBox(
                                                  width: 10,
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                }),
                                Obx(() => controller.productDetailModel.value!
                                            .data!.images!.length ==
                                        1
                                    ? Container()
                                    : SizedBox(
                                        height: SizeConfig.screenHeight * 0.02,
                                      )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Text(
                                                      controller
                                                          .productDetailModel
                                                          .value!
                                                          .data!
                                                          .catagory!,
                                                      style: const TextStyle(
                                                        color: AppColor
                                                            .globalDefaultColor,
                                                        fontSize: 12,
                                                      ),
                                                    )),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 8.0,
                                                        ),
                                                        child: Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              controller
                                                                  .productDetailModel
                                                                  .value!
                                                                  .data!
                                                                  .title!,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            )),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: SizeConfig
                                                              .screenWidth *
                                                          0.08,
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Center(
                                                          child: Text(
                                                            '${controller.productDetailModel.value!.data!.price!} JOD',
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                SizeConfig.screenWidth * 0.02,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: SizeConfig.screenHeight * 0.005,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            FontAwesomeIcons.star,
                                            color: Colors.amberAccent,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width:
                                                SizeConfig.screenWidth * 0.005,
                                          ),
                                          const Icon(
                                            FontAwesomeIcons.star,
                                            color: Colors.amberAccent,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width:
                                                SizeConfig.screenWidth * 0.005,
                                          ),
                                          const Icon(
                                            FontAwesomeIcons.star,
                                            color: Colors.amberAccent,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width:
                                                SizeConfig.screenWidth * 0.005,
                                          ),
                                          const Icon(
                                            FontAwesomeIcons.star,
                                            color: Colors.amberAccent,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width:
                                                SizeConfig.screenWidth * 0.005,
                                          ),
                                          const Icon(
                                            FontAwesomeIcons.star,
                                            color: Colors.amberAccent,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width:
                                                SizeConfig.screenWidth * 0.005,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.screenHeight * 0.01,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  child: Text(
                                    controller
                                        .productDetailModel.value!.data!.body!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Button(
                                  width: SizeConfig.screenWidth * 0.8,
                                  height: 45,
                                  radius: 50,
                                  onTap: () {
                                    addToCart(
                                      vId: controller
                                          .productDetailModel.value!.data!.vid!,
                                      price: controller.productDetailModel
                                          .value!.data!.price!,
                                      cacheUtils: controller.cacheUtils,
                                      httpRepository: controller.httpRepository,
                                    );
                                  },
                                  text: 'add_to_cart'.tr,
                                ),
                                // SizedBox(
                                //   height: 15,
                                // ),
                                // SizedBox(
                                //   height: 300,
                                //   child: ListView.separated(
                                //     clipBehavior: Clip.hardEdge,
                                //     scrollDirection: Axis.horizontal,
                                //     shrinkWrap: true,
                                //     itemCount: controller.productDetailModel
                                //         .value!.data!.related!.length,
                                //     itemBuilder: (BuildContext ctx, index) {
                                //       return NewProductsItem(
                                //         fav: controller.productDetailModel
                                //             .value!.data!.related![index].fav,
                                //         onPressedAddButton: () {
                                //           addToCart(
                                //             vId: controller
                                //                 .productDetailModel
                                //                 .value!
                                //                 .data!
                                //                 .related![index]
                                //                 .vid!,
                                //             price: controller
                                //                 .productDetailModel
                                //                 .value!
                                //                 .data!
                                //                 .related![index]
                                //                 .price!,
                                //             cacheUtils: controller.cacheUtils,
                                //             httpRepository:
                                //             controller.httpRepository,
                                //           );
                                //         },
                                //         onTap: () async {
                                //           // MaterialPageRoute(builder: (BuildContext context) {
                                //           //   return ProductPage();
                                //           // });
                                //           Get.back();
                                //           await Get.to(
                                //                 () => const ProductPage(),
                                //             arguments: controller
                                //                 .productDetailModel
                                //                 .value!
                                //                 .data!
                                //                 .related![index]
                                //                 .pid,
                                //           );
                                //         },
                                //         price: controller.productDetailModel
                                //             .value!.data!.related![index].price,
                                //         catName: controller.productDetailModel
                                //             .value!.data!.related![index].title,
                                //         itemName: controller.productDetailModel
                                //             .value!.data!.related![index].title,
                                //         image: controller
                                //             .productDetailModel
                                //             .value!
                                //             .data!
                                //             .related![index]
                                //             .images,
                                //         onPressedFavButton: () {
                                //           controller
                                //               .productDetailModel
                                //               .value!
                                //               .data!
                                //               .related![index]
                                //               .fav ==
                                //               0
                                //               ? {
                                //             controller
                                //                 .productDetailModel
                                //                 .value!
                                //                 .data!
                                //                 .related![index]
                                //                 .fav = 1,
                                //             controller.productDetailModel
                                //                 .refresh(),
                                //             addToFavorite(
                                //               cacheUtils:
                                //               controller.cacheUtils,
                                //               httpRepository: controller
                                //                   .httpRepository,
                                //               productId: controller
                                //                   .productDetailModel
                                //                   .value!
                                //                   .data!
                                //                   .related![index]
                                //                   .pid,
                                //             ),
                                //           }
                                //               : {
                                //             controller
                                //                 .productDetailModel
                                //                 .value!
                                //                 .data!
                                //                 .related![index]
                                //                 .fav = 0,
                                //             controller.productDetailModel
                                //                 .refresh(),
                                //             addToFavorite(
                                //               cacheUtils:
                                //               controller.cacheUtils,
                                //               httpRepository: controller
                                //                   .httpRepository,
                                //               productId: controller
                                //                   .productDetailModel
                                //                   .value!
                                //                   .data!
                                //                   .related![index]
                                //                   .pid,
                                //             ),
                                //           };
                                //         },
                                //       );
                                //     },
                                //     separatorBuilder:
                                //         (BuildContext context, int index) {
                                //       return const SizedBox(
                                //         width: 15,
                                //       );
                                //     },
                                //   ),
                                // ),
                                const SizedBox(
                                  height: 40,
                                ),
                              ],
                            ),
                          ),
                        );
                }),
              ),
            ),
            HeaderWidget(
              numberCartItem: 0,
              haveBack: false,
              title: 'product_page'.tr,
              onPressed: () {
                Get.back();
              },
              haveNotification: false,
            ),
          ],
        ),
      )),
    );
  }
}
