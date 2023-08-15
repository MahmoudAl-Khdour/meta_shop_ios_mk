import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/res/assets_res.dart';
import 'package:meta_shop/view/components/component/button/button/button.dart';
import 'package:meta_shop/view/components/component/headerWidget/header_widget.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/component/text_filed/text_form_filed_widget.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:meta_shop/view/pages/home/controller/home_controller.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Filter extends GetWidget<HomeController> {
  const Filter({Key? key}) : super(key: key);

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
                  top: 70,
                  right: 20,
                  left: 20,
                  bottom: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Product Categories',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColor.globalDefaultColor,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        height: 50,
                        child: ListView.separated(
                          clipBehavior: Clip.hardEdge,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: controller.categoriesModel.value == null
                              ? 0
                              : controller.categoriesModel.value!.data!.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Center(
                              child: Button(
                                color: Colors.white,
                                textColor: Colors.black,
                                radius: 50,
                                width: 128,
                                height: 40,
                                textSize: SizeConfig.screenWidth * 0.02 <= 11
                                    ? 10
                                    : 10,
                                onTap: () {},
                                text: controller
                                    .categoriesModel.value!.data![index].name!,
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 15,
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Sort by price',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColor.globalDefaultColor,
                      ),
                    ),
                    Obx(() {
                      return SfSlider(
                        min: 1.0,
                        max: 1000.0,
                        value: controller.valueSlider.value,
                        interval: 1,
                        showTicks: false,
                        showLabels: false,
                        enableTooltip: true,
                        minorTicksPerInterval: 1,
                        onChanged: (value) {
                          controller.valueSlider.value = value;
                        },
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(right: 20.0),
                                child: Divider(
                                  color: Colors.blue.withOpacity(0.5),
                                  height: 36,
                                )),
                          ),
                          Text(
                            'OR',
                            style: TextStyle(
                              color: Colors.blue.withOpacity(0.5),
                              fontSize: 13,
                            ),
                          ),
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(left: 20.0),
                                child: Divider(
                                  color: Colors.blue.withOpacity(0.5),
                                  height: 36,
                                )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DefaultFormField(
                            isEmail: false,
                            hint: 'From',
                            hintStyle: const TextStyle(
                                color: AppColor.globalDefaultColor),
                            borderColors: AppColor.globalDefaultColor,
                            textColor: AppColor.globalDefaultColor,
                            isPassword: false,
                            radius: 50,
                            autofocus: false,
                            readOnly: false,
                            enabled: true,
                            maxLines: 1,
                            focusBorderColor: AppColor.globalDefaultColor,
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Expanded(
                          child: DefaultFormField(
                            isEmail: false,
                            hint: 'To',
                            hintStyle: const TextStyle(
                                color: AppColor.globalDefaultColor),
                            maxLines: 1,
                            textColor: AppColor.globalDefaultColor,
                            isPassword: false,
                            radius: 50,
                            autofocus: false,
                            readOnly: false,
                            enabled: true,
                            focusBorderColor: AppColor.globalDefaultColor,
                            borderColors: AppColor.globalDefaultColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Button(
                        radius: 50,
                        color: AppColor.globalDefaultColor,
                        textColor: Colors.white,
                        width: 250,
                        height: 50,
                        onTap: () {},
                        text: 'Search',
                      ),
                    )
                  ],
                ),
              ),
            ),
            HeaderWidget(
              numberCartItem: 0,
              haveBack: false,
              title: 'Filter',
              onPressed: () {
                Get.back();
              },
              haveNotification: false,
            ),
          ],
        ),
      ),
    ));
  }
}
