import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/model/countries_model.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';
import 'package:meta_shop/view/components/constants/actions/constants_action.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:meta_shop/view/pages/address/model/address_model.dart';
import 'package:meta_shop/view/pages/cart/current_cart_model.dart';
import 'package:meta_shop/view/pages/detailedOrders/model/my_default_address.dart';

import '../../../components/component/baseWidget/base_widget.dart';

class DetailedOrderController extends GetxController {
  final currentCartModel = Rx<CurrentCartModel?>(null);
  final myDefaultAddressModel = Rx<MyDefaultAddressModel?>(null);
  final countriesModel = Rx<CountriesModel?>(null);

  final nameAddController = TextEditingController();
  final countriesController = DropdownController();
  final familyNameAddController = TextEditingController();
  final addressLineAddController = TextEditingController();
  final localityAddController = TextEditingController();
  final addressModel = Rx<AddressModel?>(null);
  final addFormKey = GlobalKey<FormState>();
  RxBool haveDefault = RxBool(false);
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;
  RxInt countryId = RxInt(-1);
  RxString countryShippingPrice = RxString('');

  DetailedOrderController(this.httpRepository, this.cacheUtils);

  addAddressASDefault(String profileId) async {
    try {
      var response = await httpRepository.addressASDefault(
        uId: cacheUtils.getUID(),
        flag: '2',
        profileId: profileId,
      );
      await getLocations();
      await getMyDefaultAddress();
      Get.snackbar(
        'make_it_default'.tr,
        'address_has_been_as_default_successfully'.tr,
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
    } catch (e) {
      Get.snackbar(
        'Make it default'.tr,
        'something_is_wrong'.tr,
        icon: const Icon(
          Icons.error,
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

  getLocations() async {
    try {
      var response = await httpRepository.getAddress(
        uId: cacheUtils.getUID(),
      );
      addressModel.value = response;
      await getMyDefaultAddress();
    } catch (e) {
      Get.snackbar(
        'Get Locations'.tr,
        'something_is_wrong'.tr,
        icon: const Icon(
          Icons.error,
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

  getMyDefaultAddress() async {
    try {
      var response = await httpRepository.getMyDefaultAddress(
        uId: cacheUtils.getUID(),
      );
      myDefaultAddressModel.value = response;
      myDefaultAddressModel.value!.data!.isEmpty
          ? haveDefault.value = false
          : haveDefault.value = true;
    } catch (e) {
      Get.snackbar(
        'My Default Address'.tr,
        'something_is_wrong'.tr,
        icon: const Icon(
          Icons.error,
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

  checkOUT({
    required String orderId,
    required String countryId,
  }) async {
    try {
      var response = await httpRepository.checkOut(
        uId: cacheUtils.getUID(),
        orderId: orderId,
        countryId: countryId,
      );

      Get.back(result: true);

      Future.delayed(const Duration(milliseconds: 500), () async {
        BaseWidgetState.numberItemNotifier.value =
            await ConstantActions.getCurrentCart();
      });
      Get.snackbar(
        'checkout'.tr,
        'order_completed'.tr,
        icon: const Icon(
          Icons.done,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColor.globalDefaultColor.withOpacity(0.9),
        borderRadius: 15,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        dismissDirection: DismissDirection.vertical,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      BaseWidgetState.numberItemNotifier.value = 0;
    } catch (e) {
      throw Exception('Checkout : $e');
    }
  }

  addAddress({
    required String addressLine,
    required String familyName,
    required String givenName,
    required String locality,
  }) async {
    try {
      var response = await httpRepository.addAddress(
        uId: cacheUtils.getUID(),
        addressLine1: addressLine,
        familyName: familyName,
        givenName: givenName,
        locality: locality,
      );
      Get.snackbar('add_address'.tr, 'address_added_successfully'.tr);
      nameAddController.text = '';
      familyNameAddController.text = '';
      addressLineAddController.text = '';
      localityAddController.text = '';
      await getLocations();
      await getMyDefaultAddress();
    } catch (e) {
      Get.snackbar(
        'add_address'.tr,
        'something_is_wrong'.tr,
        icon: const Icon(
          Icons.error,
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

  getCountries() async {
    try {
      var response = await httpRepository.getCountries();
      countriesModel.value = response;
    } catch (e) {
      Get.snackbar(
        'Get countries'.tr,
        'Something is wrong'.tr,
        icon: const Icon(
          Icons.warning,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColor.globalDefaultColor,
        borderRadius: 15,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeInCirc,
      );
      e.printError();
    }
  }

  double totalPrice(
      {required String totalOrderPriceAfter,
      required String countryShippingPrice}) {
    return double.parse(totalOrderPriceAfter) +
        double.parse(countryShippingPrice);
  }

  @override
  Future<void> onInit() async {
    currentCartModel.value = Get.arguments;
    await getLocations();
    await getMyDefaultAddress();
    await getCountries();
    myDefaultAddressModel.value!.data!.isEmpty
        ? haveDefault.value = false
        : haveDefault.value = true;
    super.onInit();
  }
}
