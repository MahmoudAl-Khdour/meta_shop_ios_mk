import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/res/assets_res.dart';
import 'package:meta_shop/view/components/component/headerWidget/header_widget.dart';
import 'package:meta_shop/view/components/component/productPage/product_page.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/constants/actions/add_to_cart.dart';
import 'package:meta_shop/view/components/constants/actions/add_to_fav.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:meta_shop/view/pages/new/controller/new_product_item.dart';
import 'package:meta_shop/view/pages/new/controller/new_products_controller.dart';
import 'package:shimmer/shimmer.dart';

class AllNewProducts extends GetWidget<NewProductsController> {
  const AllNewProducts({Key? key}) : super(key: key);

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
                                    bottom: 24,
                                    left: 10,
                                    right: 10,
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
                        : controller.newProductsModel.value!.data!.isEmpty
                            ? Center(
                                child: Text(
                                  'No elements in new products'.tr,
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
                                itemCount: controller
                                    .newProductsModel.value!.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  controller.index.value = index;
                                  controller.productId.value = controller
                                      .newProductsModel.value!.data![index].pid;
                                  return NewProductsItem(
                                    fav: controller.newProductsModel.value!
                                        .data![index].fav,
                                    onTap: () {
                                      Get.to(
                                        const ProductPage(),
                                        arguments: controller.newProductsModel
                                            .value!.data![index].pid,
                                      );
                                    },
                                    image: controller.newProductsModel.value!
                                        .data![index].images,
                                    catName: controller.newProductsModel.value!
                                        .data![index].catagoryName,
                                    itemName: controller.newProductsModel.value!
                                        .data![index].title,
                                    price: controller.newProductsModel.value!
                                        .data![index].price,
                                    onPressedAddButton: () {
                                      addToCart(
                                        vId: controller.newProductsModel.value!
                                            .data![index].vid!,
                                        price: controller.newProductsModel
                                            .value!.data![index].price!,
                                        cacheUtils: controller.cacheUtils,
                                        httpRepository:
                                            controller.httpRepository,
                                      );
                                    },
                                    onPressedFavButton: () {
                                      controller.newProductsModel.value!
                                                  .data![index].fav ==
                                              0
                                          ? {
                                              controller.newProductsModel.value!
                                                  .data![index].fav = 1,
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
                                              controller.newProductsModel.value!
                                                  .data![index].fav = 0,
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
                              );
                  }),
                ),
              ),
              HeaderWidget(
                numberCartItem: 0,
                haveBack: false,
                title: 'new_products'.tr,
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
