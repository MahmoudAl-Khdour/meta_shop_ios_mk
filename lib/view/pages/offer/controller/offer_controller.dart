import 'package:get/get.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';
import 'package:meta_shop/view/pages/offer/model/offer_model.dart';

class OfferController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  final offerModel = Rx<OfferModel?>(null);
  OfferController(this.httpRepository, this.cacheUtils);

  double calculateDiscountPercentage(double price, double afterDiscount) {
    return 100 * (price - afterDiscount) / price;
  }

  getOfferProduct() async {
    try {
      var response = await httpRepository.getProductOffer(
        uId: cacheUtils.getUID(),
        type: "1",
      );
      offerModel.value = response;
    } catch (e) {
      Get.snackbar('Offer Item', offerModel.value!.msg!.message!);
      e.printError();
    }
  }

  @override
  void onInit() {
    getOfferProduct();
    super.onInit();
  }
}
