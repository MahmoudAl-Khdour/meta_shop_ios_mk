import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';
import 'package:meta_shop/view/components/component/baseWidget/base_widget.dart';
import 'package:meta_shop/view/components/constants/actions/constants_action.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:meta_shop/view/pages/cart/current_cart_model.dart';

class CartController extends GetxController {
  final currentCartModel = Rx<CurrentCartModel?>(null);

  final CacheUtils cacheUtils;
  final promoController = TextEditingController();
  final HttpRepository httpRepository;
  CartController(this.httpRepository, this.cacheUtils);
  RxList<int> itemQuantity = RxList<int>();

  getCurrentCart() async {
    try {
      var response = await httpRepository.getCurrentCart(
        uId: cacheUtils.getUID(),
        language: "ar",
      );
      if (response!.msg!.status == 0) {
        currentCartModel.value = CurrentCartModel(msg: response.msg);
        return;
      }
      currentCartModel.value = response;
      currentCartModel.value!.data!.coupons!.isEmpty
          ? promoController.text = ''
          : promoController.text =
              currentCartModel.value!.data!.coupons![0].code!;
    } catch (e) {
      throw Exception('Get Cart : $e');
    }
  }

  applyPromo() async {
    try {
      var response = await httpRepository.applyCoupon(
        uId: cacheUtils.getUID(),
        orderId: currentCartModel.value!.data!.orderId!,
        code: promoController.text,
      );
      if (response!.msg!.status == 0) {
        Get.snackbar(
          'Apply Promo'.tr,
          response.msg!.message!,
          icon: const Icon(
            Icons.done,
            color: Colors.white,
          ),
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColor.globalDefaultColor.withOpacity(0.9),
          borderRadius: 15,
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          colorText: Colors.white,
          duration: const Duration(seconds: 4),
          isDismissible: true,
          dismissDirection: DismissDirection.vertical,
          forwardAnimationCurve: Curves.easeOutBack,
        );
        return;
      } else {
        Get.back();
        Get.snackbar(
          'Apply Promo'.tr,
          response.msg!.message!,
          icon: const Icon(
            Icons.done,
            color: Colors.white,
          ),
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColor.globalDefaultColor.withOpacity(0.9),
          borderRadius: 15,
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          colorText: Colors.white,
          duration: const Duration(seconds: 4),
          isDismissible: true,
          dismissDirection: DismissDirection.vertical,
          forwardAnimationCurve: Curves.easeOutBack,
        );
        getCurrentCart();
        promoController.text = '';
      }
    } catch (e) {
      throw Exception('Add Promo : $e');
    }
  }

  removePromo() async {
    try {
      var response = await httpRepository.removeCoupon(
        uId: cacheUtils.getUID(),
        orderId: currentCartModel.value!.data!.orderId!,
        couponId: currentCartModel.value!.data!.coupons![0].couponId,
      );
      if (response!.msg!.status == 0) {
        Get.snackbar(
          'Remove Promo'.tr,
          response.msg!.message!,
          icon: const Icon(
            Icons.done,
            color: Colors.white,
          ),
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColor.globalDefaultColor.withOpacity(0.9),
          borderRadius: 15,
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          colorText: Colors.white,
          duration: const Duration(seconds: 4),
          isDismissible: true,
          dismissDirection: DismissDirection.vertical,
          forwardAnimationCurve: Curves.easeOutBack,
        );
        return;
      } else {
        Get.back();
        Get.snackbar(
          'Remove Promo'.tr,
          response.msg!.message!,
          icon: const Icon(
            Icons.done,
            color: Colors.white,
          ),
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColor.globalDefaultColor.withOpacity(0.9),
          borderRadius: 15,
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          colorText: Colors.white,
          duration: const Duration(seconds: 4),
          isDismissible: true,
          dismissDirection: DismissDirection.vertical,
          forwardAnimationCurve: Curves.easeOutBack,
        );
        getCurrentCart();
        promoController.text = '';
      }
    } catch (e) {
      throw Exception('Remove Promo : $e');
    }
  }

  double getShippingPrice() {
    double sum = 0;
    for (int i = 0; i < currentCartModel.value!.data!.fees!.length; i++) {
      sum += double.parse(currentCartModel.value!.data!.fees![i].amount!);
    }
    return sum;
  }

  updateQuantityCart({
    String? quantity,
    String? orderId,
    String? orderItemId,
  }) async {
    try {
      var response = await httpRepository.updateCart(
        uId: cacheUtils.getUID(),
        quantity: quantity,
        orderId: orderId,
        orderItemId: orderItemId,
      );
      getCurrentCart();
    } catch (e) {
      throw Exception('Update Quantity Cart : $e');
    }
  }

  deleteItemFromCart({
    String? orderId,
    String? orderItemId,
  }) async {
    try {
      var response = await httpRepository.deleteCart(
        uId: cacheUtils.getUID(),
        orderId: orderId,
        orderItemId: orderItemId,
      );
      getCurrentCart();
      Future.delayed(const Duration(milliseconds: 500), () async {
        BaseWidgetState.numberItemNotifier.value =
            await ConstantActions.getCurrentCart();
      });
    } catch (e) {
      throw Exception('Delete Item From Cart : $e');
    }
  }

  @override
  Future<void> onInit() async {
    await getCurrentCart();
    super.onInit();
  }
}
