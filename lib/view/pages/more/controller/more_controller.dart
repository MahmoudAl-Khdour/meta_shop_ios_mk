import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/model/itemModel/more_model.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/view/pages/address/address_screen.dart';
import 'package:meta_shop/view/pages/login/login.dart';
import 'package:meta_shop/view/pages/profile/about/about_us.dart';
import 'package:meta_shop/view/pages/profile/contact/contact_us.dart';
import 'package:meta_shop/view/pages/profile/favorite/favorite.dart';
import 'package:meta_shop/view/pages/profile/information/edit_information.dart';
import 'package:meta_shop/view/pages/profile/order/my_orders.dart';

class MoreController extends GetxController {
  final CacheUtils _cacheUtils;
  List<MoreModel> itemMoreList = [];
  MoreController(this._cacheUtils);

  @override
  void onInit() {
    super.onInit();
    itemMoreList = [
      MoreModel(
        moreKey: MoreItem.editInformation,
        name: 'edit_information'.tr,
        icon: Icons.manage_accounts,
        onTap: () {
          Get.to(const EditInformation());
        },
      ),
      MoreModel(
        moreKey: MoreItem.myOrder,
        name: 'my_orders'.tr,
        icon: Icons.request_quote_outlined,
        onTap: () {
          Get.to(const MyOrders());
        },
      ),
      MoreModel(
        moreKey: MoreItem.location,
        name: 'my_location'.tr,
        icon: Icons.add_location_alt_outlined,
        onTap: () {
          Get.to(const AddressScreen());
        },
      ),
      MoreModel(
        moreKey: MoreItem.favorite,
        name: 'favorite'.tr,
        icon: Icons.favorite_border,
        onTap: () {
          Get.to(const Favorite());
        },
      ),
      MoreModel(
        moreKey: MoreItem.aboutUs,
        name: 'about_us'.tr,
        icon: Icons.info_outline,
        onTap: () {
          Get.to(const AboutUs());
        },
      ),
      MoreModel(
        moreKey: MoreItem.callUs,
        name: 'contact_us'.tr,
        icon: Icons.call,
        onTap: () {
          Get.to(const ContactUS());
        },
      ),
      MoreModel(
        moreKey: MoreItem.logout,
        name: 'logout'.tr,
        icon: Icons.logout,
        onTap: () {
          _cacheUtils.logout();
          Get.offAll(const Login());
        },
      ),
    ];
  }
}
