import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/view/components/component/button/counterButton/counter_button_style_2/counter_button_style_2.dart';
import 'package:meta_shop/view/components/component/productPage/product_page.dart';
import 'package:meta_shop/view/components/constants/actions/add_to_cart.dart';
import 'package:meta_shop/view/components/constants/actions/add_to_fav.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:shimmer/shimmer.dart';

import 'controller/new_product_item.dart';
import 'controller/new_products_controller.dart';

class NewProducts extends GetWidget<NewProductsController> {
  const NewProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 66,
      ),
      child: RefreshIndicator(
        onRefresh: () async {
          controller.newProductsModel.value = null;
          Future.delayed(const Duration(milliseconds: 500), () {
            controller.onInit();
          });
        },
        backgroundColor: AppColor.globalDefaultColor,
        color: Colors.white,
        child: Obx(() {
          return controller.newProductsModel.value == null
              ? GridView.builder(
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                    bottom: 24,
                  ),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 305,
                    childAspectRatio: 2 / 4.6,
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
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
              : controller.newProductsModel.value!.data!.isEmpty
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
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(
                        bottom: 24,
                        top: 10,
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
                          controller.newProductsModel.value!.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        controller.index.value = index;
                        controller.productId.value =
                            controller.newProductsModel.value!.data![index].pid;
                        return NewProductsItem(
                          button: CounterButtonStyle2(
                            count: controller.newProductsModel.value!
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
                                controller.newProductsModel.value!.data![index]
                                    .counti = 1;
                                controller.newProductsModel.refresh();
                              } else {
                                controller.newProductsModel.value!.data![index]
                                    .counti = value;
                                controller.newProductsModel.refresh();
                              }
                            },
                            loading: false,
                          ),
                          fav: controller
                              .newProductsModel.value!.data![index].fav,
                          onTap: () {
                            Get.to(
                              const ProductPage(),
                              arguments: controller
                                  .newProductsModel.value!.data![index].pid,
                            );
                          },
                          image: controller
                              .newProductsModel.value!.data![index].images,
                          catName: controller.newProductsModel.value!
                              .data![index].catagoryName,
                          itemName: controller
                              .newProductsModel.value!.data![index].title,
                          price: controller
                              .newProductsModel.value!.data![index].price,
                          onPressedAddButton: () {
                            addToCart(
                              quantity: controller
                                  .newProductsModel.value!.data![index].count
                                  .toString(),
                              vId: controller
                                  .newProductsModel.value!.data![index].vid!,
                              price: controller
                                  .newProductsModel.value!.data![index].price!,
                              cacheUtils: controller.cacheUtils,
                              httpRepository: controller.httpRepository,
                            );
                          },
                          onPressedFavButton: () {
                            controller.newProductsModel.value!.data![index]
                                        .fav ==
                                    0
                                ? {
                                    controller.newProductsModel.value!
                                        .data![index].fav = 1,
                                    controller.newProductsModel.refresh(),
                                    addToFavorite(
                                      cacheUtils: controller.cacheUtils,
                                      httpRepository: controller.httpRepository,
                                      productId: controller.newProductsModel
                                          .value!.data![index].pid,
                                    ),
                                  }
                                : {
                                    controller.newProductsModel.value!
                                        .data![index].fav = 0,
                                    controller.newProductsModel.refresh(),
                                    addToFavorite(
                                      cacheUtils: controller.cacheUtils,
                                      httpRepository: controller.httpRepository,
                                      productId: controller.newProductsModel
                                          .value!.data![index].pid,
                                    ),
                                  };
                          },
                        );
                      },
                    );
        }),
      ),
    );
  }
}
