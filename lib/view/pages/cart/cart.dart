import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/res/assets_res.dart';
import 'package:meta_shop/view/components/component/button/button/button.dart';
import 'package:meta_shop/view/components/component/headerWidget/header_widget.dart';
import 'package:meta_shop/view/components/component/items/itemCart/item_cart.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/component/text_filed/text_form_filed_widget.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';

import '../detailedOrders/detailed_order.dart';
import 'controller/cart_controller.dart';

class Cart extends GetWidget<CartController> {
  const Cart({Key? key}) : super(key: key);

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
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 65,
                  right: 10,
                  left: 10,
                  bottom: 30,
                ),
                child: Obx(() {
                  return controller.currentCartModel.value == null ||
                          controller.currentCartModel.value!.msg!.status == 0
                      ? Container()
                      : SizedBox(
                          height: SizeConfig.screenHeight -
                              (SizeConfig.screenHeight * 0.35),
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            clipBehavior: Clip.hardEdge,
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.only(
                              right: 5,
                              left: 5,
                              top: 10,
                              bottom: 20,
                            ),
                            shrinkWrap: true,
                            itemCount: controller
                                .currentCartModel.value!.data!.items!.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Obx(() {
                                  return ItemCart(
                                    buttonColor: AppColor.globalDefaultColor,
                                    countColor: AppColor.globalDefaultColor,
                                    progressColor: AppColor.globalDefaultColor,
                                    itemName: controller.currentCartModel.value!
                                        .data!.items![index].title,
                                    itemPrice: controller.currentCartModel
                                        .value!.data!.items![index].unitPrice,
                                    itemImage: controller.currentCartModel
                                        .value!.data!.items![index].image,
                                    onChange: (int vale) {
                                      if (vale <= 0) {
                                        controller.deleteItemFromCart(
                                          orderItemId: controller
                                              .currentCartModel
                                              .value!
                                              .data!
                                              .items![index]
                                              .orderItemId,
                                        );
                                      } else {
                                        controller.updateQuantityCart(
                                          quantity: vale.toString(),
                                          orderItemId: controller
                                              .currentCartModel
                                              .value!
                                              .data!
                                              .items![index]
                                              .orderItemId,
                                          orderId: controller.currentCartModel
                                              .value!.data!.orderId,
                                        );
                                      }
                                    },
                                    counterValue: controller.currentCartModel
                                        .value!.data!.items![index].quantity,
                                    onPressed: () {
                                      controller.deleteItemFromCart(
                                        orderItemId: controller
                                            .currentCartModel
                                            .value!
                                            .data!
                                            .items![index]
                                            .orderItemId,
                                      );
                                    },
                                  );
                                }),
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
              title: 'cart'.tr,
              onPressed: () {
                Get.back();
              },
              haveNotification: false,
            ),
            Obx(
              () => controller.currentCartModel.value == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : controller.currentCartModel.value!.msg!.status == 0
                      ? Center(
                          child: Text(
                            'cart_is_empty'.tr,
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ),
                        )
                      : Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: SizeConfig.screenHeight -
                                (SizeConfig.screenHeight * 0.440) -
                                260,
                            width: SizeConfig.screenWidth,
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
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Expanded(
                                //   child: Row(
                                //     crossAxisAlignment:
                                //         CrossAxisAlignment.center,
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       Expanded(
                                //         child: Text(
                                //           'subtotal'.tr,
                                //           textAlign: TextAlign.center,
                                //         ),
                                //       ),
                                //       Obx(() {
                                //         return Expanded(
                                //           child: Text(
                                //               '${controller.currentCartModel.value!.data!.totalOrderPrice} JOD',
                                //               textAlign: TextAlign.center),
                                //         );
                                //       }),
                                //     ],
                                //   ),
                                // ),
                                // const Divider(),
                                // Expanded(
                                //   child: Row(
                                //     crossAxisAlignment:
                                //         CrossAxisAlignment.center,
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       Expanded(
                                //         child: Text('shipping_price'.tr,
                                //             textAlign: TextAlign.center),
                                //       ),
                                //       Expanded(
                                //         child: Text(
                                //             '${controller.getShippingPrice()} JOD',
                                //             textAlign: TextAlign.center),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // const Divider(),
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'total'.tr,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Obx(() {
                                        return Expanded(
                                          child: Text(
                                            '${controller.currentCartModel.value!.data!.totalOrderPriceAfter} JOD',
                                            textAlign: TextAlign.center,
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                ),

                                const Divider(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 10,
                                    top: 5,
                                    right: 10,
                                    left: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Button(
                                          width: 180,
                                          height: 42,
                                          radius: 50,
                                          text: 'process_completed'.tr,
                                          onTap: () {
                                            Get.to(
                                              const DetailedOrder(),
                                              arguments: controller
                                                  .currentCartModel.value,
                                            )?.then((value) =>
                                                controller.getCurrentCart());
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: DefaultFormField(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    actions: [
                                                      Row(
                                                        children: [
                                                          controller
                                                                  .promoController
                                                                  .text
                                                                  .isEmpty
                                                              ? Expanded(
                                                                  child: Button(
                                                                    radius: 15,
                                                                    height: 45,
                                                                    width: 150,
                                                                    onTap: () {
                                                                      controller
                                                                          .applyPromo();
                                                                    },
                                                                    text:
                                                                        'apply'
                                                                            .tr,
                                                                  ),
                                                                )
                                                              : Expanded(
                                                                  child: Button(
                                                                    radius: 15,
                                                                    height: 45,
                                                                    width: 150,
                                                                    onTap: () {
                                                                      controller
                                                                          .removePromo();
                                                                    },
                                                                    text:
                                                                        'remove'
                                                                            .tr,
                                                                  ),
                                                                ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Expanded(
                                                            child: Button(
                                                              radius: 15,
                                                              onTap: () {
                                                                Get.back();
                                                              },
                                                              text: 'cancel'.tr,
                                                              height: 45,
                                                              width: 150,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                    title: Text(
                                                      style: const TextStyle(
                                                        color: AppColor
                                                            .globalDefaultColor,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      'enter_promo_code'.tr,
                                                    ),
                                                    titleTextStyle:
                                                        const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            fontSize: 20),
                                                    backgroundColor:
                                                        Colors.white,
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                    content: SizedBox(
                                                      height: 50,
                                                      child:
                                                          SingleChildScrollView(
                                                        physics:
                                                            const ScrollPhysics(),
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            DefaultFormField(
                                                              prefixIconColor:
                                                                  AppColor
                                                                      .globalDefaultColor,
                                                              borderColors: AppColor
                                                                  .globalDefaultColor,
                                                              maxLines: 1,
                                                              isPassword: false,
                                                              controller: controller
                                                                  .promoController,
                                                              enabled: true,
                                                              prefixIcon: Icons
                                                                  .local_offer,
                                                              hint: 'promo_code'
                                                                  .tr,
                                                              hintStyle:
                                                                  const TextStyle(
                                                                color: AppColor
                                                                    .globalDefaultColor,
                                                              ),
                                                              readOnly: false,
                                                              radius: 15,
                                                              autofocus: false,
                                                              focusBorderColor:
                                                                  AppColor
                                                                      .globalDefaultColor,
                                                              textColor: AppColor
                                                                  .globalDefaultColor,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          borderColors:
                                              AppColor.globalDefaultColor,
                                          prefixIconColor:
                                              AppColor.globalDefaultColor,
                                          maxLines: 1,
                                          controller:
                                              controller.promoController,
                                          isPassword: false,
                                          enabled: true,
                                          prefixIcon: Icons.local_offer,
                                          hint: 'promo_code'.tr,
                                          hintStyle: const TextStyle(
                                            color: AppColor.globalDefaultColor,
                                          ),
                                          readOnly: true,
                                          radius: 50,
                                          autofocus: false,
                                          focusBorderColor:
                                              AppColor.globalDefaultColor,
                                          textColor:
                                              AppColor.globalDefaultColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
            ),
          ],
        ),
      )),
    );
  }
}
