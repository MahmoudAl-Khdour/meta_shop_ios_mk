import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/res/assets_res.dart';
import 'package:meta_shop/view/components/component/button/button/button.dart';
import 'package:meta_shop/view/components/component/button/counterButton/counter_button_style_2/counter_button_style_2.dart';
import 'package:meta_shop/view/components/component/productPage/product_page.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/constants/actions/add_to_cart.dart';
import 'package:meta_shop/view/components/constants/actions/add_to_fav.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:meta_shop/view/pages/new/controller/new_product_item.dart';
import 'package:shimmer/shimmer.dart';

import 'controller/store_controller.dart';

class Store extends GetWidget<StoreController> {
  const Store({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.only(
        top: 70,
      ),
      child: RefreshIndicator(
        onRefresh: () async {
          controller.departmentModel.value = null;
          controller.products.value = [];
          controller.haveSub.value = false;
          controller.counter = 1;
          Future.delayed(const Duration(milliseconds: 500), () {
            controller.onInit();
          });
        },
        backgroundColor: AppColor.globalDefaultColor,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Obx(() {
              return Padding(
                padding: EdgeInsets.only(
                  top: controller.haveSub.value ? 115 : 60,
                  left: 15,
                  right: 15,
                ),
                child: Stack(
                  children: [
                    Obx(() {
                      controller.products.refresh();
                      controller.getAllProductUsingCategoryModel.refresh();
                      return controller.products.isNotEmpty
                          ? controller.clickedMainDep.value
                              ? controller.getAllProductUsingCategoryModel
                                          .value ==
                                      null
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : controller.getAllProductUsingCategoryModel
                                          .value!.data!.isEmpty
                                      ? Center(
                                          child: Text(
                                          'no_item_in_this_category'.tr,
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            fontSize: 18,
                                          ),
                                        ))
                                      : GridView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          padding: const EdgeInsets.only(
                                            bottom: 24,
                                            top: 10,
                                          ),
                                          gridDelegate:
                                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: 310,
                                            childAspectRatio: 2 / 4.5,
                                            crossAxisSpacing: 15,
                                          ),
                                          itemCount: controller
                                              .getAllProductUsingCategoryModel
                                              .value!
                                              .data!
                                              .length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return NewProductsItem(
                                              button: CounterButtonStyle2(
                                                count: controller
                                                        .getAllProductUsingCategoryModel
                                                        .value!
                                                        .data![index]
                                                        .count ??
                                                    0,
                                                addIconHeight: 30,
                                                addIconWidth: 30,
                                                removeIconHeight: 30,
                                                removeIconWidth: 30,
                                                textHeight: 30,
                                                textWidth: 30,
                                                onChange: (int value) {
                                                  if (value < 1) {
                                                    controller
                                                        .getAllProductUsingCategoryModel
                                                        .value!
                                                        .data![index]
                                                        .counti = 1;
                                                    controller
                                                        .getAllProductUsingCategoryModel
                                                        .refresh();
                                                  } else {
                                                    controller
                                                        .getAllProductUsingCategoryModel
                                                        .value!
                                                        .data![index]
                                                        .counti = value;
                                                    controller
                                                        .getAllProductUsingCategoryModel
                                                        .refresh();
                                                  }
                                                },
                                                loading: false,
                                              ),
                                              fav: controller
                                                  .getAllProductUsingCategoryModel
                                                  .value!
                                                  .data![index]
                                                  .fav,
                                              onTap: () {
                                                Get.to(
                                                  const ProductPage(),
                                                  arguments: controller
                                                      .getAllProductUsingCategoryModel
                                                      .value!
                                                      .data![index]
                                                      .pid,
                                                );
                                              },
                                              image: controller
                                                      .getAllProductUsingCategoryModel
                                                      .value!
                                                      .data![index]
                                                      .images ??
                                                  AssetsRes.PLACEHOLDER,
                                              catName: controller
                                                  .getAllProductUsingCategoryModel
                                                  .value!
                                                  .data![index]
                                                  .title,
                                              itemName: controller
                                                  .getAllProductUsingCategoryModel
                                                  .value!
                                                  .data![index]
                                                  .title,
                                              price: controller
                                                  .getAllProductUsingCategoryModel
                                                  .value!
                                                  .data![index]
                                                  .price,
                                              onPressedAddButton: () {
                                                addToCart(
                                                  quantity: controller
                                                      .getAllProductUsingCategoryModel
                                                      .value!
                                                      .data![index]
                                                      .count
                                                      .toString(),
                                                  vId: controller
                                                      .getAllProductUsingCategoryModel
                                                      .value!
                                                      .data![index]
                                                      .vid!,
                                                  price: controller
                                                      .getAllProductUsingCategoryModel
                                                      .value!
                                                      .data![index]
                                                      .price!,
                                                  cacheUtils:
                                                      controller.cacheUtils,
                                                  httpRepository:
                                                      controller.httpRepository,
                                                );
                                              },
                                              onPressedFavButton: () {
                                                controller
                                                            .getAllProductUsingCategoryModel
                                                            .value!
                                                            .data![index]
                                                            .fav ==
                                                        0
                                                    ? {
                                                        controller
                                                            .getAllProductUsingCategoryModel
                                                            .value!
                                                            .data![index]
                                                            .fav = 1,
                                                        controller
                                                            .getAllProductUsingCategoryModel
                                                            .refresh(),
                                                        addToFavorite(
                                                          cacheUtils: controller
                                                              .cacheUtils,
                                                          httpRepository:
                                                              controller
                                                                  .httpRepository,
                                                          productId: controller
                                                              .getAllProductUsingCategoryModel
                                                              .value!
                                                              .data![index]
                                                              .pid,
                                                        ),
                                                      }
                                                    : {
                                                        controller
                                                            .getAllProductUsingCategoryModel
                                                            .value!
                                                            .data![index]
                                                            .fav = 0,
                                                        controller
                                                            .getAllProductUsingCategoryModel
                                                            .refresh(),
                                                        addToFavorite(
                                                          cacheUtils: controller
                                                              .cacheUtils,
                                                          httpRepository:
                                                              controller
                                                                  .httpRepository,
                                                          productId: controller
                                                              .getAllProductUsingCategoryModel
                                                              .value!
                                                              .data![index]
                                                              .pid,
                                                        ),
                                                      };
                                              },
                                            );
                                          },
                                        )
                              : GridView.builder(
                                  controller: controller.scrollController,
                                  physics: const ScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(
                                    bottom: 24,
                                    top: 10,
                                  ),
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 310,
                                    childAspectRatio: 2 / 4.5,
                                    crossAxisSpacing: 15,
                                  ),
                                  itemCount: controller.products.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return NewProductsItem(
                                      button: CounterButtonStyle2(
                                        count:
                                            controller.products[index].count ??
                                                0,
                                        addIconHeight: 30,
                                        addIconWidth: 30,
                                        removeIconHeight: 30,
                                        removeIconWidth: 30,
                                        textHeight: 30,
                                        textWidth: 30,
                                        onChange: (int value) {
                                          if (value < 1) {
                                            controller.products[index].counti =
                                                1;
                                            controller.products.refresh();
                                          } else {
                                            controller.products[index].counti =
                                                value;
                                            controller.products.refresh();
                                          }
                                        },
                                        loading: false,
                                      ),
                                      fav: controller.products[index].fav,
                                      onTap: () {
                                        Get.to(
                                          const ProductPage(),
                                          arguments:
                                              controller.products[index].pid,
                                        );
                                      },
                                      image: controller.products[index].images,
                                      catName: controller.products[index].title,
                                      itemName:
                                          controller.products[index].title,
                                      price: controller.products[index].price,
                                      onPressedAddButton: () {
                                        addToCart(
                                          quantity: controller
                                              .products[index].count
                                              .toString(),
                                          vId: controller.products[index].vid!,
                                          httpRepository:
                                              controller.httpRepository,
                                          cacheUtils: controller.cacheUtils,
                                          price:
                                              controller.products[index].price!,
                                        );
                                      },
                                      onPressedFavButton: () {
                                        controller.products[index].fav == 0
                                            ? {
                                                controller.products[index].fav =
                                                    1,
                                                controller.products.refresh(),
                                                addToFavorite(
                                                  cacheUtils:
                                                      controller.cacheUtils,
                                                  httpRepository:
                                                      controller.httpRepository,
                                                  productId: controller
                                                      .products[index].pid,
                                                ),
                                              }
                                            : {
                                                controller.products[index].fav =
                                                    0,
                                                controller.products.refresh(),
                                                addToFavorite(
                                                  cacheUtils:
                                                      controller.cacheUtils,
                                                  httpRepository:
                                                      controller.httpRepository,
                                                  productId: controller
                                                      .products[index].pid,
                                                ),
                                              };
                                      },
                                    );
                                  },
                                )
                          : GridView.builder(
                              controller: controller.scrollController,
                              physics: const ScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(bottom: 24),
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 300,
                                childAspectRatio: 2 / 4,
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
                            );
                    }),
                    Obx(() {
                      return controller.loading.value
                          ? Container()
                          : Container();
                    }),
                  ],
                ),
              );
            }),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Obx(() {
                    return controller.departmentModel.value == null
                        ? SizedBox(
                            height: 50,
                            child: ListView.separated(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              clipBehavior: Clip.hardEdge,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (BuildContext ctx, int index) {
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[200]!,
                                  child: Container(
                                    height: 40,
                                    width: 128,
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
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                            ),
                          )
                        : SizedBox(
                            height: 50,
                            // top screen categories
                            child: ListView.separated(
                              controller: controller.catScrollController.value,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              clipBehavior: Clip.hardEdge,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: controller.departmentModel.value!.data!
                                  .department!.length,
                              itemBuilder: (BuildContext ctx, int index) {
                                return Center(
                                  child: Button(
                                    color:
                                        controller.selectedIndex.value == index
                                            ? Colors.blue
                                            : Colors.white,
                                    textColor:
                                        controller.selectedIndex.value == index
                                            ? Colors.white
                                            : AppColor.globalDefaultColor,
                                    radius: 50,
                                    width: 150,
                                    height: 40,
                                    textSize:
                                        SizeConfig.screenWidth * 0.02 <= 13
                                            ? 12
                                            : 10,
                                    onTap: () {
                                      controller.animateToSelectedIndex(index);
                                      // controller.departmentModel.value!.data!.department![index].selected = true;
                                      controller.departmentModel.refresh();
                                      controller.selectedIndex.value = index;
                                      controller.haveSubFun(index);
                                    },
                                    text: controller.departmentModel.value!
                                        .data!.department![index].name!,
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                            ),
                          );
                  }),
                ),
                Obx(() => controller.haveSub.value
                    ? SizedBox(
                        height: 50,
                        child: ListView.separated(
                          controller: controller.subCatScrollController,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          clipBehavior: Clip.hardEdge,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: controller
                              .departmentModel
                              .value!
                              .data!
                              .department![controller.index.value]
                              .subDepartment!
                              .length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return Obx(() {
                              return Center(
                                child: Button(
                                  color:
                                      controller.selectedSubIndex.value == index
                                          ? AppColor.globalDefaultColor
                                          : Colors.white,
                                  textColor:
                                      controller.selectedSubIndex.value == index
                                          ? Colors.white
                                          : AppColor.globalDefaultColor,
                                  radius: 50,
                                  width: 150,
                                  height: 40,
                                  textSize: SizeConfig.screenWidth * 0.02 <= 13
                                      ? 12
                                      : 10,
                                  onTap: () async {
                                    controller.animateToSelectedSubIndex(index);
                                    controller.selectedSubIndex.value = index;
                                    controller.clickedMainDep.value = true;
                                    await controller.getAllProductUsingCategory(
                                        controller
                                            .departmentModel
                                            .value!
                                            .data!
                                            .department![controller.index.value]
                                            .subDepartment![index]
                                            .id!);
                                  },
                                  text: controller
                                      .departmentModel
                                      .value!
                                      .data!
                                      .department![controller.index.value]
                                      .subDepartment![index]
                                      .name!,
                                ),
                              );
                            });
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 10,
                            );
                          },
                        ),
                      )
                    : Container())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
