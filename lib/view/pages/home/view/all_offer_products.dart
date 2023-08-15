import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/res/assets_res.dart';
import 'package:meta_shop/view/components/component/headerWidget/header_widget.dart';
import 'package:meta_shop/view/components/component/productPage/product_page.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/constants/actions/add_to_cart.dart';
import 'package:meta_shop/view/components/constants/actions/add_to_fav.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:meta_shop/view/pages/offer/controller/offer_controller.dart';
import 'package:meta_shop/view/pages/offer/item_offer.dart';
import 'package:shimmer/shimmer.dart';

class AllOfferProducts extends GetWidget<OfferController> {
  const AllOfferProducts({Key? key}) : super(key: key);

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
                    controller.offerModel.value = null;
                    Future.delayed(const Duration(milliseconds: 500), () {
                      controller.onInit();
                    });
                  },
                  backgroundColor: AppColor.globalDefaultColor,
                  color: Colors.white,
                  child: Obx(() {
                    return controller.offerModel.value == null
                        ? GridView.builder(
                            physics: const ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                              bottom: 24,
                              left: 10,
                              right: 10,
                              top: 5,
                            ),
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
                          )
                        : controller.offerModel.value!.data!.isEmpty
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
                                  left: 10,
                                  right: 10,
                                  top: 5,
                                ),
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 300,
                                  childAspectRatio: 2.5 / 4.3,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 5,
                                ),
                                itemCount:
                                    controller.offerModel.value!.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ItemOffer(
                                    discountPercentage:
                                        controller.calculateDiscountPercentage(
                                            double.parse(controller.offerModel
                                                .value!.data![index].price!),
                                            double.parse(controller
                                                .offerModel
                                                .value!
                                                .data![index]
                                                .afterDiscount!)),
                                    icon: controller.offerModel.value!
                                                .data![index].fav ==
                                            1
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    iconColor: controller.offerModel.value!
                                                .data![index].fav ==
                                            1
                                        ? Colors.red
                                        : Colors.black,
                                    onTap: () {
                                      Get.to(
                                        const ProductPage(),
                                        arguments: controller
                                            .offerModel.value!.data![index].pid,
                                      );
                                    },
                                    image: controller
                                        .offerModel.value!.data![index].images,
                                    catName: controller.offerModel.value!
                                            .data![index].catagoryName ??
                                        '',
                                    itemName: controller
                                        .offerModel.value!.data![index].title,
                                    price: controller
                                        .offerModel.value!.data![index].price,
                                    onPressedAddButton: () {
                                      addToCart(
                                        vId: controller.offerModel.value!
                                            .data![index].vid!,
                                        price: controller.offerModel.value!
                                            .data![index].price!,
                                        cacheUtils: controller.cacheUtils,
                                        httpRepository:
                                            controller.httpRepository,
                                      );
                                    },
                                    onPressedFavButton: () {
                                      controller.offerModel.value!.data![index]
                                                  .fav ==
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
                                                productId: controller.offerModel
                                                    .value!.data![index].pid,
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
                                                productId: controller.offerModel
                                                    .value!.data![index].pid,
                                              ),
                                            };
                                    },
                                  );
                                },
                              );
                  }),
                ),
              ),
              HeaderWidget(
                numberCartItem: 0,
                haveBack: false,
                title: 'offers'.tr,
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
