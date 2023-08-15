import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:meta_shop/res/assets_res.dart';
import 'package:meta_shop/services/urls/api_url.dart';
import 'package:meta_shop/view/components/component/button/button/button.dart';
import 'package:meta_shop/view/components/component/headerWidget/header_widget.dart';
import 'package:meta_shop/view/components/component/items/itemPic/item_pic.dart';
import 'package:meta_shop/view/components/component/productPage/related_page.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/component/text_filed/text_form_filed_widget.dart';
import 'package:meta_shop/view/components/constants/actions/add_to_cart.dart';
import 'package:meta_shop/view/components/constants/actions/add_to_fav.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:meta_shop/view/pages/new/controller/new_product_item.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'controller/product_page_controller.dart';

class ProductPage extends GetWidget<ProductPageController> {
  const ProductPage({Key? key}) : super(key: key);

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
                                SizedBox(
                                  height: 280,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (BuildContext ctx, index) {
                                        return Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[200]!,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              top: 10,
                                            ),
                                            child: Container(
                                              height: 280,
                                              width: 180,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext ctx, index) {
                                        return const SizedBox(
                                          width: 15,
                                        );
                                      },
                                      itemCount: 10),
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
                                            fit: BoxFit.cover,
                                            imageUrl:
                                                '${UrlAPI.baseUrlImage}${controller.productDetailModel.value!.data!.images![controller.index.value].url!}',
                                            placeholder: (context, url) =>
                                                const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        );
                                }),
                                const SizedBox(
                                  height: 10,
                                ),
                                controller.productDetailModel.value!.data!
                                                .video ==
                                            null ||
                                        controller.productDetailModel.value!
                                            .data!.video!.isEmpty
                                    ? Container()
                                    : Container(
                                        width: SizeConfig.screenWidth,
                                        height: 200,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        child: WebView(
                                          initialUrl: controller
                                              .productDetailModel
                                              .value!
                                              .data!
                                              .video!,
                                          javascriptMode:
                                              JavascriptMode.unrestricted,
                                          initialMediaPlaybackPolicy:
                                              AutoMediaPlaybackPolicy
                                                  .always_allow,
                                          gestureNavigationEnabled: true,
                                        ),
                                      ),
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
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              controller.productDetailModel
                                                  .value!.data!.title!,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              '${controller.productDetailModel.value!.data!.price!} JOD',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            controller.productDetailModel.value!
                                                .data!.catagory!,
                                            style: const TextStyle(
                                              color:
                                                  AppColor.globalDefaultColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.star,
                                              color: Colors.amber,
                                              size: 20,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                                (controller
                                                                    .productDetailModel
                                                                    .value!
                                                                    .data!
                                                                    .productReviewAvg ==
                                                                null ||
                                                            controller
                                                                    .productDetailModel
                                                                    .value!
                                                                    .data!
                                                                    .productReviewAvg ==
                                                                0
                                                        ? 0
                                                        : controller
                                                                .productDetailModel
                                                                .value!
                                                                .data!
                                                                .productReviewAvg! /
                                                            20)
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                )),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  child: Text(
                                    controller
                                        .productDetailModel.value!.data!.body!,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Button(
                                  width: SizeConfig.screenWidth * 0.8,
                                  height: 40,
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
                                const SizedBox(
                                  height: 20,
                                ),
                                controller.productDetailModel.value!.data!
                                        .related!.isEmpty
                                    ? Container()
                                    : Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                            ),
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                'related_products'.tr,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 5,
                                            ),
                                            child: SizedBox(
                                              height: 300,
                                              child: ListView.separated(
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                clipBehavior: Clip.hardEdge,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                shrinkWrap: true,
                                                itemCount: controller
                                                    .productDetailModel
                                                    .value!
                                                    .data!
                                                    .related!
                                                    .length,
                                                itemBuilder:
                                                    (BuildContext ctx, index) {
                                                  return NewProductsItem(
                                                    fav: controller
                                                        .productDetailModel
                                                        .value!
                                                        .data!
                                                        .related![index]
                                                        .fav,
                                                    onPressedAddButton: () {
                                                      addToCart(
                                                        vId: controller
                                                            .productDetailModel
                                                            .value!
                                                            .data!
                                                            .related![index]
                                                            .vid!,
                                                        price: controller
                                                            .productDetailModel
                                                            .value!
                                                            .data!
                                                            .related![index]
                                                            .price!,
                                                        cacheUtils: controller
                                                            .cacheUtils,
                                                        httpRepository:
                                                            controller
                                                                .httpRepository,
                                                      );
                                                    },
                                                    onTap: () async {
                                                      // MaterialPageRoute(builder: (BuildContext context) {
                                                      //   return ProductPage();
                                                      // });
                                                      await Get.to(
                                                        () =>
                                                            const RelatedProductPage(),
                                                        arguments: controller
                                                            .productDetailModel
                                                            .value!
                                                            .data!
                                                            .related![index]
                                                            .pid,
                                                      );
                                                    },
                                                    price: controller
                                                        .productDetailModel
                                                        .value!
                                                        .data!
                                                        .related![index]
                                                        .price,
                                                    catName: controller
                                                        .productDetailModel
                                                        .value!
                                                        .data!
                                                        .related![index]
                                                        .title,
                                                    itemName: controller
                                                        .productDetailModel
                                                        .value!
                                                        .data!
                                                        .related![index]
                                                        .title,
                                                    image: controller
                                                        .productDetailModel
                                                        .value!
                                                        .data!
                                                        .related![index]
                                                        .images,
                                                    onPressedFavButton: () {
                                                      controller
                                                                  .productDetailModel
                                                                  .value!
                                                                  .data!
                                                                  .related![
                                                                      index]
                                                                  .fav ==
                                                              0
                                                          ? {
                                                              controller
                                                                  .productDetailModel
                                                                  .value!
                                                                  .data!
                                                                  .related![
                                                                      index]
                                                                  .fav = 1,
                                                              controller
                                                                  .productDetailModel
                                                                  .refresh(),
                                                              addToFavorite(
                                                                cacheUtils:
                                                                    controller
                                                                        .cacheUtils,
                                                                httpRepository:
                                                                    controller
                                                                        .httpRepository,
                                                                productId: controller
                                                                    .productDetailModel
                                                                    .value!
                                                                    .data!
                                                                    .related![
                                                                        index]
                                                                    .pid,
                                                              ),
                                                            }
                                                          : {
                                                              controller
                                                                  .productDetailModel
                                                                  .value!
                                                                  .data!
                                                                  .related![
                                                                      index]
                                                                  .fav = 0,
                                                              controller
                                                                  .productDetailModel
                                                                  .refresh(),
                                                              addToFavorite(
                                                                cacheUtils:
                                                                    controller
                                                                        .cacheUtils,
                                                                httpRepository:
                                                                    controller
                                                                        .httpRepository,
                                                                productId: controller
                                                                    .productDetailModel
                                                                    .value!
                                                                    .data!
                                                                    .related![
                                                                        index]
                                                                    .pid,
                                                              ),
                                                            };
                                                    },
                                                  );
                                                },
                                                separatorBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return const SizedBox(
                                                    width: 15,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Text('feedbacks'.tr,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  child: Obx(() {
                                    return controller.productDetailModel.value!
                                            .data!.productReview!.isEmpty
                                        ? SizedBox(
                                            height: 200,
                                            child: Center(
                                              child: Text(
                                                'No Feedback',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                            ),
                                            height: 305,
                                            child: ListView.separated(
                                              padding: const EdgeInsets.only(
                                                top: 10,
                                                bottom: 20,
                                              ),
                                              scrollDirection: Axis.vertical,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              itemCount: controller
                                                  .productDetailModel
                                                  .value!
                                                  .data!
                                                  .productReview!
                                                  .length,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                        width: 0.1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  15)),
                                                      color: Colors.white,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          color: Colors.grey,
                                                          spreadRadius: -8,
                                                          blurRadius: 15,
                                                          offset: Offset(-5, 5),
                                                        ),
                                                      ]),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: ListTile(
                                                      title: Text(
                                                        controller
                                                            .productDetailModel
                                                            .value!
                                                            .data!
                                                            .productReview![
                                                                index]
                                                            .name!,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      subtitle: Text(
                                                        controller
                                                            .productDetailModel
                                                            .value!
                                                            .data!
                                                            .productReview![
                                                                index]
                                                            .body!,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      leading: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          color: AppColor
                                                              .globalDefaultColor,
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        width: 50,
                                                        height: 50,
                                                        child: Center(
                                                          child: Column(
                                                            children: [
                                                              const Icon(
                                                                Icons.star,
                                                                color: Colors
                                                                    .amber,
                                                                size: 20,
                                                              ),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                  (controller
                                                                              .productDetailModel
                                                                              .value!
                                                                              .data!
                                                                              .productReview![
                                                                                  index]
                                                                              .rating! /
                                                                          20)
                                                                      .toString(),
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      // trailing: SizedBox(
                                                      //   width: 50,
                                                      //   child: Column(
                                                      //     children: [
                                                      //       const Icon(
                                                      //         Icons.star,
                                                      //         color:
                                                      //         Colors.amber,
                                                      //         size: 20,
                                                      //       ),
                                                      //       const SizedBox(
                                                      //         width: 5,
                                                      //       ),
                                                      //       Text(
                                                      //           (controller
                                                      //               .productDetailModel
                                                      //               .value!
                                                      //               .data!
                                                      //               .productReview![
                                                      //           index]
                                                      //               .rating! /
                                                      //               20)
                                                      //               .toString(),
                                                      //           style:
                                                      //           const TextStyle(
                                                      //             color: Colors
                                                      //                 .white,
                                                      //           )),
                                                      //
                                                      //     ],
                                                      //   ),
                                                      // ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return const SizedBox(
                                                  height: 8,
                                                );
                                              },
                                            ),
                                          );
                                  }),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Button(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              actions: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    bottom: 8,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Button(
                                                          radius: 15,
                                                          width: 100,
                                                          onTap: () {
                                                            if (!controller
                                                                .isSubmitted) {
                                                              controller
                                                                  .addRating();
                                                              controller
                                                                      .isSubmitted =
                                                                  true;
                                                            }

                                                            // controller
                                                            //     .commentController
                                                            //     .text = '';
                                                          },
                                                          text: 'submit'.tr,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Expanded(
                                                        child: Button(
                                                          radius: 15,
                                                          width: 100,
                                                          onTap: () {
                                                            Get.back();
                                                          },
                                                          text: 'cancel'.tr,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                              title: Text(
                                                textAlign: TextAlign.center,
                                                'what_is_your_rate'.tr,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              titleTextStyle: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 20),
                                              backgroundColor: Colors.white,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20))),
                                              content: SizedBox(
                                                  height:
                                                      SizeConfig.screenHeight *
                                                          0.38,
                                                  width:
                                                      SizeConfig.screenWidth *
                                                          0.38,
                                                  child: ListView(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child:
                                                            RatingBar.builder(
                                                          itemSize: 35,
                                                          initialRating: 1,
                                                          minRating: 1,
                                                          direction:
                                                              Axis.horizontal,
                                                          allowHalfRating:
                                                              false,
                                                          itemCount: 5,
                                                          itemPadding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      1.0),
                                                          itemBuilder:
                                                              (context, _) =>
                                                                  const Icon(
                                                            FontAwesomeIcons
                                                                .star,
                                                            color: Colors.amber,
                                                          ),
                                                          onRatingUpdate:
                                                              (rating) {
                                                            controller.rate
                                                                .value = rating;
                                                          },
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        'please_share_your_opinion_about_the_product'
                                                            .tr,
                                                        style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      DefaultFormField(
                                                        controller: controller
                                                            .commentController,
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'message_is_required'
                                                                .tr;
                                                          }
                                                          return null;
                                                        },
                                                        isPassword: false,
                                                        radius: 15,
                                                        focusBorderColor: AppColor
                                                            .globalDefaultColor,
                                                        textColor: AppColor
                                                            .globalDefaultColor,
                                                        autofocus: false,
                                                        readOnly: false,
                                                        enabled: true,
                                                        isEmail: true,
                                                        minLines: 10,
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        maxLines: 20,
                                                        borderColors: AppColor
                                                            .globalDefaultColor,
                                                        hint: 'your_comment'.tr,
                                                        hintStyle:
                                                            const TextStyle(
                                                          color: AppColor
                                                              .globalDefaultColor,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            );
                                          });
                                    },
                                    text: 'add_review'.tr,
                                    height: 50,
                                    radius: 15,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
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
