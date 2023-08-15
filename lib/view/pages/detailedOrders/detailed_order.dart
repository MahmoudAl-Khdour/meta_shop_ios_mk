import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/model/countries_model.dart';
import 'package:meta_shop/res/assets_res.dart';
import 'package:meta_shop/view/components/component/button/button/button.dart';
import 'package:meta_shop/view/components/component/drop_down/drop_down.dart';
import 'package:meta_shop/view/components/component/headerWidget/header_widget.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/component/text_filed/text_form_filed_widget.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';

import 'controller/detailed_order_controller.dart';

class DetailedOrder extends GetWidget<DetailedOrderController> {
  const DetailedOrder({Key? key}) : super(key: key);

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
              Obx(() {
                return controller.countriesModel.value == null
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.globalDefaultColor,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(
                          top: 65,
                          right: 10,
                          left: 10,
                          bottom: 10,
                        ),
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 5,
                            right: 5,
                            bottom: 40,
                          ),
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25)),
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
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 20,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'delivery_Locations'.tr,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Obx(() {
                                      return controller.myDefaultAddressModel
                                                  .value ==
                                              null
                                          ? const CircularProgressIndicator()
                                          : controller.myDefaultAddressModel
                                                  .value!.data!.isEmpty
                                              ? ListTile(
                                                  title: Text(
                                                      'no_address_added'.tr),
                                                  subtitle: Text(
                                                    'no_address_added'.tr,
                                                  ),
                                                  trailing: const Icon(
                                                    Icons.check,
                                                    color: AppColor
                                                        .globalDefaultColor,
                                                  ),
                                                )
                                              : ListTile(
                                                  title: Text(controller
                                                                  .myDefaultAddressModel
                                                                  .value!
                                                                  .data![0]
                                                                  .fullAddress!
                                                                  .givenName ==
                                                              null ||
                                                          controller
                                                              .myDefaultAddressModel
                                                              .value!
                                                              .data![0]
                                                              .fullAddress!
                                                              .givenName!
                                                              .isEmpty
                                                      ? ''
                                                      : ' ${controller.myDefaultAddressModel.value!.data![0].fullAddress!.givenName!}'),
                                                  subtitle: Text(
                                                    controller
                                                                .myDefaultAddressModel
                                                                .value!
                                                                .data![0]
                                                                .fullAddress!
                                                                .locality!
                                                                .isEmpty ||
                                                            controller
                                                                .myDefaultAddressModel
                                                                .value!
                                                                .data![0]
                                                                .fullAddress!
                                                                .addressLine1!
                                                                .isEmpty
                                                        ? ''
                                                        : '${controller.myDefaultAddressModel.value!.data![0].fullAddress!.locality} / ${controller.myDefaultAddressModel.value!.data![0].fullAddress!.addressLine1}',
                                                  ),
                                                  trailing: const Icon(
                                                    Icons.check,
                                                    color: AppColor
                                                        .globalDefaultColor,
                                                  ),
                                                );
                                    }),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Divider(
                                      height: 1,
                                      color: Colors.blue.withOpacity(0.5),
                                      endIndent: 25,
                                      indent: 25,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Obx(() {
                                      return controller.countriesModel.value ==
                                              null
                                          ? Container()
                                          : Center(
                                              child: WillPopScope(
                                                onWillPop: () async {
                                                  if (controller
                                                      .countriesController
                                                      .isOpen) {
                                                    controller
                                                        .countriesController
                                                        .close();
                                                    return Future.value(false);
                                                  } else {
                                                    return Future.value(true);
                                                  }
                                                },
                                                child: CustomDropDown(
                                                  dropdownController: controller
                                                      .countriesController,
                                                  items: controller
                                                      .countriesModel
                                                      .value!
                                                      .data!
                                                      .map((e) {
                                                    return {e.tid!: e.name!};
                                                  }).toList(),
                                                  screenWidth:
                                                      SizeConfig.screenWidth,
                                                  haveAnother: false,
                                                  numberItem: 4.2,
                                                  placeholder: 'Country'.tr,
                                                  paddingWidth: 20,
                                                  itemWidth:
                                                      SizeConfig.screenWidth,
                                                  radius: 35,
                                                  colorItem: Colors.white,
                                                  placeHolderStyle:
                                                      const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 16,
                                                  ),
                                                  onChange: (int value) {
                                                    DataCountries foundCountry =
                                                        controller
                                                            .countriesModel
                                                            .value!
                                                            .data!
                                                            .firstWhere(
                                                                (country) =>
                                                                    country
                                                                        .tid ==
                                                                    value);

                                                    controller.countryId.value =
                                                        value;

                                                    controller
                                                        .countryShippingPrice
                                                        .value = foundCountry
                                                            .deliveryPrice ??
                                                        '';
                                                    controller
                                                        .countriesController
                                                        .close();
                                                  },
                                                ),
                                              ),
                                            );
                                    }),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Divider(
                                      height: 1,
                                      color: Colors.blue.withOpacity(0.5),
                                      endIndent: 25,
                                      indent: 25,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ListTile(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('add_address'.tr),
                                                titleTextStyle: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20),
                                                backgroundColor: Colors.white,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                content: SingleChildScrollView(
                                                  child: SizedBox(
                                                    height: SizeConfig
                                                            .screenHeight *
                                                        0.38,
                                                    width:
                                                        SizeConfig.screenWidth *
                                                            0.38,
                                                    child: Form(
                                                      key:
                                                          controller.addFormKey,
                                                      child: ListView(
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        physics:
                                                            const ScrollPhysics(),
                                                        children: [
                                                          DefaultFormField(
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return 'name_is_required'
                                                                    .tr;
                                                              }
                                                              return null;
                                                            },
                                                            controller: controller
                                                                .nameAddController,
                                                            hint:
                                                                'user_name'.tr,
                                                            isPassword: false,
                                                            enabled: true,
                                                            readOnly: false,
                                                            radius: 15,
                                                            autofocus: false,
                                                            focusBorderColor:
                                                                AppColor
                                                                    .globalDefaultColor,
                                                            textColor: AppColor
                                                                .globalDefaultColor,
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          DefaultFormField(
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return 'name_is_required'
                                                                    .tr;
                                                              }
                                                              return null;
                                                            },
                                                            controller: controller
                                                                .familyNameAddController,
                                                            hint: 'family_name'
                                                                .tr,
                                                            isPassword: false,
                                                            enabled: true,
                                                            readOnly: false,
                                                            radius: 15,
                                                            autofocus: false,
                                                            focusBorderColor:
                                                                AppColor
                                                                    .globalDefaultColor,
                                                            textColor: AppColor
                                                                .globalDefaultColor,
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          DefaultFormField(
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return 'locality_is_required'
                                                                    .tr;
                                                              }
                                                              return null;
                                                            },
                                                            controller: controller
                                                                .localityAddController,
                                                            hint: 'locality'.tr,
                                                            isPassword: false,
                                                            enabled: true,
                                                            readOnly: false,
                                                            radius: 15,
                                                            autofocus: false,
                                                            focusBorderColor:
                                                                AppColor
                                                                    .globalDefaultColor,
                                                            textColor: AppColor
                                                                .globalDefaultColor,
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          DefaultFormField(
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return 'name_street_is_required'
                                                                    .tr;
                                                              }
                                                              return null;
                                                            },
                                                            controller: controller
                                                                .addressLineAddController,
                                                            hint: 'name_street'
                                                                .tr,
                                                            isPassword: false,
                                                            enabled: true,
                                                            readOnly: false,
                                                            radius: 15,
                                                            autofocus: false,
                                                            focusBorderColor:
                                                                AppColor
                                                                    .globalDefaultColor,
                                                            textColor: AppColor
                                                                .globalDefaultColor,
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Button(
                                                            height: 50,
                                                            width: SizeConfig
                                                                    .screenWidth *
                                                                0.8,
                                                            radius: 15,
                                                            onTap: () {
                                                              if (controller
                                                                  .addFormKey
                                                                  .currentState!
                                                                  .validate()) {
                                                                controller
                                                                    .addAddress(
                                                                  familyName:
                                                                      controller
                                                                          .familyNameAddController
                                                                          .text,
                                                                  locality:
                                                                      controller
                                                                          .localityAddController
                                                                          .text,
                                                                  givenName:
                                                                      controller
                                                                          .nameAddController
                                                                          .text,
                                                                  addressLine:
                                                                      controller
                                                                          .addressLineAddController
                                                                          .text,
                                                                );
                                                                Navigator.pop(
                                                                    context);
                                                              }
                                                            },
                                                            text: 'add'.tr,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      title: Text('add_address'.tr),
                                      trailing: const Icon(
                                        Icons.add,
                                        color: AppColor.globalDefaultColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 15,
                                        right: 15,
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    right: 20.0),
                                                child: Divider(
                                                  color: Colors.blue
                                                      .withOpacity(0.5),
                                                  height: 36,
                                                )),
                                          ),
                                          Text(
                                            'or'.tr,
                                            style: TextStyle(
                                              color:
                                                  Colors.blue.withOpacity(0.5),
                                              fontSize: 13,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 20.0),
                                                child: Divider(
                                                  color: Colors.blue
                                                      .withOpacity(0.5),
                                                  height: 36,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ListTile(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                  'choose_address'.tr,
                                                ),
                                                titleTextStyle: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20),
                                                backgroundColor: Colors.white,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                content: controller.addressModel
                                                                .value!.data ==
                                                            null ||
                                                        controller
                                                            .addressModel
                                                            .value!
                                                            .data!
                                                            .isEmpty
                                                    ? SizedBox(
                                                        height: SizeConfig
                                                                .screenHeight *
                                                            0.38,
                                                        width: SizeConfig
                                                                .screenWidth *
                                                            0.38,
                                                        child: Text(
                                                          'there_no_address'.tr,
                                                          style: TextStyle(
                                                            color: AppColor
                                                                .globalDefaultColor
                                                                .withOpacity(
                                                                    0.4),
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      )
                                                    : SizedBox(
                                                        height: SizeConfig
                                                                .screenHeight *
                                                            0.45,
                                                        width: SizeConfig
                                                                .screenWidth *
                                                            0.38,
                                                        child:
                                                            ListView.separated(
                                                          physics:
                                                              const ScrollPhysics(),
                                                          clipBehavior:
                                                              Clip.hardEdge,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          shrinkWrap: true,
                                                          itemCount: controller
                                                              .addressModel
                                                              .value!
                                                              .data!
                                                              .length,
                                                          itemBuilder:
                                                              (BuildContext ctx,
                                                                  index) {
                                                            return Obx(() {
                                                              return Row(
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        ListTile(
                                                                      onTap:
                                                                          () {
                                                                        controller.addAddressASDefault(controller
                                                                            .addressModel
                                                                            .value!
                                                                            .data![index]
                                                                            .profileId!);

                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      title: Text(controller
                                                                          .addressModel
                                                                          .value!
                                                                          .data![
                                                                              index]
                                                                          .fullAddress!
                                                                          .givenName!),
                                                                      subtitle:
                                                                          Text(
                                                                        controller.addressModel.value!.data![index].fullAddress!.locality!.isEmpty ||
                                                                                controller.addressModel.value!.data![index].fullAddress!.addressLine1!.isEmpty
                                                                            ? ''
                                                                            : '${controller.addressModel.value!.data![index].fullAddress!.locality} / ${controller.addressModel.value!.data![index].fullAddress!.addressLine1}',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            });
                                                          },
                                                          separatorBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return const SizedBox(
                                                              width: 15,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                              );
                                            });
                                      },
                                      title: Text('choose_address'.tr),
                                      trailing: const Icon(
                                        Icons.arrow_drop_down,
                                        color: AppColor.globalDefaultColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
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
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 20,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'order_detailed'.tr,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ListView.separated(
                                      physics: const ScrollPhysics(),
                                      clipBehavior: Clip.hardEdge,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: controller.currentCartModel
                                          .value!.data!.items!.length,
                                      separatorBuilder: (context, index) =>
                                          Divider(
                                        height: 1,
                                        indent: 30,
                                        endIndent:
                                            SizeConfig.screenWidth * 0.08,
                                        color: AppColor.globalDefaultColor
                                            .withOpacity(0.5),
                                      ),
                                      itemBuilder: (BuildContext ctx, index) {
                                        return Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '${controller.currentCartModel.value!.data!.items![index].quantity}x',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                controller
                                                    .currentCartModel
                                                    .value!
                                                    .data!
                                                    .items![index]
                                                    .title!,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${controller.currentCartModel.value!.data!.items![index].totalUnitPrice} JD',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    Divider(
                                      color: AppColor.globalDefaultColor
                                          .withOpacity(0.5),
                                    ),
                                    ListTile(
                                      title: Text(
                                        'total'.tr,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      trailing: Text(
                                        '${controller.currentCartModel.value!.data!.totalOrderPriceAfter}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        'shipping_price'.tr,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      trailing: Text(
                                        controller.countryId.value == -1
                                            ? '0 JOD'
                                            : controller
                                                .countryShippingPrice.value,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        'Total Price with Shipping'.tr,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      trailing: Text(
                                        // price.toString() ??
                                        controller.countryId.value == -1
                                            ? '0 JOD'
                                            : '${controller.totalPrice(totalOrderPriceAfter: controller.currentCartModel.value!.data!.totalOrderPriceAfter!, countryShippingPrice: controller.countryShippingPrice.value)}JOD',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Button(
                              height: 50,
                              radius: 25,
                              onTap: () {
                                if (controller.haveDefault.value) {
                                  if (controller.countryId.value > -1) {
                                    Future.delayed(
                                        const Duration(milliseconds: 500));
                                    controller.checkOUT(
                                      orderId: controller.currentCartModel
                                          .value!.data!.orderId!,
                                      countryId:
                                          controller.countryId.value.toString(),
                                    );
                                  } else {
                                    Get.snackbar(
                                      'order_confirmation'.tr,
                                      'Please enter country'.tr,
                                      icon: const Icon(
                                        Icons.error,
                                        color: Colors.white,
                                      ),
                                      snackPosition: SnackPosition.TOP,
                                      backgroundColor: AppColor
                                          .globalDefaultColor
                                          .withOpacity(0.9),
                                      borderRadius: 15,
                                      margin: const EdgeInsets.all(15),
                                      padding: const EdgeInsets.all(15),
                                      colorText: Colors.white,
                                      duration: const Duration(seconds: 4),
                                      isDismissible: true,
                                      dismissDirection:
                                          DismissDirection.vertical,
                                      forwardAnimationCurve: Curves.easeOutBack,
                                    );
                                  }
                                } else {
                                  Get.snackbar(
                                    'Make it default'.tr,
                                    'Please check from choose location then try it'
                                        .tr,
                                    icon: const Icon(
                                      Icons.error,
                                      color: Colors.white,
                                    ),
                                    snackPosition: SnackPosition.TOP,
                                    backgroundColor: AppColor.globalDefaultColor
                                        .withOpacity(0.9),
                                    borderRadius: 15,
                                    margin: const EdgeInsets.all(15),
                                    padding: const EdgeInsets.all(15),
                                    colorText: Colors.white,
                                    duration: const Duration(seconds: 4),
                                    isDismissible: true,
                                    dismissDirection: DismissDirection.vertical,
                                    forwardAnimationCurve: Curves.easeOutBack,
                                  );
                                }
                              },
                              text: 'order_confirmation'.tr,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      );
              }),
              HeaderWidget(
                numberCartItem: 0,
                haveBack: false,
                title: 'order_detailed'.tr,
                onPressed: () {
                  Get.back();
                },
                haveNotification: false,
              ),
            ],
          )),
    ));
  }
}
