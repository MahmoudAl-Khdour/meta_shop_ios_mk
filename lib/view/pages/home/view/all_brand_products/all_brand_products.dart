import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/res/assets_res.dart';
import 'package:meta_shop/view/components/component/headerWidget/header_widget.dart';
import 'package:meta_shop/view/components/component/items/storeItem/store_item.dart';
import 'package:meta_shop/view/components/component/productPage/product_page.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/constants/actions/add_to_cart.dart';
import 'package:meta_shop/view/components/constants/actions/add_to_fav.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:shimmer/shimmer.dart';

import 'controller/controller_brand.dart';

class AllBrandProducts extends GetWidget<BrandController> {
  const AllBrandProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: SizeConfig.screenHeight,
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
                    controller.getAllProductUsingBrandModel.value = null;
                    Future.delayed(const Duration(milliseconds: 500), () {
                      controller.onInit();
                    });
                  },
                  backgroundColor: AppColor.globalDefaultColor,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: Obx(() {
                      return controller.getAllProductUsingBrandModel.value ==
                              null
                          ? GridView.builder(
                              physics: const ScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(
                                bottom: 24,
                              ),
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 300,
                                childAspectRatio: 2 / 3.5,
                                crossAxisSpacing: 15,
                              ),
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index) {
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
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        border: Border.all(
                                          color: AppColor.globalBorderColor,
                                          width: 0.4,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : controller.getAllProductUsingBrandModel.value!.data!
                                  .isEmpty
                              ? Center(
                                  child: Text(
                                    'No elements in new products',
                                    style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                  ),
                                )
                              : GridView.builder(
                                  physics: const ScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(bottom: 24),
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 300,
                                    childAspectRatio: 2 / 3.5,
                                    crossAxisSpacing: 15,
                                  ),
                                  itemCount: controller
                                      .getAllProductUsingBrandModel
                                      .value!
                                      .data!
                                      .length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return StoreItem(
                                      fav: controller
                                          .getAllProductUsingBrandModel
                                          .value!
                                          .data![index]
                                          .fav,
                                      onTap: () {
                                        Get.to(
                                          () => const ProductPage(),
                                          arguments: controller
                                              .getAllProductUsingBrandModel
                                              .value!
                                              .data![index]
                                              .pid,
                                        );
                                      },
                                      image: controller
                                              .getAllProductUsingBrandModel
                                              .value!
                                              .data![index]
                                              .images ??
                                          AssetsRes.PLACEHOLDER,
                                      catName: controller
                                          .getAllProductUsingBrandModel
                                          .value!
                                          .data![index]
                                          .title,
                                      itemName: controller
                                          .getAllProductUsingBrandModel
                                          .value!
                                          .data![index]
                                          .title,
                                      price: controller
                                          .getAllProductUsingBrandModel
                                          .value!
                                          .data![index]
                                          .price,
                                      onPressedAddButton: () {
                                        addToCart(
                                          vId: controller
                                              .getAllProductUsingBrandModel
                                              .value!
                                              .data![index]
                                              .vid!,
                                          price: controller
                                              .getAllProductUsingBrandModel
                                              .value!
                                              .data![index]
                                              .price!,
                                          cacheUtils: controller.cacheUtils,
                                          httpRepository:
                                              controller.httpRepository,
                                        );
                                      },
                                      onPressedFavButton: () {
                                        controller.getAllProductUsingBrandModel
                                                    .value!.data![index].fav ==
                                                0
                                            ? {
                                                controller
                                                    .getAllProductUsingBrandModel
                                                    .value!
                                                    .data![index]
                                                    .fav = 1,
                                                controller
                                                    .getAllProductUsingBrandModel
                                                    .refresh(),
                                                addToFavorite(
                                                  cacheUtils:
                                                      controller.cacheUtils,
                                                  httpRepository:
                                                      controller.httpRepository,
                                                ),
                                              }
                                            : {
                                                controller
                                                    .getAllProductUsingBrandModel
                                                    .value!
                                                    .data![index]
                                                    .fav = 0,
                                                controller
                                                    .getAllProductUsingBrandModel
                                                    .refresh(),
                                                addToFavorite(
                                                  cacheUtils:
                                                      controller.cacheUtils,
                                                  httpRepository:
                                                      controller.httpRepository,
                                                ),
                                              };
                                      },
                                    );
                                  },
                                );
                    }),
                  ),
                ),
              ),
              HeaderWidget(
                numberCartItem: 0,
                haveBack: false,
                title: 'products'.tr,
                onPressed: () {
                  Get.back();
                },
                haveNotification: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
