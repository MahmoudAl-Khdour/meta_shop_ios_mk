import 'package:get/get.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';
import 'package:meta_shop/view/pages/profile/order/model/view_all_order_model.dart';

class MyOrderController extends GetxController {
  final HttpRepository _httpRepository;
  final viewAllOrderModel = Rx<ViewAllOrderModel?>(null);
  final itemList = RxList<Items>();
  final numItems = Rx<int>(0);
  final CacheUtils _cacheUtils;

  MyOrderController(this._httpRepository, this._cacheUtils);

  getMyOrders() async {
    try {
      var response = await _httpRepository.getAllOrder(
        uId: _cacheUtils.getUID(),
        language: "ar",
      );
      viewAllOrderModel.value = response as ViewAllOrderModel?;
    } catch (e) {
      Get.snackbar('cart'.tr, 'error');
      e.printError();
    }
  }

  @override
  Future<void> onInit() async {
    await getMyOrders();
    super.onInit(); //
  }
}
