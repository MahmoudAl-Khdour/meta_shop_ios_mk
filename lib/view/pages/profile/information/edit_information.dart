import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/res/assets_res.dart';
import 'package:meta_shop/view/components/component/button/button/button.dart';
import 'package:meta_shop/view/components/component/headerWidget/header_widget.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/component/text_filed/text_form_filed_widget.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';

import 'controller/edit_information_controller.dart';

class EditInformation extends GetWidget<EditInformationController> {
  const EditInformation({Key? key}) : super(key: key);

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
                    padding: const EdgeInsets.only(
                      top: 10,
                      right: 15,
                      left: 15,
                      bottom: 20,
                    ),
                    children: [
                      Form(
                        key: controller.formPersonalInformationKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'personal_information'.tr,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: DefaultFormField(
                                validator: (value) {
                                  if ((value == null || value.isEmpty) &&
                                      (controller
                                          .emailController.text.isEmpty) &&
                                      (controller.phoneNumberController.text
                                          .isEmpty)) {
                                    return 'name_is_required'.tr;
                                  }
                                  // if (((value != null || value!.isNotEmpty) &&
                                  //             (controller.emailController
                                  //                 .value.text.isNotEmpty) ||
                                  //         (controller.phoneNumberController
                                  //             .value.text.isNotEmpty)) &&
                                  //     controller.passwordController.value.text
                                  //         .isNotEmpty) {
                                  //   return null;
                                  // }
                                  return null;
                                },
                                controller: controller.nameController,
                                borderColors: AppColor.globalDefaultColor,
                                hint: 'user_name'.tr,
                                hintStyle: const TextStyle(
                                  color: AppColor.globalDefaultColor,
                                ),
                                autofocus: false,
                                readOnly: false,
                                radius: 50,
                                isPassword: false,
                                textColor: AppColor.globalTextColor,
                                focusBorderColor: AppColor.globalDefaultColor,
                                enabled: true,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: DefaultFormField(
                                validator: (value) {
                                  if ((value == null || value.isEmpty) &&
                                      (controller
                                          .nameController.text.isEmpty) &&
                                      (controller.phoneNumberController.text
                                          .isEmpty)) {
                                    return 'email_is_required'.tr;
                                  }
                                  // if (((value != null || value!.isNotEmpty) &&
                                  //             (controller.nameController.value
                                  //                 .text.isNotEmpty) ||
                                  //         (controller.phoneNumberController
                                  //             .text.isNotEmpty)) &&
                                  //     controller.passwordController.value.text
                                  //         .isNotEmpty) {
                                  //   return null;
                                  // }
                                  return null;
                                },
                                controller: controller.emailController,
                                borderColors: AppColor.globalDefaultColor,
                                hint: 'email'.tr,
                                isEmail: true,
                                hintStyle: const TextStyle(
                                  color: AppColor.globalDefaultColor,
                                ),
                                autofocus: false,
                                readOnly: false,
                                radius: 50,
                                isPassword: false,
                                textColor: AppColor.globalTextColor,
                                focusBorderColor: AppColor.globalDefaultColor,
                                enabled: true,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: DefaultFormField(
                                validator: (value) {
                                  if ((value == null || value.isEmpty) &&
                                      (controller
                                          .emailController.text.isEmpty) &&
                                      (controller
                                          .nameController.text.isEmpty)) {
                                    return 'phone_number_required'.tr;
                                  }
                                  // if (((value != null || value!.isNotEmpty) &&
                                  //             (controller.emailController
                                  //                 .value.text.isNotEmpty) ||
                                  //         (controller.nameController.value
                                  //             .text.isNotEmpty)) &&
                                  //     controller.passwordController.value.text
                                  //         .isNotEmpty) {
                                  //   return null;
                                  // }
                                  return null;
                                },
                                controller: controller.phoneNumberController,
                                borderColors: AppColor.globalDefaultColor,
                                hint: 'phone'.tr,
                                isEmail: false,
                                hintStyle: const TextStyle(
                                  color: AppColor.globalDefaultColor,
                                ),
                                autofocus: false,
                                readOnly: false,
                                radius: 50,
                                maxLines: 1,
                                isPassword: false,
                                textColor: AppColor.globalTextColor,
                                focusBorderColor: AppColor.globalDefaultColor,
                                enabled: true,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: DefaultFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'password_is_required'.tr;
                                  }
                                  return null;
                                },
                                controller: controller.passwordController,
                                maxLines: 1,
                                borderColors: AppColor.globalDefaultColor,
                                hint: 'password'.tr,
                                hintStyle: const TextStyle(
                                  color: AppColor.globalDefaultColor,
                                ),
                                autofocus: false,
                                readOnly: false,
                                radius: 50,
                                isPassword: true,
                                textColor: AppColor.globalTextColor,
                                focusBorderColor: AppColor.globalDefaultColor,
                                enabled: true,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Button(
                                  radius: 50,
                                  width: 150,
                                  height: 50,
                                  onTap: () {
                                    if (controller.formPersonalInformationKey
                                        .currentState!
                                        .validate()) {
                                      print(' \n\n\n All Done \n\n\n ');
                                      controller.editPersonalInformation();
                                    }
                                  },
                                  text: 'edit'.tr,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        color: AppColor.globalDefaultColor,
                        endIndent: 10,
                        indent: 10,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Form(
                        key: controller.formEditPasswordKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'edit_password'.tr,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: DefaultFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'password_is_required'.tr;
                                  } else if (value !=
                                      controller
                                          .repeatNewPasswordController.text) {
                                    return 'pass_not_matched'.tr;
                                  }
                                  return null;
                                },
                                controller: controller.newPasswordController,
                                maxLines: 1,
                                borderColors: AppColor.globalDefaultColor,
                                hint: 'password'.tr,
                                hintStyle: const TextStyle(
                                  color: AppColor.globalDefaultColor,
                                ),
                                autofocus: false,
                                readOnly: false,
                                radius: 50,
                                isPassword: true,
                                textColor: AppColor.globalTextColor,
                                focusBorderColor: AppColor.globalDefaultColor,
                                enabled: true,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: DefaultFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'password_is_required'.tr;
                                  } else if (value !=
                                      controller
                                          .repeatNewPasswordController.text) {
                                    return 'pass_not_matched'.tr;
                                  }
                                  return null;
                                },
                                controller:
                                    controller.repeatNewPasswordController,
                                maxLines: 1,
                                borderColors: AppColor.globalDefaultColor,
                                hint: 're_password'.tr,
                                minLines: 1,
                                hintStyle: const TextStyle(
                                  color: AppColor.globalDefaultColor,
                                ),
                                autofocus: false,
                                readOnly: false,
                                radius: 50,
                                isPassword: true,
                                textColor: AppColor.globalTextColor,
                                focusBorderColor: AppColor.globalDefaultColor,
                                enabled: true,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Button(
                                  radius: 50,
                                  width: 150,
                                  height: 50,
                                  onTap: () {
                                    if (controller
                                        .formEditPasswordKey.currentState!
                                        .validate()) {
                                      controller.editPassword();
                                    }
                                  },
                                  text: 'edit'.tr,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            HeaderWidget(
              numberCartItem: 0,
              haveBack: false,
              title: 'edit_information'.tr,
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
