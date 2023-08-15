import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';
import 'package:meta_shop/view/pages/store/model/all_product_model.dart';

class SearchMetaController extends GetxController {
  final allProductModel = Rx<AllProductModel?>(null);
  RxList<DataAllProduct> newProducts = RxList();
  RxList<DataAllProduct> products = RxList();

  var selectedProducts = <DataAllProduct>[].obs;

  // RxList<DataAllProduct> productsFiltered = RxList();
  final ScrollController scrollController = ScrollController();
  final filterController = TextEditingController();

  // var selectedProducts = <DataAllProduct>[].obs;

  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  RxBool loading = RxBool(false);
  RxBool allLoaded = RxBool(false);
  RxBool usingFilter = RxBool(false);
  Rx keyFilter = RxString('');
  int counter = 1;

  SearchMetaController(this.httpRepository, this.cacheUtils);

  getAllProduct({required int from, required String key}) async {
    try {
      var response = await httpRepository.getAllProduct(
        language: 'en',
        uId: cacheUtils.getUID(),
        from: from.toString(),
        numberItem: '10000000000',
        key: key,
      );
      allProductModel.value = response;
      products.addAll(response!.data!);
      products.refresh();
    } catch (e) {
      e.printError();
    }
  }

  void filterBook(String productName) {
    selectedProducts.value = [];
    selectedProducts.value = products;
    var results = <DataAllProduct>[];
    if (productName.isEmpty) {
      results = products;
    } else {
      results = selectedProducts
          .where((element) => element.title
              .toString()
              .toLowerCase()
              .contains(productName.toLowerCase()))
          .toList();
    }
    selectedProducts.value = results;
  }

  mockFilter() async {
    loading.value = true;
    await getAllProduct(from: counter, key: keyFilter.value);
    if (newProducts.isNotEmpty) {
      products.addAll(newProducts);
      products.refresh();
    }
    loading.value = false;
    allLoaded.value = newProducts.isEmpty;
  }

  @override
  void onInit() {
    mockFilter();
    scrollController.addListener(() async {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !loading.value) {
        counter += 10;
        await mockFilter();
      }
    });
    super.onInit();
  }
}
