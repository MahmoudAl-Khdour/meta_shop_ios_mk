import 'package:get/get.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';
import 'package:meta_shop/view/pages/store/model/all_product_model.dart';

class SearchProductController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  SearchProductController({
    required this.httpRepository,
    required this.cacheUtils,
  });

  Rx<AllProductModel?> allProductModel = Rx<AllProductModel?>(null);

  getAllProduct({required String key}) async {
    try {
      var response = await httpRepository.getAllProduct(
        language: 'en',
        uId: cacheUtils.getUID(),
        numberItem: '10000000000',
        key: key,
      );
      allProductModel.value = response;
      allProductModel.refresh();
    } catch (e) {
      e.printError();
    }
  }

  @override
  Future<void> onInit() async {
    await getAllProduct(key: '');
    super.onInit();
  }
}
