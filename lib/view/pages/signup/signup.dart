import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:meta_shop/res/assets_res.dart';
import 'package:meta_shop/view/components/component/button/button/button.dart';
import 'package:meta_shop/view/components/component/divider/or_divider.dart';
import 'package:meta_shop/view/components/component/extintion/email_pattern.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/component/text_filed/text_form_filed_widget.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:meta_shop/view/pages/login/login.dart';
import 'package:meta_shop/view/pages/signup/controller/signup_controller.dart';

class Signup extends GetWidget<SignupController> {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Obx(() {
        return controller.flagUser.value == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              )
            : Stack(
                children: [
                  Image(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.40,
                    fit: BoxFit.fill,
                    image: const AssetImage(
                      AssetsRes.LOGIN_BACKGROUND,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: SizeConfig.screenHeight * 0.77,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          )),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 35,
                          ),
                          child: Form(
                            key: controller.formKey,
                            child: Column(
                              children: [
                                const Image(
                                    height: 50,
                                    width: 200,
                                    image: AssetImage(
                                      AssetsRes.LOGIN_2,
                                    )),
                                const SizedBox(
                                  height: 20,
                                ),
                                DefaultFormField(
                                  prefixIconColor: AppColor.globalDefaultColor,
                                  borderColors: AppColor.globalDefaultColor,
                                  prefixIcon: Icons.person,
                                  controller: controller.nameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'name_is_required'.tr;
                                    }
                                    return null;
                                  },
                                  maxLines: 1,
                                  isPassword: false,
                                  enabled: true,
                                  hint: 'user_name'.tr,
                                  hintStyle: const TextStyle(
                                    color: AppColor.globalDefaultColor,
                                  ),
                                  readOnly: false,
                                  radius: 50,
                                  autofocus: false,
                                  focusBorderColor: AppColor.globalDefaultColor,
                                  textColor: AppColor.globalDefaultColor,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                DefaultFormField(
                                  prefixIconColor: AppColor.globalDefaultColor,
                                  borderColors: AppColor.globalDefaultColor,
                                  prefixIcon: Icons.email,
                                  controller: controller.emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'email_is_required'.tr;
                                    } else if (!value.isValidEmail) {
                                      return 'email_badly_formatted'.tr;
                                    }
                                    return null;
                                  },
                                  maxLines: 1,
                                  isPassword: false,
                                  enabled: true,
                                  hint: 'email'.tr,
                                  hintStyle: const TextStyle(
                                    color: AppColor.globalDefaultColor,
                                  ),
                                  readOnly: false,
                                  radius: 50,
                                  autofocus: false,
                                  focusBorderColor: AppColor.globalDefaultColor,
                                  textColor: AppColor.globalDefaultColor,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                DefaultFormField(
                                  prefixIconColor: AppColor.globalDefaultColor,
                                  borderColors: AppColor.globalDefaultColor,
                                  prefixIcon: Icons.phone,
                                  controller: controller.numberPhoneController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'phone_number_required'.tr;
                                    } else if (value.length < 10 ||
                                        value.length > 10) {
                                      return 'phone_contain'.tr;
                                    }
                                    return null;
                                  },
                                  maxLines: 1,
                                  isPassword: false,
                                  enabled: true,
                                  hint: 'phone'.tr,
                                  hintStyle: const TextStyle(
                                    color: AppColor.globalDefaultColor,
                                  ),
                                  readOnly: false,
                                  radius: 50,
                                  autofocus: false,
                                  focusBorderColor: AppColor.globalDefaultColor,
                                  textColor: AppColor.globalDefaultColor,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Obx(() {
                                  return DefaultFormField(
                                    prefixIconColor:
                                        AppColor.globalDefaultColor,
                                    borderColors: AppColor.globalDefaultColor,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'password_is_required'.tr;
                                      } else if (value !=
                                          controller
                                              .repeatPasswordController.text) {
                                        return 'pass_not_matched '.tr;
                                      }
                                      return null;
                                    },
                                    maxLines: 1,
                                    isPassword: controller.hidePass.value,
                                    controller: controller.passwordController,
                                    enabled: true,
                                    prefixIcon: Icons.lock,
                                    hint: 'password'.tr,
                                    hintStyle: const TextStyle(
                                      color: AppColor.globalDefaultColor,
                                    ),
                                    readOnly: false,
                                    radius: 50,
                                    autofocus: false,
                                    focusBorderColor:
                                        AppColor.globalDefaultColor,
                                    textColor: AppColor.globalDefaultColor,
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        controller.hidePassFun();
                                      },
                                      icon: Icon(controller.icoPass.value,
                                          size: 23),
                                      color: AppColor.globalDefaultColor,
                                    ),
                                  );
                                }),
                                const SizedBox(
                                  height: 10,
                                ),
                                Obx(() {
                                  return DefaultFormField(
                                    prefixIconColor:
                                        AppColor.globalDefaultColor,
                                    borderColors: AppColor.globalDefaultColor,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'password_is_required'.tr;
                                      } else if (value !=
                                          controller.passwordController.text) {
                                        return 'pass_not_matched'.tr;
                                      }
                                      return null;
                                    },
                                    maxLines: 1,
                                    isPassword: controller.hideRepeatPass.value,
                                    controller:
                                        controller.repeatPasswordController,
                                    enabled: true,
                                    prefixIcon: Icons.lock,
                                    hint: 're_password'.tr,
                                    hintStyle: const TextStyle(
                                      color: AppColor.globalDefaultColor,
                                    ),
                                    readOnly: false,
                                    radius: 50,
                                    autofocus: false,
                                    focusBorderColor:
                                        AppColor.globalDefaultColor,
                                    textColor: AppColor.globalDefaultColor,
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        controller.hideRepeatPassFun();
                                      },
                                      icon: Icon(controller.icoRepeatPass.value,
                                          size: 23),
                                      color: AppColor.globalDefaultColor,
                                    ),
                                  );
                                }),
                                const SizedBox(
                                  height: 15,
                                ),
                                Button(
                                  radius: 50,
                                  height: 50,
                                  width: double.infinity,
                                  text: 'signup'.tr,
                                  onTap: () {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      controller.userSignUp();
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Obx(() => controller.flagUser.value!
                                    ? Container()
                                    : const OrDivider()),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // InkWell(
                                    //   onTap: () {
                                    //     controller.facebookSignUp();
                                    //   },
                                    //   child: Center(
                                    //     child: Container(
                                    //       width: 50,
                                    //       height: 50,
                                    //       decoration: BoxDecoration(
                                    //         color: Colors.white,
                                    //         border: Border.all(
                                    //           width: 0.4,
                                    //           color: Colors.grey[300]!,
                                    //         ),
                                    //         borderRadius: const BorderRadius.all(
                                    //           Radius.circular(100),
                                    //         ),
                                    //       ),
                                    //       child: const Padding(
                                    //         padding: EdgeInsets.all(10.0),
                                    //         child: Icon(
                                    //           FontAwesomeIcons.facebookF,
                                    //           color: Colors.blue,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    // const SizedBox(
                                    //   width: 20,
                                    // ),

                                    Obx(
                                      () => controller.flagUser.value!
                                          ? Container()
                                          : controller.isHuawei.value
                                              ? Container()
                                              : InkWell(
                                                  onTap: () async {
                                                    controller.googleSignUp();
                                                  },
                                                  child: Center(
                                                    child: Container(
                                                      width: 50,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                          width: 0.4,
                                                          color:
                                                              Colors.grey[300]!,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(100),
                                                        ),
                                                      ),
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Icon(
                                                          FontAwesomeIcons
                                                              .google,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('already_have_account'.tr),
                                    TextButton(
                                        onPressed: () {
                                          Get.off(const Login());
                                        },
                                        child: Text('login'.tr)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
