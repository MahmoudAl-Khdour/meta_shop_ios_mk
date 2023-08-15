import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';
import 'package:meta_shop/view/pages/new/model/new_products_model.dart';

class NewProductsController extends GetxController {
  final newProductsModel = Rx<NewProductsModel?>(null);
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  NewProductsController(this.httpRepository, this.cacheUtils);
  Rx<Color?> iconFavColor = Rx<Color?>(Colors.black);
  RxBool fav = false.obs;
  Rx<IconData> icon = Rx<IconData>(Icons.favorite_border);
  final productId = Rx<String?>(null);
  RxInt index = 0.obs;

  getNewProducts() async {
    print('\n\n\n\n\n uid : ${cacheUtils.getUID()}\n\n\n\n\n\n');

    try {
      var response = await httpRepository.getNewProduct(
        language: 'ar',
        uId: cacheUtils.getUID(),
        type: '2',
      );
      print('\n\n\n\n\n response ${response!.data![0].body} \n\n\n\n\n\n');
      newProductsModel.value = response;
    } catch (e) {
      Get.snackbar('Get New Products', 'error');
      e.printError();
    }
  }

  @override
  Future<void> onInit() async {
    await getNewProducts();
    super.onInit();
  }
}
