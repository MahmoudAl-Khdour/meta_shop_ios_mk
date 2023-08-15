import 'package:get/get.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';
import 'package:meta_shop/view/pages/login/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    final cacheUtils = Get.find<CacheUtils>();

    final repository = Get.find<HttpRepository>();
    Get.lazyPut(() => LoginController(repository, cacheUtils));
  }
}
