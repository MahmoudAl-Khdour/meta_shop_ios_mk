import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/services/urls/api_url.dart';
import 'package:meta_shop/view/components/component/button/counterButton/counter_button_style_2/counter_button_style_2.dart';
import 'package:meta_shop/view/components/component/items/itemCategories/item_categories.dart';
import 'package:meta_shop/view/components/component/productPage/product_page.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/constants/actions/add_to_cart.dart';
import 'package:meta_shop/view/components/constants/actions/add_to_fav.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:meta_shop/view/pages/home/view/all_brand_products/all_brand_products.dart';
import 'package:meta_shop/view/pages/home/view/all_new_products.dart';
import 'package:meta_shop/view/pages/home/view/all_offer_products.dart';
import 'package:meta_shop/view/pages/home/view/products_inside_main_category/products_inside_main_category.dart';
import 'package:meta_shop/view/pages/new/controller/new_product_item.dart';
import 'package:shimmer/shimmer.dart';

import 'controller/home_controller.dart';
import 'view/search_product/view/search_product.dart';

class HomeScreen extends GetWidget<HomeController> {
  // final AppController appController = Get.put(AppController());
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return RefreshIndicator(
      onRefresh: () async {
        controller.newProductsModel.value = null;
        controller.categoriesModel.value = null;
        controller.offerModel.value = null;
        controller.brandModel.value = null;
        controller.pageSliderModel.value = null;
        Future.delayed(const Duration(milliseconds: 500), () {
          controller.onInit();
        });
      },
      backgroundColor: AppColor.globalDefaultColor,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 70,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              child: RichText(
                                text: TextSpan(
                                  text: 'new_year'.tr,
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' '.tr,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'offers'.tr,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'unlimited_offers'.tr,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 0.5,
                                      blurRadius: 2,
                                      offset: const Offset(
                                        0,
                                        3,
                                      ),
                                    ),
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 0.5,
                                      blurRadius: 2,
                                      offset: const Offset(
                                        3,
                                        0,
                                      ),
                                    ),
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 0.5,
                                      blurRadius: 2,
                                      offset: const Offset(
                                        0,
                                        -3,
                                      ),
                                    ),
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 0.5,
                                      blurRadius: 2,
                                      offset: const Offset(
                                        -3,
                                        0,
                                      ),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(
                                          isDense: true,
                                          suffix: Container(
                                            width: 20,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                              Radius.circular(50),
                                            )),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 0.4,
                                              color: AppColor.globalBorderColor,
                                            ),
                                            gapPadding: 0,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                          ),
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide(width: 0.4),
                                            gapPadding: 0,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(50.0),
                                            ),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 0.4,
                                              color: AppColor.globalBorderColor,
                                            ),
                                            gapPadding: 0,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                          ),
                                          filled: true,
                                          hintStyle: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 13,
                                          ),
                                          hintText: 'what_looking'.tr,
                                          fillColor: Colors.white),
                                      onTap: () {
                                        Get.to(const SearchProduct());
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Container(
                                        height: 35,
                                        width: 35,
                                        decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(50),
                                            )),
                                        child: const Icon(
                                          Icons.search,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 190,
                        child: Obx(() {
                          return controller.pageSliderModel.value == null
                              ? Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[200]!,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Container(
                                      width: SizeConfig.screenWidth,
                                      margin: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                    ),
                                  ),
                                )
                              : CarouselSlider(
                                  items: controller.pageSliderModel.value!.data!
                                      .map((e) {
                                    return Container(
                                      margin: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: CachedNetworkImageProvider(
                                                '${UrlAPI.baseUrlImage}$e')),
                                      ),
                                    );
                                  }).toList(),
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enableInfiniteScroll: true,
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 800),
                                    viewportFraction: 0.8,
                                    aspectRatio: 16 / 9,
                                    enlargeCenterPage: true,
                                    height: 150,
                                  ),
                                );
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'shop_by_category'.tr,
                            style: const TextStyle(
                              fontSize: 16,
                              color: AppColor.globalDefaultColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.03,
                      ),
                      Obx(() {
                        return controller.categoriesModel.value == null
                            ? SizedBox(
                                height: 210,
                                child: GridView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(bottom: 24),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                  ),
                                  itemCount: 10,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[200]!,
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(50)),
                                          border: Border.all(
                                            color: AppColor.globalBorderColor,
                                            width: 0.4,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : SizedBox(
                                height: 230,
                                child: GridView.builder(
                                  controller: controller.catScrollController,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(
                                    top: 15,
                                    bottom: 15,
                                    left: 10,
                                    right: 10,
                                  ),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    //childAspectRatio: ,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                  ),
                                  itemCount: controller
                                      .categoriesModel.value!.data!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Obx(() {
                                      return ItemCategories(
                                        onTap: () {
                                          controller.index.value = 1;
                                          // controller.animateToSelectedIndex(index);
                                          Get.to(
                                              () =>
                                                  const ProductsInsideMainCategory(),
                                              arguments: [
                                                controller.categoriesModel
                                                    .value!.data![index].tid
                                                    .toString(),
                                                index,
                                              ]);
                                        },
                                        image:
                                            '${UrlAPI.baseUrlImage}${controller.categoriesModel.value!.data![index].icon!}',
                                        name: controller.categoriesModel.value!
                                            .data![index].name!,
                                      );
                                    });
                                  },
                                ),
                              );
                      }),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'new_products'.tr,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.globalDefaultColor,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                style: const ButtonStyle(
                                  enableFeedback: false,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 0.5,
                                        blurRadius: 2,
                                        offset: const Offset(
                                          0,
                                          3,
                                        ),
                                      ),
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 0.5,
                                        blurRadius: 2,
                                        offset: const Offset(
                                          3,
                                          0,
                                        ),
                                      ),
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 0.5,
                                        blurRadius: 2,
                                        offset: const Offset(
                                          0,
                                          -3,
                                        ),
                                      ),
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 0.5,
                                        blurRadius: 2,
                                        offset: const Offset(
                                          -3,
                                          0,
                                        ),
                                      ),
                                    ],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'view_all'.tr,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: AppColor.globalDefaultColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                                onPressed: () {
                                  Get.to(() => const AllNewProducts());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Obx(() {
                        return controller.newProductsModel.value == null
                            ? SizedBox(
                                height: 325,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.only(
                                      right: 15,
                                      left: 15,
                                    ),
                                    itemBuilder: (BuildContext ctx, index) {
                                      return Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[200]!,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10,
                                          ),
                                          child: Container(
                                            height: 300,
                                            width: 180,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(15)),
                                              border: Border.all(
                                                color:
                                                    AppColor.globalBorderColor,
                                                width: 0.4,
                                              ),
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
                              )
                            : SizedBox(
                                height: 395,
                                child: ListView.separated(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                    right: 15,
                                    left: 15,
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: controller
                                      .newProductsModel.value!.data!.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return NewProductsItem(
                                      rate: 0.0,
                                      button: CounterButtonStyle2(
                                        count: controller.newProductsModel
                                                .value!.data![index].count ??
                                            0,
                                        addIconHeight: 30,
                                        addIconWidth: 30,
                                        removeIconHeight: 30,
                                        removeIconWidth: 30,
                                        textHeight: 30,
                                        textWidth: 30,
                                        onChange: (int value) {
                                          if (value < 1) {
                                            controller.newProductsModel.value!
                                                .data![index].counti = 1;
                                            controller.newProductsModel
                                                .refresh();
                                          } else {
                                            controller.newProductsModel.value!
                                                .data![index].counti = value;
                                            controller.newProductsModel
                                                .refresh();
                                          }
                                        },
                                        loading: false,
                                      ),
                                      fav: controller.newProductsModel.value!
                                          .data![index].fav,
                                      onPressedAddButton: () async {
                                        await addToCart(
                                          quantity: controller.newProductsModel
                                              .value!.data![index].count
                                              .toString(),
                                          vId: controller.newProductsModel
                                              .value!.data![index].vid!,
                                          price: controller.newProductsModel
                                              .value!.data![index].price!,
                                          cacheUtils: controller.cacheUtils,
                                          httpRepository:
                                              controller.httpRepository,
                                        );
                                      },
                                      onTap: () {
                                        Get.to(
                                          const ProductPage(),
                                          arguments: controller.newProductsModel
                                              .value!.data![index].pid,
                                        );
                                      },
                                      price: controller.newProductsModel.value!
                                          .data![index].price,
                                      catName: controller.newProductsModel
                                          .value!.data![index].catagoryName,
                                      itemName: controller.newProductsModel
                                          .value!.data![index].title,
                                      image: controller.newProductsModel.value!
                                          .data![index].images,
                                      onPressedFavButton: () {
                                        controller.newProductsModel.value!
                                                    .data![index].fav ==
                                                0
                                            ? {
                                                controller
                                                    .newProductsModel
                                                    .value!
                                                    .data![index]
                                                    .fav = 1,
                                                controller.newProductsModel
                                                    .refresh(),
                                                addToFavorite(
                                                  cacheUtils:
                                                      controller.cacheUtils,
                                                  httpRepository:
                                                      controller.httpRepository,
                                                  productId: controller
                                                      .newProductsModel
                                                      .value!
                                                      .data![index]
                                                      .pid,
                                                ),
                                              }
                                            : {
                                                controller
                                                    .newProductsModel
                                                    .value!
                                                    .data![index]
                                                    .fav = 0,
                                                controller.newProductsModel
                                                    .refresh(),
                                                addToFavorite(
                                                  cacheUtils:
                                                      controller.cacheUtils,
                                                  httpRepository:
                                                      controller.httpRepository,
                                                  productId: controller
                                                      .newProductsModel
                                                      .value!
                                                      .data![index]
                                                      .pid,
                                                ),
                                              };
                                      },
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      width: 15,
                                    );
                                  },
                                ),
                              );
                      }),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'offers'.tr,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.globalDefaultColor,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                style: ButtonStyle(
                                  enableFeedback: false,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 0.5,
                                        blurRadius: 2,
                                        offset: const Offset(
                                          0,
                                          3,
                                        ),
                                      ),
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 0.5,
                                        blurRadius: 2,
                                        offset: const Offset(
                                          3,
                                          0,
                                        ),
                                      ),
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 0.5,
                                        blurRadius: 2,
                                        offset: const Offset(
                                          0,
                                          -3,
                                        ),
                                      ),
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 0.5,
                                        blurRadius: 2,
                                        offset: const Offset(
                                          -3,
                                          0,
                                        ),
                                      ),
                                    ],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'view_all'.tr,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: AppColor.globalDefaultColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                                onPressed: () {
                                  Get.to(() => const AllOfferProducts());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Obx(() {
                        return controller.offerModel.value == null
                            ? SizedBox(
                                height: 410,
                                child: ListView.separated(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
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
                                            height: 300,
                                            width: 180,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(15)),
                                              border: Border.all(
                                                color:
                                                    AppColor.globalBorderColor,
                                                width: 0.4,
                                              ),
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
                              )
                            : SizedBox(
                                height: 395,
                                child: ListView.separated(
                                  clipBehavior: Clip.hardEdge,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount:
                                      controller.offerModel.value!.data!.length,
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                    right: 15,
                                    left: 15,
                                  ),
                                  itemBuilder: (BuildContext ctx, index) {
                                    return NewProductsItem(
                                      rate: 0.0,
                                      button: CounterButtonStyle2(
                                        count: controller.offerModel.value!
                                                .data![index].count ??
                                            0,
                                        addIconHeight: 30,
                                        addIconWidth: 30,
                                        removeIconHeight: 30,
                                        removeIconWidth: 30,
                                        textHeight: 30,
                                        textWidth: 30,
                                        onChange: (int value) {
                                          if (value < 1) {
                                            controller.offerModel.value!
                                                .data![index].counti = 1;
                                            controller.offerModel.refresh();
                                          } else {
                                            controller.offerModel.value!
                                                .data![index].counti = value;
                                            controller.offerModel.refresh();
                                          }
                                        },
                                        loading: false,
                                      ),
                                      fav: controller
                                          .offerModel.value!.data![index].fav,
                                      onPressedAddButton: () async {
                                        await addToCart(
                                          quantity: controller.offerModel.value!
                                              .data![index].count
                                              .toString(),
                                          vId: controller.offerModel.value!
                                              .data![index].vid!,
                                          price: controller.offerModel.value!
                                              .data![index].price!,
                                          cacheUtils: controller.cacheUtils,
                                          httpRepository:
                                              controller.httpRepository,
                                        );
                                      },
                                      onTap: () {
                                        Get.to(
                                          const ProductPage(),
                                          arguments: controller.offerModel
                                              .value!.data![index].pid,
                                        );
                                      },
                                      price: controller
                                          .offerModel.value!.data![index].price,
                                      catName: controller.offerModel.value!
                                          .data![index].catagoryName,
                                      itemName: controller
                                          .offerModel.value!.data![index].title,
                                      image: controller.offerModel.value!
                                          .data![index].images,
                                      onPressedFavButton: () {
                                        controller.offerModel.value!
                                                    .data![index].fav ==
                                                0
                                            ? {
                                                controller.offerModel.value!
                                                    .data![index].fav = 1,
                                                controller.offerModel.refresh(),
                                                addToFavorite(
                                                  cacheUtils:
                                                      controller.cacheUtils,
                                                  httpRepository:
                                                      controller.httpRepository,
                                                  productId: controller
                                                      .offerModel
                                                      .value!
                                                      .data![index]
                                                      .pid,
                                                ),
                                              }
                                            : {
                                                controller.offerModel.value!
                                                    .data![index].fav = 0,
                                                controller.offerModel.refresh(),
                                                addToFavorite(
                                                  cacheUtils:
                                                      controller.cacheUtils,
                                                  httpRepository:
                                                      controller.httpRepository,
                                                  productId: controller
                                                      .offerModel
                                                      .value!
                                                      .data![index]
                                                      .pid,
                                                ),
                                              };
                                      },
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      width: 15,
                                    );
                                  },
                                ),
                              );
                      }),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'best_brands'.tr,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.globalDefaultColor,
                            ),
                          ),
                        ),
                      ),
                      Obx(() {
                        return controller.brandModel.value == null
                            ? SizedBox(
                                height: 100,
                                child: ListView.separated(
                                    padding: const EdgeInsets.only(
                                      right: 10,
                                      left: 10,
                                    ),
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
                                            height: 100,
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
                              )
                            : SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  clipBehavior: Clip.hardEdge,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(
                                    right: 10,
                                    left: 10,
                                  ),
                                  itemCount:
                                      controller.brandModel.value!.data!.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return InkWell(
                                      onTap: () {
                                        if (controller
                                            .brandModel
                                            .value!
                                            .data![index]
                                            .categoryId!
                                            .isNotEmpty) {
                                          Get.to(
                                            () => const AllBrandProducts(),
                                            arguments: controller
                                                .brandModel
                                                .value!
                                                .data![index]
                                                .categoryId!,
                                          );
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsetsDirectional.all(
                                          10,
                                        ),
                                        width: 150,
                                        height: 250,
                                        decoration: BoxDecoration(
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.transparent,
                                                spreadRadius: 0.5,
                                                blurRadius: 0.5,
                                                offset: Offset(
                                                  0,
                                                  3,
                                                ),
                                              ),
                                            ],
                                            image: DecorationImage(
                                                image: CachedNetworkImageProvider(
                                                    '${UrlAPI.baseUrlImage}${controller.brandModel.value!.data![index].image!}'))),
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      width: 5,
                                    );
                                  },
                                ),
                              );
                      }),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'subscribe'.tr,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.globalDefaultColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 0.5,
                                      blurRadius: 2,
                                      offset: const Offset(
                                        0,
                                        3,
                                      ),
                                    ),
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 0.5,
                                      blurRadius: 2,
                                      offset: const Offset(
                                        3,
                                        0,
                                      ),
                                    ),
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 0.5,
                                      blurRadius: 2,
                                      offset: const Offset(
                                        0,
                                        -3,
                                      ),
                                    ),
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 0.5,
                                      blurRadius: 2,
                                      offset: const Offset(
                                        -3,
                                        0,
                                      ),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextField(
                                  controller: controller.emailController,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      suffix: Container(
                                        width: 20,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        )),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 0.4,
                                          color: AppColor.globalBorderColor,
                                        ),
                                        gapPadding: 0,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide(width: 0.2),
                                        gapPadding: 0,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.0),
                                        ),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 0.4,
                                          color: AppColor.globalBorderColor,
                                        ),
                                        gapPadding: 0,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      filled: true,
                                      hintStyle: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 13,
                                      ),
                                      hintText: 'Enter your email'.tr,
                                      fillColor: Colors.white),
                                  onSubmitted: (value) {
                                    if (controller
                                        .emailController.text.isNotEmpty) {
                                      controller.subscribeSimplenews();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.03,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
