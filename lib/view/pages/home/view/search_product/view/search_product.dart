import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/res/assets_res.dart';
import 'package:meta_shop/view/components/component/headerWidget/header_widget.dart';
import 'package:meta_shop/view/components/component/productPage/product_page.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/constants/actions/add_to_cart.dart';
import 'package:meta_shop/view/components/constants/actions/add_to_fav.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:meta_shop/view/pages/home/view/search_product/controller/search_product_controller.dart';
import 'package:meta_shop/view/pages/new/controller/new_product_item.dart';

class SearchProduct extends GetWidget<SearchProductController> {
  const SearchProduct({Key? key}) : super(key: key);

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
          Obx(() {
            return controller.allProductModel.value == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.only(
                      top: 90,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
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
                                                  borderRadius:
                                                      BorderRadius.all(
                                                Radius.circular(50),
                                              )),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 0.4,
                                                color:
                                                    AppColor.globalBorderColor,
                                              ),
                                              gapPadding: 0,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50)),
                                            ),
                                            border: const OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(width: 0.4),
                                              gapPadding: 0,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(50.0),
                                              ),
                                            ),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 0.4,
                                                color:
                                                    AppColor.globalBorderColor,
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
                                        onChanged: (value) async {
                                          await controller.getAllProduct(
                                              key: value);
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
                        Expanded(
                          child: GridView.builder(
                            physics: const ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 24,
                              right: 15,
                              left: 15,
                            ),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 310,
                              childAspectRatio: 2 / 4.5,
                              crossAxisSpacing: 15,
                            ),
                            itemCount:
                                controller.allProductModel.value!.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return NewProductsItem(
                                fav: controller
                                    .allProductModel.value!.data![index].fav,
                                onTap: () {
                                  Get.to(
                                    const ProductPage(),
                                    arguments: controller.allProductModel.value!
                                        .data![index].pid,
                                  );
                                },
                                image: controller
                                    .allProductModel.value!.data![index].images,
                                catName: '',
                                itemName: controller
                                    .allProductModel.value!.data![index].title,
                                price: controller
                                    .allProductModel.value!.data![index].price,
                                onPressedAddButton: () {
                                  addToCart(
                                    vId: controller.allProductModel.value!
                                        .data![index].vid!,
                                    price: controller.allProductModel.value!
                                        .data![index].price!,
                                    httpRepository: controller.httpRepository,
                                    cacheUtils: controller.cacheUtils,
                                  );
                                },
                                onPressedFavButton: () {
                                  controller.allProductModel.value!.data![index]
                                              .fav ==
                                          0
                                      ? {
                                          controller.allProductModel.value!
                                              .data![index].fav = 1,
                                          controller.allProductModel.refresh(),
                                          addToFavorite(
                                            cacheUtils: controller.cacheUtils,
                                            httpRepository:
                                                controller.httpRepository,
                                            productId: controller
                                                .allProductModel
                                                .value!
                                                .data![index]
                                                .pid,
                                          ),
                                        }
                                      : {
                                          controller.allProductModel.value!
                                              .data![index].fav = 0,
                                          controller.allProductModel.refresh(),
                                          addToFavorite(
                                            cacheUtils: controller.cacheUtils,
                                            httpRepository:
                                                controller.httpRepository,
                                            productId: controller
                                                .allProductModel
                                                .value!
                                                .data![index]
                                                .pid,
                                          ),
                                        };
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
          }),
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
