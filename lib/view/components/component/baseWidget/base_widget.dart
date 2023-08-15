import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';

import '../../../../model/itemModel/bottom_nav_bar_model.dart';
import '../../../../res/assets_res.dart';
import '../../constants/actions/constants_action.dart';
import '../../constants/constant_data/constant_data.dart';
import '../headerWidget/header_widget.dart';

class BaseWidget extends StatefulWidget {
  const BaseWidget({super.key});

  @override
  State<BaseWidget> createState() => BaseWidgetState();
}

class BaseWidgetState extends State<BaseWidget> {
  static ValueNotifier<int> numberItemNotifier = ValueNotifier<int>(0);

  void initialization() async {
    numberItemNotifier.value = await ConstantActions.getCurrentCart();
  }

  @override
  initState() {
    initialization();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: currentPageIndex,
          elevation: 10,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          backgroundColor: Colors.white,
          indicatorColor: Colors.white,
          destinations: <Widget>[
            NavigationDestination(
              selectedIcon: const Icon(
                Icons.home_outlined,
                color: AppColor.globalDefaultColor,
              ),
              icon: Icon(
                Icons.home_outlined,
                color: Colors.grey[400],
              ),
              label: 'home'.tr,
            ),
            NavigationDestination(
              selectedIcon: const Icon(
                Icons.storefront,
                color: AppColor.globalDefaultColor,
              ),
              icon: Icon(
                Icons.storefront,
                color: Colors.grey[400],
              ),
              label: 'store'.tr,
            ),
            NavigationDestination(
              selectedIcon: const Icon(
                Icons.new_releases_outlined,
                color: AppColor.globalDefaultColor,
              ),
              icon: Icon(
                Icons.new_releases_outlined,
                color: Colors.grey[400],
              ),
              label: 'news'.tr,
            ),
            NavigationDestination(
              selectedIcon: const Icon(
                Icons.percent,
                color: AppColor.globalDefaultColor,
              ),
              icon: Icon(
                Icons.percent,
                color: Colors.grey[400],
              ),
              label: 'offers'.tr,
            ),
            NavigationDestination(
              selectedIcon: const Icon(
                Icons.more_vert,
                color: AppColor.globalDefaultColor,
              ),
              icon: Icon(
                Icons.more_vert,
                color: Colors.grey[400],
              ),
              label: 'more'.tr,
            ),
          ],
        ),
        body: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        AssetsRes.BACKGROUND_1,
                      ))),
              child: Stack(
                children: [
                  currentPageIndex > -1
                      ? bottomNavBar[currentPageIndex].widget
                      : Container(),
                  Column(
                    children: [
                      bottomNavBar[currentPageIndex].navBarItem ==
                              NavBarItem.home
                          ? ValueListenableBuilder<int>(
                              valueListenable: numberItemNotifier,
                              builder: (context, value, _) {
                                return HeaderWidget(
                                  isHome: true,
                                  numberCartItem: value,
                                  title: bottomNavBar[currentPageIndex].name,
                                  onPressed: () {
                                    setState(() {
                                      currentPageIndex = 0;
                                    });
                                  },
                                  haveNotification: false,
                                );
                              },
                            )
                          : ValueListenableBuilder<int>(
                              valueListenable: numberItemNotifier,
                              builder: (context, value, _) {
                                return HeaderWidget(
                                  haveCart: true,
                                  numberCartItem: value,
                                  title: bottomNavBar[currentPageIndex].name,
                                  onPressed: () {
                                    setState(() {
                                      currentPageIndex = 0;
                                    });
                                  },
                                  haveNotification: false,
                                );
                              },
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
