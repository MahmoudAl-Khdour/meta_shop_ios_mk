import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';

import '../model/address_model.dart';

class AddressController extends GetxController {
  final HttpRepository _httpRepository;
  final CacheUtils _cacheUtils;
  final addressModel = Rx<AddressModel?>(null);
  final selectedMenu = Rx<String?>(null);
  final index = Rx<int?>(null);
  final editFormKey = GlobalKey<FormState>();
  final addFormKey = GlobalKey<FormState>();

  final nameUpdateController = TextEditingController();
  final familyNameUpdateController = TextEditingController();
  final addressLineUpdateController = TextEditingController();
  final localityUpdateController = TextEditingController();

  final nameAddController = TextEditingController();
  final familyNameAddController = TextEditingController();
  final addressLineAddController = TextEditingController();
  final localityAddController = TextEditingController();

  AddressController(this._httpRepository, this._cacheUtils);

  getLocations() async {
    try {
      var response = await _httpRepository.getAddress(
        uId: _cacheUtils.getUID(),
      );
      addressModel.value = response;
    } catch (e) {
      Get.snackbar('Get Locations', 'error');
      e.printError();
    }
  }

  deleteAddress(String profileId) async {
    try {
      var response = await _httpRepository.deleteAddress(
        uId: _cacheUtils.getUID(),
        flag: '1',
        profileId: profileId,
      );
      getLocations();
    } catch (e) {
      Get.snackbar('Get Categories', 'error');
      e.printError();
    }
  }

  addAddressASDefault(String profileId) async {
    print(' \n\n\n\n\n Inside profileId \n\n\n\n\n');
    print(' \n\n\n\n\n profileId $profileId \n\n\n\n\n');

    try {
      var response = await _httpRepository.addressASDefault(
        uId: _cacheUtils.getUID(),
        flag: '2',
        profileId: profileId,
      );
      getLocations();
      Get.snackbar('Make it default', response!.msg!.message!);
    } catch (e) {
      Get.snackbar('Get Categories', 'error');
      e.printError();
    }
  }

  editAddress({
    required String profileId,
    required String addressLine,
    required String familyName,
    required String givenName,
    required String locality,
  }) async {
    try {
      var response = await _httpRepository.updateAddress(
        uId: _cacheUtils.getUID(),
        profileId: profileId,
        addressLine1: addressLine,
        familyName: familyName,
        givenName: givenName,
        locality: locality,
      );
      Get.snackbar('Update Address', response!.msg!.message!);
      nameUpdateController.text = '';
      familyNameUpdateController.text = '';
      addressLineUpdateController.text = '';
      localityUpdateController.text = '';
      getLocations();
    } catch (e) {
      Get.snackbar('Update Address', 'error');
      e.printError();
    }
  }

  addAddress({
    required String addressLine,
    required String familyName,
    required String givenName,
    required String locality,
  }) async {
    try {
      var response = await _httpRepository.addAddress(
        uId: _cacheUtils.getUID(),
        addressLine1: addressLine,
        familyName: familyName,
        givenName: givenName,
        locality: locality,
      );
      Get.snackbar('Add Address', response!.msg!.message!);
      nameAddController.text = '';
      familyNameAddController.text = '';
      addressLineAddController.text = '';
      localityAddController.text = '';
      getLocations();
    } catch (e) {
      Get.snackbar('Add Address', 'error');
      e.printError();
    }
  }

  @override
  void onInit() {
    getLocations();
    super.onInit();
  }
}
