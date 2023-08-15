import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';
import 'package:meta_shop/view/components/constants/actions/constants_action.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';

import '../../component/baseWidget/base_widget.dart';

addToCart({
  required String vId,
  required String price,
  required CacheUtils cacheUtils,
  required HttpRepository httpRepository,
  String? quantity,
}) async {
  try {
    var response = await httpRepository.addToCart(
      uId: cacheUtils.getUID(),
      price: price,
      quantity: quantity ?? '1',
      vId: vId,
    );
    Get.snackbar(
      'add_to_cart'.tr,
      'added_to_cart_successfully'.tr,
      icon: const Icon(
        Icons.done,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColor.globalDefaultColor.withOpacity(0.9),
      borderRadius: 15,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.vertical,
      forwardAnimationCurve: Curves.easeOutBack,
    );

    Future.delayed(const Duration(milliseconds: 500), () async {
      BaseWidgetState.numberItemNotifier.value =
          await ConstantActions.getCurrentCart();
    });
  } catch (e) {
    throw Exception('Add to Cart : $e');
  }
}
