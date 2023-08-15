import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:video_player/video_player.dart';

import '../model/product_detail.dart';

class ProductPageController extends GetxController {
  HttpRepository httpRepository;
  final CacheUtils cacheUtils;
  bool isSubmitted = false;
  RxInt index = RxInt(0);
  final Rx<String?> pId = Rx<String?>(null);
  RxDouble rate = RxDouble(1.0);
  TextEditingController commentController = TextEditingController();
  late VideoPlayerController videController;

  final productDetailModel = Rx<ProductDetailModel?>(null);

  ProductPageController(this.httpRepository, this.cacheUtils);

  getProductDetails() async {
    try {
      print(
          "\n\n\n\n\n\n\n\n\n uId ${cacheUtils.getUID()} \n\n\n\n\n\n\n\n\n\n");
      print("\n\n\n\n\n\n\n\n\n pId $pId \n\n\n\n\n\n\n\n\n\n");

      var response = await httpRepository.getProductDetail(
        uId: cacheUtils.getUID(),
        pId: '$pId',
      );
      productDetailModel.value = response as ProductDetailModel?;
    } catch (e) {
      Get.snackbar(
        'Product details',
        'error',
      );
      e.printError();
    }
  }

  addRating() async {
    try {
      var response = await httpRepository.addRatingAndComment(
        pId: productDetailModel.value!.data!.pid,
        uId: cacheUtils.getUID(),
        name: cacheUtils.getUserName(),
        comment: commentController.text ?? ' ',
        rate: (rate.value * 20.0).toString(),
      );

      Get.back();
      Get.snackbar(
        'Add Rating'.tr,
        'your_rating_has_been_added_successfully'.tr,
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
      getProductDetails();
      commentController.text = '';
    } catch (e) {
      Get.snackbar(
        'Add Rating'.tr,
        'something_is_wrong'.tr,
        icon: const Icon(
          Icons.error,
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
      e.printError();
    }
  }

  @override
  Future<void> onInit() async {
    pId.value = Get.arguments;
    await getProductDetails();
    videController = VideoPlayerController.network(
        productDetailModel.value!.data!.video ?? '');
    videController.setLooping(true);
    videController.initialize();
    videController.play();
    super.onInit();
  }
}
