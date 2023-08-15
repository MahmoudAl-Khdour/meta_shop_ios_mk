import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/res/assets_res.dart';
import 'package:meta_shop/view/components/component/headerWidget/header_widget.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:meta_shop/view/pages/login/login.dart';
import 'package:meta_shop/view/pages/signup/signup.dart';
import 'package:meta_shop/view/pages/user/controller/user_controller.dart';

class User extends GetWidget<UserController> {
  const User({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: Container(
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
                    top: 130,
                    right: 20,
                    left: 20,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 550,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 15,
                        ),
                        child: Column(
                          children: [
                            Material(
                              color: Colors.grey[100],
                              child: TabBar(
                                onTap: (value) {
                                  controller.index.value = value;
                                },
                                indicatorColor: Colors.white,
                                indicator:
                                    const BoxDecoration(color: Colors.black54),
                                labelColor: Colors.white,
                                unselectedLabelColor: AppColor.globalTextColor,
                                overlayColor:
                                    MaterialStateProperty.all(Colors.red),
                                tabs: const [
                                  Tab(
                                    child: Text(
                                      'Login',
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'Sign Up',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Expanded(
                              child: TabBarView(
                                children: [
                                  Login(),
                                  Signup(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(() {
                  return HeaderWidget(
                    numberCartItem: 0,
                    haveBack: false,
                    title: controller.userList[controller.index.value],
                    onPressed: () {
                      Get.back();
                    },
                    haveNotification: false,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
