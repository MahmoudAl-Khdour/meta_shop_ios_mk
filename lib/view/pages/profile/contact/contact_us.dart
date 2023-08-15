import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/res/assets_res.dart';
import 'package:meta_shop/view/components/component/button/button/button.dart';
import 'package:meta_shop/view/components/component/extintion/email_pattern.dart';
import 'package:meta_shop/view/components/component/headerWidget/header_widget.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/component/text_filed/text_form_filed_widget.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';

import 'controller/contact_us_controller.dart';

class ContactUS extends GetWidget<ContactUSController> {
  const ContactUS({Key? key}) : super(key: key);

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
                  child: Form(
                    key: controller.formKey,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(
                        top: 10,
                        right: 20,
                        left: 20,
                        bottom: 40,
                      ),
                      children: [
                        Obx(() {
                          return controller.contactInformationModel.value ==
                                  null
                              ? Container()
                              : ListTile(
                                  iconColor: AppColor.globalDefaultColor,
                                  minLeadingWidth: 10,
                                  leading: const Icon(
                                    Icons.phone,
                                    size: 30,
                                  ),
                                  title: Text(
                                    'phone'.tr,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColor.globalDefaultColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    controller.contactInformationModel.value!
                                        .data!.phone!,
                                    style: const TextStyle(
                                      color: AppColor.globalDefaultColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                );
                        }),
                        Obx(() {
                          return controller.contactInformationModel.value ==
                                  null
                              ? Container()
                              : ListTile(
                                  iconColor: AppColor.globalDefaultColor,
                                  minLeadingWidth: 10,
                                  leading: const Icon(
                                    Icons.email,
                                    size: 30,
                                  ),
                                  title: Text(
                                    'email'.tr,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColor.globalDefaultColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    controller.contactInformationModel.value!
                                        .data!.mail!,
                                    style: const TextStyle(
                                      color: AppColor.globalDefaultColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                );
                        }),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'send_feedback'.tr,
                                style: const TextStyle(
                                  color: AppColor.globalDefaultColor,
                                  fontSize: 13,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                    margin: const EdgeInsets.only(left: 20.0),
                                    child: const Divider(
                                      color: AppColor.globalDefaultColor,
                                      height: 36,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: DefaultFormField(
                            controller: controller.nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'name_is_required'.tr;
                              }
                              return null;
                            },
                            prefixIconColor: AppColor.globalDefaultColor,
                            prefixIcon: Icons.person,
                            isPassword: false,
                            radius: 20,
                            focusBorderColor: AppColor.globalDefaultColor,
                            textColor: AppColor.globalDefaultColor,
                            autofocus: false,
                            readOnly: false,
                            enabled: true,
                            borderColors: AppColor.globalDefaultColor,
                            hint: 'user_name'.tr,
                            hintStyle: const TextStyle(
                              color: AppColor.globalDefaultColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: DefaultFormField(
                            controller: controller.phoneController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'phone_number_required'.tr;
                              } else if (value.length < 10 ||
                                  value.length > 10) {
                                return 'phone_contain'.tr;
                              }
                              return null;
                            },
                            prefixIconColor: AppColor.globalDefaultColor,
                            prefixIcon: Icons.phone,
                            isPassword: false,
                            radius: 20,
                            focusBorderColor: AppColor.globalDefaultColor,
                            textColor: AppColor.globalDefaultColor,
                            autofocus: false,
                            readOnly: false,
                            enabled: true,
                            borderColors: AppColor.globalDefaultColor,
                            hint: 'phone'.tr,
                            hintStyle: const TextStyle(
                              color: AppColor.globalDefaultColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: DefaultFormField(
                            controller: controller.emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'email_is_required'.tr;
                              }
                              if (!value.isValidEmail) {
                                return 'email_badly_formatted'.tr;
                              }
                              return null;
                            },
                            prefixIconColor: AppColor.globalDefaultColor,
                            prefixIcon: Icons.email,
                            isPassword: false,
                            radius: 20,
                            focusBorderColor: AppColor.globalDefaultColor,
                            textColor: AppColor.globalDefaultColor,
                            autofocus: false,
                            readOnly: false,
                            enabled: true,
                            isEmail: true,
                            borderColors: AppColor.globalDefaultColor,
                            hint: 'email'.tr,
                            hintStyle: const TextStyle(
                              color: AppColor.globalDefaultColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              DefaultFormField(
                                validator: (value) {
                                  if (controller.image.value.isEmpty) {
                                    return 'picture_is_required'.tr;
                                  }
                                  return null;
                                },
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 15,
                                ),
                                maxLines: 4,
                                minLines: 4,
                                isPassword: false,
                                radius: 20,
                                focusBorderColor: AppColor.globalDefaultColor,
                                textColor: AppColor.globalDefaultColor,
                                autofocus: false,
                                readOnly: true,
                                enabled: true,
                                isEmail: true,
                                borderColors: AppColor.globalDefaultColor,
                                hint: 'upload_picture'.tr,
                                hintStyle: const TextStyle(
                                  color: AppColor.globalDefaultColor,
                                  fontSize: 14,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 35,
                                  horizontal: 5,
                                ),
                                child: Obx(() {
                                  return Align(
                                    alignment: const Alignment(-1, 3),
                                    child: controller.enabled.value
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              const Icon(
                                                Icons.check,
                                                color:
                                                    AppColor.globalDefaultColor,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Button(
                                                radius: 50,
                                                height: 35,
                                                width: 100,
                                                onTap: () {
                                                  controller.getFromGallery();
                                                },
                                                text: 'upload'.tr,
                                              ),
                                            ],
                                          )
                                        : Button(
                                            radius: 50,
                                            height: 35,
                                            width: 100,
                                            onTap: () {
                                              controller.getFromGallery();
                                            },
                                            textSize: 10,
                                            text: 'upload'.tr,
                                          ),
                                  );
                                }),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: DefaultFormField(
                            controller: controller.messageController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'message_is_required'.tr;
                              }
                              return null;
                            },
                            isPassword: false,
                            radius: 20,
                            focusBorderColor: AppColor.globalDefaultColor,
                            textColor: AppColor.globalDefaultColor,
                            autofocus: false,
                            readOnly: false,
                            enabled: true,
                            isEmail: true,
                            minLines: 5,
                            contentPadding: const EdgeInsets.all(10),
                            maxLines: 10,
                            borderColors: AppColor.globalDefaultColor,
                            hint: 'massage'.tr,
                            hintStyle: const TextStyle(
                              color: AppColor.globalDefaultColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Button(
                          height: 50,
                          radius: 20,
                          onTap: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.messageController.text = '';
                              controller.emailController.text = '';
                              controller.nameController.text = '';
                              controller.phoneController.text = '';
                              controller.image.value = '';
                              controller.enabled.value = false;
                              controller.sendContactData();
                            }
                          },
                          text: 'send'.tr,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              HeaderWidget(
                numberCartItem: 0,
                haveBack: false,
                title: 'contact_us'.tr,
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
