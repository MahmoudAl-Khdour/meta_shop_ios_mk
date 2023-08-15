import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/res/assets_res.dart';
import 'package:meta_shop/view/components/component/headerWidget/header_widget.dart';
import 'package:meta_shop/view/components/component/productPage/product_page.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/constants/actions/add_to_cart.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:meta_shop/view/pages/new/controller/new_product_item.dart';
import 'package:shimmer/shimmer.dart';

import 'controller/favorite_controller.dart';

class Favorite extends GetWidget<FavoriteController> {
  const Favorite({Key? key}) : super(key: key);

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
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 70,
            ),
            child: RefreshIndicator(
              onRefresh: () async {
                controller.favoriteModel.value = null;
                Future.delayed(const Duration(milliseconds: 500), () {
                  controller.onInit();
                });
              },
              backgroundColor: AppColor.globalDefaultColor,
              color: Colors.white,
              child: Obx(() {
                return controller.favoriteModel.value == null
                    ? GridView.builder(
                        physics: const ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(
                          bottom: 24,
                          left: 15,
                          right: 15,
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
                    : controller.favoriteModel.value!.data!.isEmpty
                        ? Center(
                            child: Text(
                              'no_elements_in_favorite'.tr,
                              style: TextStyle(
                                fontSize: 23,
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                          )
                        : SizedBox(
                            height: SizeConfig.screenHeight,
                            child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(
                                bottom: 24,
                                left: 15,
                                right: 15,
                              ),
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 310,
                                childAspectRatio: 2 / 4.5,
                                crossAxisSpacing: 15,
                              ),
                              itemCount:
                                  controller.favoriteModel.value!.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                controller.index.value = index;
                                controller.productId.value = controller
                                    .favoriteModel.value!.data![index].pid;
                                return NewProductsItem(
                                  button: Container(),
                                  fav: 1,
                                  iconColor: controller.favoriteModel.value!
                                              .data![index].fav ==
                                          1
                                      ? Colors.red
                                      : Colors.black,
                                  icon: controller.favoriteModel.value!
                                              .data![index].fav ==
                                          1
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  onTap: () {
                                    Get.to(
                                      const ProductPage(),
                                      arguments: controller.favoriteModel.value!
                                          .data![index].pid,
                                    );
                                  },
                                  image: controller.favoriteModel.value!
                                          .data![index].images ??
                                      AssetsRes.PLACEHOLDER,
                                  catName: controller
                                      .favoriteModel.value!.data![index].title,
                                  itemName: controller
                                      .favoriteModel.value!.data![index].title,
                                  price: controller
                                      .favoriteModel.value!.data![index].price,
                                  onPressedAddButton: () {
                                    addToCart(
                                      quantity: "1",
                                      vId: controller.favoriteModel.value!
                                          .data![index].vid!,
                                      price: controller.favoriteModel.value!
                                          .data![index].price!,
                                      cacheUtils: controller.cacheUtils,
                                      httpRepository: controller.httpRepository,
                                    );
                                  },
                                  onPressedFavButton: () {
                                    controller.fav.value
                                        ? {
                                            controller.fav.value = false,
                                            controller.iconFavColor.value =
                                                Colors.black,
                                            controller.icon.value =
                                                Icons.favorite_border,
                                            controller.addToFavorite(controller
                                                .favoriteModel
                                                .value!
                                                .data![index]
                                                .pid),
                                          }
                                        : {
                                            controller.fav.value = true,
                                            controller.iconFavColor.value =
                                                Colors.red,
                                            controller.icon.value =
                                                Icons.favorite,
                                            controller.addToFavorite(controller
                                                .favoriteModel
                                                .value!
                                                .data![index]
                                                .pid),
                                          };
                                  },
                                );
                              },
                            ),
                          );
              }),
            ),
          ),
          HeaderWidget(
            numberCartItem: 0,
            haveBack: false,
            title: 'favorite'.tr,
            onPressed: () {
              Get.back();
            },
            haveNotification: false,
          ),
        ]),
      ),
    ));
  }
}
