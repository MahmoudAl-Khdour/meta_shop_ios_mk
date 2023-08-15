import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/view/components/component/button/counterButton/counter_button_style_2/counter_button_style_2.dart';
import 'package:meta_shop/view/components/component/productPage/product_page.dart';
import 'package:meta_shop/view/components/constants/actions/add_to_cart.dart';
import 'package:meta_shop/view/components/constants/actions/add_to_fav.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:shimmer/shimmer.dart';

import 'controller/offer_controller.dart';
import 'item_offer.dart';

class Offers extends GetWidget<OfferController> {
  const Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 66,
      ),
      child: RefreshIndicator(
        backgroundColor: AppColor.globalDefaultColor,
        color: Colors.white,
        onRefresh: () async {
          controller.offerModel.value = null;
          Future.delayed(const Duration(milliseconds: 500), () {
            controller.onInit();
          });
        },
        child: Obx(() {
          return controller.offerModel.value == null
              ? GridView.builder(
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                    bottom: 24,
                    left: 15,
                    right: 15,
                  ),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
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
              : controller.offerModel.value!.data!.isEmpty
                  ? Center(
                      child: Text(
                        'There is no products'.tr,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.grey.withOpacity(0.4),
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
                      itemCount: controller.offerModel.value!.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemOffer(
                          button: CounterButtonStyle2(
                            count: controller
                                    .offerModel.value!.data![index].count ??
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
                                    .offerModel.value!.data![index].counti = 1;
                                controller.offerModel.refresh();
                              } else {
                                controller.offerModel.value!.data![index]
                                    .counti = value;
                                controller.offerModel.refresh();
                              }
                            },
                            loading: false,
                          ),
                          discountPercentage:
                              controller.calculateDiscountPercentage(
                                  double.parse(controller
                                      .offerModel.value!.data![index].price!),
                                  double.parse(controller.offerModel.value!
                                      .data![index].afterDiscount!)),
                          icon:
                              controller.offerModel.value!.data![index].fav == 1
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                          iconColor:
                              controller.offerModel.value!.data![index].fav == 1
                                  ? Colors.red
                                  : Colors.black,
                          onTap: () {
                            Get.to(
                              const ProductPage(),
                              arguments:
                                  controller.offerModel.value!.data![index].pid,
                            );
                          },
                          image:
                              controller.offerModel.value!.data![index].images,
                          catName: controller.offerModel.value!.data![index]
                                  .catagoryName ??
                              '',
                          itemName:
                              controller.offerModel.value!.data![index].title,
                          price:
                              controller.offerModel.value!.data![index].price,
                          onPressedAddButton: () {
                            addToCart(
                              quantity: controller
                                  .offerModel.value!.data![index].count
                                  .toString(),
                              vId: controller
                                  .offerModel.value!.data![index].vid!,
                              price: controller
                                  .offerModel.value!.data![index].price!,
                              cacheUtils: controller.cacheUtils,
                              httpRepository: controller.httpRepository,
                            );
                          },
                          onPressedFavButton: () {
                            controller.offerModel.value!.data![index].fav == 0
                                ? {
                                    controller
                                        .offerModel.value!.data![index].fav = 1,
                                    controller.offerModel.refresh(),
                                    addToFavorite(
                                      cacheUtils: controller.cacheUtils,
                                      httpRepository: controller.httpRepository,
                                      productId: controller
                                          .offerModel.value!.data![index].pid,
                                    ),
                                  }
                                : {
                                    controller
                                        .offerModel.value!.data![index].fav = 0,
                                    controller.offerModel.refresh(),
                                    addToFavorite(
                                      cacheUtils: controller.cacheUtils,
                                      httpRepository: controller.httpRepository,
                                      productId: controller
                                          .offerModel.value!.data![index].pid,
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
