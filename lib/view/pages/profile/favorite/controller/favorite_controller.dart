import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:meta_shop/view/pages/profile/favorite/model/FavoriteModel.dart';

class FavoriteController extends GetxController {
  final favoriteModel = Rx<FavoriteModel?>(null);
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  var response = null.obs;
  RxInt index = 0.obs;
  final productId = Rx<String?>(null);
  Rx<Color?> iconFavColor = Rx<Color?>(Colors.red);
  RxBool fav = true.obs;
  Rx<IconData> icon = Rx<IconData>(Icons.favorite);

  FavoriteController(this.httpRepository, this.cacheUtils);

  getFavoriteItems() async {
    try {
      var response = await httpRepository.getFavoriteProducts(
        uId: cacheUtils.getUID(),
        language: 'ar',
      );
      favoriteModel.value = response;
    } catch (e) {
      Get.snackbar(
        'favorite'.tr,
        'something_is_wrong'.tr,
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColor.globalDefaultColor.withOpacity(0.9),
        borderRadius: 15,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        dismissDirection: DismissDirection.vertical,
        forwardAnimationCurve: Curves.easeOutBack,
      );

      e.printError();
    }
  }

  addToFavorite(String? productId) async {
    try {
      var response = await httpRepository.addToFavorite(
        uId: cacheUtils.getUID(),
        productId: productId,
      );
      getFavoriteItems();
    } catch (e) {
      Get.snackbar(
        'favorite'.tr,
        'something_is_wrong'.tr,
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColor.globalDefaultColor.withOpacity(0.9),
        borderRadius: 15,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        dismissDirection: DismissDirection.vertical,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      e.printError();
    }
  }

  @override
  Future<void> onInit() async {
    await getFavoriteItems();
    super.onInit();
  }
}
