import 'package:get/get.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';
import 'package:meta_shop/view/pages/store/model/all_product_model.dart';

class BrandController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;
  final Rx<String?> brandId = Rx<String?>(null);

  BrandController(this.httpRepository, this.cacheUtils);

  final getAllProductUsingBrandModel = Rx<AllProductModel?>(null);

  @override
  Future<void> onInit() async {
    brandId.value = Get.arguments;
    getAllProductUsingBrand(brandId.value!);
    super.onInit();
  }

  getAllProductUsingBrand(String brand) async {
    try {
      var response = await httpRepository.getAllProduct(
        language: 'en',
        uId: cacheUtils.getUID(),
        from: '1',
        numberItem: '1000000000',
        category: brand,
      );
      getAllProductUsingBrandModel.value = response;
      getAllProductUsingBrandModel.refresh();
    } catch (e) {
      Get.snackbar('Get all products',
          getAllProductUsingBrandModel.value!.msg!.message!);
      e.printError();
    }
  }
}
