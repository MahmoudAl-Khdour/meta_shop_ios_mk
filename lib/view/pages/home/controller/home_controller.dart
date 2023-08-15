import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/model/brand_model.dart';
import 'package:meta_shop/model/categories_model.dart';
import 'package:meta_shop/model/main_department_sections_model.dart';
import 'package:meta_shop/model/page_slider_model.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';
import 'package:meta_shop/view/components/constants/constant_data/constant_data.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:meta_shop/view/pages/cart/current_cart_model.dart';
import 'package:meta_shop/view/pages/new/model/new_products_model.dart';
import 'package:meta_shop/view/pages/offer/model/offer_model.dart';

class HomeController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  final emailController = TextEditingController();
  final ScrollController catScrollController = ScrollController();
  final currentCartModel = Rx<CurrentCartModel?>(null);


  final newProductsModel = Rx<NewProductsModel?>(null);
  final categoriesModel = Rx<CategoriesModel?>(null);
  final offerModel = Rx<OfferModel?>(null);
  final pageSliderModel = Rx<PageSliderModel?>(null);
  final brandModel = Rx<BrandModel?>(null);

  final mainDepartmentSections = Rx<MainDepartmentSectionsModel?>(null);

  RxBool switchMeta = true.obs;
  RxDouble valueSlider = RxDouble(1);
  String productId = "31";
  Rx<Color?> iconFavColor = Rx<Color?>(null);
  HomeController(this.httpRepository, this.cacheUtils);
  RxBool fav = false.obs;
  Rx<IconData> icon = Rx<IconData>(Icons.favorite_border);

  Rx<int> index = Rx<int>(0);

  RxInt numberItem = RxInt(0);

  Rx<List<Widget>?> imageSlider = Rx(null);

  @override
  Future<void> onInit() async {
    await getCategories();
    await getNewProducts();
    await getOfferProduct();
    await getHomePageSlider();
    await getBrand();
    super.onInit();
  }

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
      numberItem.value = currentCartModel.value!.data!.items!.length;
      MySingleton.instance.setNumberItem = response.data!.items!.length;
      currentCartModel.refresh();
    } catch (e) {
      throw Exception('Get Cart : $e');
    }
  }

  subscribeSimplenews() async {
    try {
      var response = await httpRepository.subscribeSimplenews(
        email: emailController.text,
      );
      Get.snackbar(
        'Subscribe news letter'.tr,
        response!.msg!.message!,
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
      emailController.text = '';
    } catch (e) {
      Get.snackbar(
        'Subscribe news letter'.tr,
        'error',
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
      e.printError();
    }
  }
  void animateToSelectedIndex(index){
    catScrollController.animateTo(
      catScrollController.offset+(160*index),
      duration:const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  getCategories() async {
    try {
      var response = await httpRepository.getCategories();
      categoriesModel.value = response;
    } catch (e) {
      e.printError();
    }
  }

  getNewProducts() async {
    try {
      var response = await httpRepository.getNewProduct(
        language: 'ar',
        uId: cacheUtils.getUID(),
        type: '2',
      );
      newProductsModel.value = response;
    } catch (e) {
      e.printError();
    }
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

  getHomePageSlider() async {
    try {
      var response = await httpRepository.getPageSlider();
      pageSliderModel.value = response;
    } catch (e) {
      Get.snackbar('Get home page slider', 'error');
      e.printError();
    }
  }

  getBrand() async {
    try {
      var response = await httpRepository.getBrand();
      brandModel.value = response;
    } catch (e) {
      Get.snackbar('Get home page slider', 'error');
      e.printError();
    }
  }

  double calculateDiscountPercentage(double price, double afterDiscount) {
    return 100 * (price - afterDiscount) / price;
  }
}
