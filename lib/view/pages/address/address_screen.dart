import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/res/assets_res.dart';
import 'package:meta_shop/view/components/component/button/button/button.dart';
import 'package:meta_shop/view/components/component/headerWidget/header_widget.dart';
import 'package:meta_shop/view/components/component/items/item_address.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/component/text_filed/text_form_filed_widget.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:meta_shop/view/pages/address/controller/address_controller.dart';

import 'menu.dart';

class AddressScreen extends GetWidget<AddressController> {
  const AddressScreen({Key? key}) : super(key: key);

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
                  right: 15,
                  left: 15,
                  bottom: 20,
                ),
                child: SizedBox(
                  height: SizeConfig.screenHeight,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("add_address".tr),
                                    titleTextStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20),
                                    backgroundColor: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    content: SingleChildScrollView(
                                      child: SizedBox(
                                        height: SizeConfig.screenHeight * 0.45,
                                        width: SizeConfig.screenWidth * 0.40,
                                        child: Form(
                                          key: controller.addFormKey,
                                          child: ListView(
                                            scrollDirection: Axis.vertical,
                                            physics: const ScrollPhysics(),
                                            children: [
                                              DefaultFormField(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'name_is_required'
                                                        .tr;
                                                  }
                                                  return null;
                                                },
                                                controller: controller
                                                    .nameAddController,
                                                hint: 'user_name'.tr,
                                                isPassword: false,
                                                enabled: true,
                                                readOnly: false,
                                                radius: 15,
                                                autofocus: false,
                                                focusBorderColor:
                                                    AppColor.globalDefaultColor,
                                                textColor:
                                                    AppColor.globalDefaultColor,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              DefaultFormField(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'name_is_required'
                                                        .tr;
                                                  }
                                                  return null;
                                                },
                                                controller: controller
                                                    .familyNameAddController,
                                                hint: 'family_name'.tr,
                                                isPassword: false,
                                                enabled: true,
                                                readOnly: false,
                                                radius: 15,
                                                autofocus: false,
                                                focusBorderColor:
                                                    AppColor.globalDefaultColor,
                                                textColor:
                                                    AppColor.globalDefaultColor,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              DefaultFormField(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
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
                                                    AppColor.globalDefaultColor,
                                                textColor:
                                                    AppColor.globalDefaultColor,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              DefaultFormField(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'name_street_is_required'
                                                        .tr;
                                                  }
                                                  return null;
                                                },
                                                controller: controller
                                                    .addressLineAddController,
                                                hint: 'name_street'.tr,
                                                isPassword: false,
                                                enabled: true,
                                                readOnly: false,
                                                radius: 15,
                                                autofocus: false,
                                                focusBorderColor:
                                                    AppColor.globalDefaultColor,
                                                textColor:
                                                    AppColor.globalDefaultColor,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Button(
                                                height: 45,
                                                radius: 15,
                                                onTap: () {
                                                  if (controller
                                                      .addFormKey.currentState!
                                                      .validate()) {
                                                    controller.addAddress(
                                                      familyName: controller
                                                          .familyNameAddController
                                                          .text,
                                                      locality: controller
                                                          .localityAddController
                                                          .text,
                                                      givenName: controller
                                                          .nameAddController
                                                          .text,
                                                      addressLine: controller
                                                          .addressLineAddController
                                                          .text,
                                                    );
                                                    Navigator.pop(context);
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
                          leading: const Icon(Icons.add),
                        ),
                        const Divider(
                          indent: 10,
                          endIndent: 10,
                        ),
                        Obx(() {
                          return controller.addressModel.value == null
                              ? const Center(child: CircularProgressIndicator())
                              : ListView.separated(
                                  physics: const ScrollPhysics(),
                                  clipBehavior: Clip.hardEdge,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: controller
                                      .addressModel.value!.data!.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    controller.index.value = index;
                                    return Obx(() {
                                      return Row(
                                        children: [
                                          Expanded(
                                            child: ItemAddress(
                                              onSelected: (Menu item) {
                                                controller.selectedMenu.value =
                                                    item.name;
                                                controller.selectedMenu.value ==
                                                        'delete'
                                                    ? controller.deleteAddress(
                                                        controller
                                                            .addressModel
                                                            .value!
                                                            .data![index]
                                                            .profileId!)
                                                    : controller.selectedMenu
                                                                .value ==
                                                            'edit'
                                                        ? showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                  "Edit Address"
                                                                      .tr,
                                                                ),
                                                                titleTextStyle: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        20),
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                shape: const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(20))),
                                                                content:
                                                                    SizedBox(
                                                                  height: SizeConfig
                                                                          .screenHeight *
                                                                      0.45,
                                                                  width: SizeConfig
                                                                          .screenWidth *
                                                                      0.40,
                                                                  child: Form(
                                                                    key: controller
                                                                        .editFormKey,
                                                                    child:
                                                                        ListView(
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      physics:
                                                                          const ScrollPhysics(),
                                                                      children: [
                                                                        DefaultFormField(
                                                                          validator:
                                                                              (value) {
                                                                            if ((value == null || value.isEmpty) &&
                                                                                (controller.familyNameUpdateController.text.isEmpty) &&
                                                                                (controller.localityUpdateController.text.isEmpty) &&
                                                                                (controller.addressLineUpdateController.text.isEmpty)) {
                                                                              return 'Name required'.tr;
                                                                            }
                                                                            return null;
                                                                          },
                                                                          controller:
                                                                              controller.nameUpdateController,
                                                                          hint:
                                                                              'First name'.tr,
                                                                          isPassword:
                                                                              false,
                                                                          enabled:
                                                                              true,
                                                                          readOnly:
                                                                              false,
                                                                          radius:
                                                                              15,
                                                                          autofocus:
                                                                              false,
                                                                          focusBorderColor:
                                                                              AppColor.globalDefaultColor,
                                                                          textColor:
                                                                              AppColor.globalDefaultColor,
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        DefaultFormField(
                                                                          validator:
                                                                              (value) {
                                                                            if ((value == null || value.isEmpty) &&
                                                                                (controller.nameUpdateController.text.isEmpty) &&
                                                                                (controller.localityUpdateController.text.isEmpty) &&
                                                                                (controller.addressLineUpdateController.text.isEmpty)) {
                                                                              return 'Family name required'.tr;
                                                                            }
                                                                            return null;
                                                                          },
                                                                          controller:
                                                                              controller.familyNameUpdateController,
                                                                          hint:
                                                                              'Family name'.tr,
                                                                          isPassword:
                                                                              false,
                                                                          enabled:
                                                                              true,
                                                                          readOnly:
                                                                              false,
                                                                          radius:
                                                                              15,
                                                                          autofocus:
                                                                              false,
                                                                          focusBorderColor:
                                                                              AppColor.globalDefaultColor,
                                                                          textColor:
                                                                              AppColor.globalDefaultColor,
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        DefaultFormField(
                                                                          validator:
                                                                              (value) {
                                                                            if ((value == null || value.isEmpty) &&
                                                                                (controller.familyNameUpdateController.text.isEmpty) &&
                                                                                (controller.nameUpdateController.text.isEmpty) &&
                                                                                (controller.addressLineUpdateController.text.isEmpty)) {
                                                                              return 'Locality required'.tr;
                                                                            }
                                                                            return null;
                                                                          },
                                                                          controller:
                                                                              controller.localityUpdateController,
                                                                          hint:
                                                                              'Locality'.tr,
                                                                          isPassword:
                                                                              false,
                                                                          enabled:
                                                                              true,
                                                                          readOnly:
                                                                              false,
                                                                          radius:
                                                                              15,
                                                                          autofocus:
                                                                              false,
                                                                          focusBorderColor:
                                                                              AppColor.globalDefaultColor,
                                                                          textColor:
                                                                              AppColor.globalDefaultColor,
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        DefaultFormField(
                                                                          validator:
                                                                              (value) {
                                                                            if ((value == null || value.isEmpty) &&
                                                                                (controller.familyNameUpdateController.text.isEmpty) &&
                                                                                (controller.localityUpdateController.text.isEmpty) &&
                                                                                (controller.nameUpdateController.text.isEmpty)) {
                                                                              return 'Name required'.tr;
                                                                            }
                                                                            return null;
                                                                          },
                                                                          controller:
                                                                              controller.addressLineUpdateController,
                                                                          hint:
                                                                              'Address Line'.tr,
                                                                          isPassword:
                                                                              false,
                                                                          enabled:
                                                                              true,
                                                                          readOnly:
                                                                              false,
                                                                          radius:
                                                                              15,
                                                                          autofocus:
                                                                              false,
                                                                          focusBorderColor:
                                                                              AppColor.globalDefaultColor,
                                                                          textColor:
                                                                              AppColor.globalDefaultColor,
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Button(
                                                                          height:
                                                                              50,
                                                                          radius:
                                                                              15,
                                                                          onTap:
                                                                              () {
                                                                            if (controller.editFormKey.currentState!.validate()) {
                                                                              controller.editAddress(
                                                                                familyName: controller.familyNameUpdateController.text,
                                                                                locality: controller.localityUpdateController.text,
                                                                                givenName: controller.nameUpdateController.text,
                                                                                profileId: controller.addressModel.value!.data![index].profileId!,
                                                                                addressLine: controller.addressLineUpdateController.text,
                                                                              );
                                                                              Navigator.pop(context);
                                                                            }
                                                                          },
                                                                          text:
                                                                              'Edit'.tr,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            })
                                                        : controller.selectedMenu
                                                                    .value ==
                                                                'makeDefault'
                                                            ? controller.addAddressASDefault(
                                                                controller
                                                                    .addressModel
                                                                    .value!
                                                                    .data![
                                                                        index]
                                                                    .profileId!)
                                                            : Container();
                                              },
                                              nameAddress:
                                                  '${controller.addressModel.value!.data![index].fullAddress!.givenName}${controller.addressModel.value!.data![index].fullAddress!.familyName}',
                                              locationDetails: controller
                                                          .addressModel
                                                          .value!
                                                          .data![index]
                                                          .fullAddress!
                                                          .locality!
                                                          .isEmpty ||
                                                      controller
                                                          .addressModel
                                                          .value!
                                                          .data![index]
                                                          .fullAddress!
                                                          .addressLine1!
                                                          .isEmpty
                                                  ? ''
                                                  : '${controller.addressModel.value!.data![index].fullAddress!.locality} / ${controller.addressModel.value!.data![index].fullAddress!.addressLine1}',
                                            ),
                                          ),
                                          Obx(() => controller
                                                      .addressModel
                                                      .value!
                                                      .data![index]
                                                      .isDefault ==
                                                  '1'
                                              ? const Icon(Icons.check)
                                              : Container()),
                                        ],
                                      );
                                    });
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      width: 15,
                                    );
                                  },
                                );
                        }),
                      ],
                    ),
                  ),
                )),
            HeaderWidget(
              numberCartItem: 0,
              haveBack: false,
              title: 'my_address'.tr,
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
