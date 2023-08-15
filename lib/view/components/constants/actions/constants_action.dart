import 'package:get_storage/get_storage.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';
import 'package:meta_shop/view/components/constants/constant_data/constant_data.dart';

import '../../../../services/repository/http_repository_impl.dart';
import '../../component/baseWidget/base_widget.dart';

class ConstantActions {
  static final CacheUtils _cacheUtils = CacheUtils(GetStorage());
  static final HttpRepository _httpRepository = HttpRepositoryImpl();

  static Future<int> getCurrentCart() async {
    try {
      var response = await _httpRepository.getCurrentCart(
        uId: _cacheUtils.getUID(),
        language: "ar",
      );
      if (response!.msg!.status == 0) {
        return 0;
      }
      MySingleton.instance.setNumberItem = response.data!.items!.length;
      BaseWidgetState.numberItemNotifier.value = response.data!.items!.length;
      return response.data!.items!.length;
    } catch (e) {
      throw Exception('Get Cart : $e');
    }
  }
}
