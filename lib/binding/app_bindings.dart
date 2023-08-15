import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta_shop/controller/app_controller.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';
import 'package:meta_shop/services/repository/http_repository_impl.dart';
import 'package:meta_shop/view/components/component/productPage/controller/product_page_controller.dart';
import 'package:meta_shop/view/pages/address/controller/address_controller.dart';
import 'package:meta_shop/view/pages/cart/controller/cart_controller.dart';
import 'package:meta_shop/view/pages/detailedOrders/controller/detailed_order_controller.dart';
import 'package:meta_shop/view/pages/home/controller/home_controller.dart';
import 'package:meta_shop/view/pages/home/view/all_brand_products/controller/controller_brand.dart';
import 'package:meta_shop/view/pages/home/view/products_inside_main_category/controller/controller.dart';
import 'package:meta_shop/view/pages/home/view/search/controller/search_controller.dart';
import 'package:meta_shop/view/pages/home/view/search_product/controller/search_product_controller.dart';
import 'package:meta_shop/view/pages/login/controller/login_controller.dart';
import 'package:meta_shop/view/pages/more/controller/more_controller.dart';
import 'package:meta_shop/view/pages/new/controller/new_products_controller.dart';
import 'package:meta_shop/view/pages/offer/controller/offer_controller.dart';
import 'package:meta_shop/view/pages/profile/about/controller/about_us_controller.dart';
import 'package:meta_shop/view/pages/profile/contact/controller/contact_us_controller.dart';
import 'package:meta_shop/view/pages/profile/favorite/controller/favorite_controller.dart';
import 'package:meta_shop/view/pages/profile/information/controller/edit_information_controller.dart';
import 'package:meta_shop/view/pages/profile/order/controller/my_order_controller.dart';
import 'package:meta_shop/view/pages/signup/controller/signup_controller.dart';
import 'package:meta_shop/view/pages/store/controller/store_controller.dart';
import 'package:meta_shop/view/pages/user/controller/user_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    final repository = Get.put<HttpRepository>(
      HttpRepositoryImpl(),
      permanent: true,
    );
    Get.put(
      CacheUtils(GetStorage()),
      permanent: true,
    );

    final cacheUtils = Get.find<CacheUtils>();

    Get.create(() => AppController());
    Get.create(() => HomeController(
          repository,
          cacheUtils,
        ));
    Get.create(() => UserController());
    Get.create(() => LoginController(
          repository,
          cacheUtils,
        ));
    Get.create(() => SignupController(
          repository,
          cacheUtils,
        ));
    Get.create(() => ProductPageController(
          repository,
          cacheUtils,
        ));
    Get.create(() => AboutUsController(
          repository,
          cacheUtils,
        ));
    Get.create(() => ContactUSController(
          repository,
          cacheUtils,
        ));
    Get.create(() => CartController(
          repository,
          cacheUtils,
        ));
    Get.create(() => MoreController(
          cacheUtils,
        ));
    Get.create(() => MyOrderController(
          repository,
          cacheUtils,
        ));
    Get.create(() => EditInformationController(
          repository,
          cacheUtils,
        ));
    Get.create(() => FavoriteController(
          repository,
          cacheUtils,
        ));
    Get.create(() => OfferController(
          repository,
          cacheUtils,
        ));
    Get.create(() => StoreController(
          repository,
          cacheUtils,
        ));
    Get.create(() => NewProductsController(
          repository,
          cacheUtils,
        ));
    Get.create(() => AddressController(
          repository,
          cacheUtils,
        ));
    Get.create(() => DetailedOrderController(
          repository,
          cacheUtils,
        ));
    Get.create(() => SearchMetaController(
          repository,
          cacheUtils,
        ));
    Get.create(() => BrandController(
          repository,
          cacheUtils,
        ));
    Get.create(() => ProductsInsideMainCategoryController(
          repository,
          cacheUtils,
        ));
    Get.create(() => SearchProductController(
          httpRepository: repository,
          cacheUtils: cacheUtils,
        ));
  }
}
