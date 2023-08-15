import 'package:get/get.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';

class AboutUsController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  Rx<String> title = RxString('');
  Rx<String> aboutUs = RxString('');

  AboutUsController(
    this.httpRepository,
    this.cacheUtils,
  );

  getAboutUs() async {
    try {
      var response = await httpRepository.getAboutUS();
      title.value = response!.data!.title!;
      aboutUs.value = response.data!.body!;
    } catch (e) {
      Get.snackbar('Get Categories', 'error');
      e.printError();
    }
  }

  @override
  void onInit() {
    getAboutUs();
    super.onInit();
  }
}
