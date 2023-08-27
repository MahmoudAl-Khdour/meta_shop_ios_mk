import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:meta_shop/res/assets_res.dart';
import 'package:meta_shop/view/components/component/baseWidget/base_widget.dart';
import 'package:meta_shop/view/components/component/button/button/button.dart';
import 'package:meta_shop/view/components/component/divider/or_divider.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/component/text_filed/text_form_filed_widget.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:meta_shop/view/pages/login/controller/login_controller.dart';
import 'package:meta_shop/view/pages/signup/signup.dart';

class Login extends GetWidget<LoginController> {
  const Login({Key? key}) : super(key: key);

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
                    image: const AssetImage(AssetsRes.LOGIN_BACKGROUND),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: SizeConfig.screenHeight * 0.7,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          )),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
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
                                  borderColors: AppColor.globalDefaultColor,
                                  prefixIconColor: AppColor.globalDefaultColor,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'email_is_required'.tr;
                                    }
                                    // else if (!value.isValidEmail) {
                                    //   return 'The email is badly formatted';
                                    // }
                                    return null;
                                  },
                                  maxLines: 1,
                                  controller: controller.emailController,
                                  isPassword: false,
                                  enabled: true,
                                  prefixIcon: Icons.email,
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
                                Obx(() {
                                  return DefaultFormField(
                                    prefixIconColor:
                                        AppColor.globalDefaultColor,
                                    borderColors: AppColor.globalDefaultColor,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'password_is_required'.tr;
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
                                      icon: Icon(
                                        controller.ico.value,
                                        size: 23,
                                      ),
                                      color: AppColor.globalDefaultColor,
                                    ),
                                  );
                                }),
                                const SizedBox(
                                  height: 5,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: TextButton(
                                      onPressed: () {
                                        controller.useLaunchUrl();
                                      },
                                      child: Text(
                                        'forgot_password'.tr,
                                        style: const TextStyle(
                                          color: AppColor.globalDefaultColor,
                                          fontSize: 12,
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Button(
                                  radius: 50,
                                  height: 50,
                                  width: double.infinity,
                                  text: 'login'.tr,
                                  onTap: () async {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      await controller.userLogin();
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Obx(
                                  () => controller.flagUser.value!
                                      ? Container()
                                      : const OrDivider(),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    controller.isHuawei.value
                                        ? Container()
                                        : Obx(
                                            () => controller.flagUser.value!
                                                ? Container()
                                                : InkWell(
                                                    onTap: () async {
                                                      await controller
                                                          .googleLogin();
                                                    },
                                                    child: Center(
                                                      child: Container(
                                                        width: 50,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            width: 0.4,
                                                            color: Colors
                                                                .grey[300]!,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                            Radius.circular(
                                                                100),
                                                          ),
                                                        ),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
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
                                          )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('have_account'.tr),
                                    TextButton(
                                        onPressed: () {
                                          Get.off(const Signup());
                                          if (kDebugMode) {
                                            print(
                                                ' \n\n\n\n${controller.cacheUtils.getFlag()}');
                                          }
                                        },
                                        child: Text('signup'.tr)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                // controller.flagValue.value ==
                                Obx(() => controller.flagUser.value!
                                    ? Align(
                                        alignment: Alignment.center,
                                        child: TextButton(
                                            onPressed: () async {
                                              await controller.cacheUtils
                                                  .saveUserData(
                                                userId: '207',
                                                userName: 'Guest',
                                                userPass: '123',
                                                userEmail: 'mk23@gmail.com',
                                              );
                                              Get.offAll(
                                                  () => const BaseWidget());
                                            },
                                            child: Text(
                                              'Continue as guest'.tr,
                                              style: const TextStyle(
                                                color:
                                                    AppColor.globalDefaultColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                      )
                                    : Container()),
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
