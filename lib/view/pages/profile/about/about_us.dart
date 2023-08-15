import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meta_shop/res/assets_res.dart';
import 'package:meta_shop/view/components/component/headerWidget/header_widget.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';

import 'controller/about_us_controller.dart';

class AboutUs extends GetWidget<AboutUsController> {
  const AboutUs({Key? key}) : super(key: key);

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
                child: SizedBox(
                  height: SizeConfig.screenHeight,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 20,
                      right: 20,
                      bottom: 40,
                    ),
                    children: [
                      Obx(() {
                        return Text(
                          controller.title.value,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        return Text(controller.aboutUs.value);
                      }),
                      const SizedBox(
                        height: 40,
                      ),
                      const Divider(
                        color: AppColor.globalDefaultColor,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  AssetsRes.CART,
                                  color: AppColor.globalDefaultColor,
                                  width: 50,
                                  height: 50,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  '+1000',
                                  style: TextStyle(
                                    color: AppColor.globalDefaultColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  AssetsRes.CUSTOMER_SERVICE,
                                  color: AppColor.globalDefaultColor,
                                  width: 50,
                                  height: 50,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  '+1000',
                                  style: TextStyle(
                                    color: AppColor.globalDefaultColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: AppColor.globalDefaultColor,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            'order_via_app'.tr,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.globalDefaultColor,
                            width: 0.4,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 30,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        const ImageIcon(
                                          AssetImage(
                                            AssetsRes.CATEGORY,
                                          ),
                                          size: 40,
                                          color: AppColor.globalDefaultColor,
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text('step_one'.tr,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  AppColor.globalDefaultColor,
                                            )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'choose_the_category'.tr,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: AppColor.globalDefaultColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 10,
                                    color: AppColor.globalDefaultColor,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        const ImageIcon(
                                          AssetImage(
                                            AssetsRes.PACKAGE,
                                          ),
                                          size: 40,
                                          color: AppColor.globalDefaultColor,
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text('step_two'.tr,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  AppColor.globalDefaultColor,
                                            )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text('choose_the_product'.tr,
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color:
                                                  AppColor.globalDefaultColor,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Divider(
                                color: AppColor.globalDefaultColor,
                                indent: 20,
                                endIndent: 20,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        const ImageIcon(
                                          AssetImage(
                                            AssetsRes.SECURE_PAYMENT,
                                          ),
                                          size: 40,
                                          color: AppColor.globalDefaultColor,
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text('step_three'.tr,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  AppColor.globalDefaultColor,
                                            )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text('choose_payment_method'.tr,
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color:
                                                  AppColor.globalDefaultColor,
                                            )),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        const ImageIcon(
                                          AssetImage(
                                            AssetsRes.DELIVERY_TRUCK,
                                          ),
                                          size: 40,
                                          color: AppColor.globalDefaultColor,
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text('step_forth'.tr,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  AppColor.globalDefaultColor,
                                            )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text('choose_method_receiving'.tr,
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color:
                                                  AppColor.globalDefaultColor,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              HeaderWidget(
                numberCartItem: 0,
                haveBack: false,
                title: 'about_us'.tr,
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
