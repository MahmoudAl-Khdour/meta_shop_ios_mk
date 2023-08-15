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

import 'controller/search_controller.dart';

class SearchPage extends GetWidget<SearchMetaController> {
  const SearchPage({Key? key}) : super(key: key);

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
              top: 90,
              right: 20,
              left: 20,
            ),
            child: Stack(
              children: [
                // before edit
                Obx(() {
                  return controller.usingFilter.value
                      ? controller.selectedProducts.isEmpty
                          ? const Align(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(
                                top: 50,
                              ),
                              child: GridView.builder(
                                controller: controller.scrollController,
                                physics: const ScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(
                                  bottom: 40,
                                  top: 20,
                                ),
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 300,
                                  childAspectRatio: 2 / 3.5,
                                  crossAxisSpacing: 10,
                                ),
                                itemCount: controller.selectedProducts.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return StoreItem(
                                    fav: controller.selectedProducts[index].fav,
                                    onTap: () {
                                      Get.to(
                                        const ProductPage(),
                                        arguments: controller
                                            .selectedProducts[index].pid,
                                      );
                                    },
                                    image: controller
                                        .selectedProducts[index].images,
                                    catName: '',
                                    itemName: controller
                                        .selectedProducts[index].title,
                                    price: controller
                                        .selectedProducts[index].price,
                                    onPressedAddButton: () {
                                      addToCart(
                                        vId: controller.products[index].vid!,
                                        price:
                                            controller.products[index].price!,
                                        cacheUtils: controller.cacheUtils,
                                        httpRepository:
                                            controller.httpRepository,
                                      );
                                    },
                                    onPressedFavButton: () {
                                      controller.selectedProducts[index].fav ==
                                              0
                                          ? {
                                              controller.selectedProducts[index]
                                                  .fav = 1,
                                              controller.selectedProducts
                                                  .refresh(),
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
                                              controller.selectedProducts[index]
                                                  .fav = 0,
                                              controller.selectedProducts
                                                  .refresh(),
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
                              ),
                            )
                      : controller.products.isEmpty
                          ? const Align(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(
                                top: 50,
                              ),
                              child: GridView.builder(
                                controller: controller.scrollController,
                                physics: const ScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(bottom: 24),
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 300,
                                  childAspectRatio: 2 / 3.5,
                                  crossAxisSpacing: 10,
                                ),
                                itemCount: controller.products.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return StoreItem(
                                    fav: controller.products[index].fav,
                                    onTap: () {
                                      Get.to(
                                        const ProductPage(),
                                        // ProductPage(
                                        //   pId: controller.products[index].pid!,
                                        // ),
                                        arguments:
                                            controller.products[index].pid,
                                      );
                                    },
                                    image: controller.products[index].images,
                                    catName: '',
                                    itemName: controller.products[index].title,
                                    price: controller.products[index].price,
                                    onPressedAddButton: () {
                                      addToCart(
                                        vId: controller.products[index].vid!,
                                        price:
                                            controller.products[index].price!,
                                        httpRepository:
                                            controller.httpRepository,
                                        cacheUtils: controller.cacheUtils,
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
                              ),
                            );
                }),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              TextField(
                                controller: controller.filterController,
                                onChanged: (value) {
                                  controller.mockFilter();
                                  controller.keyFilter.value = value;
                                  controller.filterBook(value);
                                },
                                decoration: InputDecoration(
                                    isDense: true,
                                    suffix: Container(
                                      width: 20,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      )),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 0.4,
                                        color: AppColor.globalBorderColor,
                                      ),
                                      gapPadding: 0,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(width: 0.4),
                                      gapPadding: 0,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50.0),
                                      ),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 0.4,
                                        color: AppColor.globalBorderColor,
                                      ),
                                      gapPadding: 0,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                    filled: true,
                                    hintStyle: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 13,
                                    ),
                                    hintText: 'what_looking'.tr,
                                    fillColor: Colors.white),
                                onTap: () {
                                  controller.filterController.text.isEmpty
                                      ? controller.usingFilter.value = false
                                      : controller.usingFilter.value = true;
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          HeaderWidget(
            numberCartItem: 0,
            haveBack: false,
            title: 'search_page'.tr,
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
