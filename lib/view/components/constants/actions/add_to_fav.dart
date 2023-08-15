import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';

addToFavorite({
  String? productId,
  required CacheUtils cacheUtils,
  required HttpRepository httpRepository,
}) async {
  try {
    var response = await httpRepository.addToFavorite(
      uId: cacheUtils.getUID(),
      productId: productId,
    );
  } catch (e) {
    throw Exception('Add to favorite : $e');
  }
}
