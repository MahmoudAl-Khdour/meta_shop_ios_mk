import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';

class EditInformationController extends GetxController {
  final formPersonalInformationKey = GlobalKey<FormState>();
  final formEditPasswordKey = GlobalKey<FormState>();
  final HttpRepository _httpRepository;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final repeatNewPasswordController = TextEditingController();
  final CacheUtils _cacheUtils;

  EditInformationController(this._httpRepository, this._cacheUtils);

  editPersonalInformation() async {
    try {
      var response = await _httpRepository.updateUserInformation(
        uId: _cacheUtils.getUID(),
        name: nameController.text,
        email: emailController.text,
        phone: phoneNumberController.text,
      );
      Get.snackbar('Edit personal information ', response!.msg!.message!);
      nameController.text = '';
      emailController.text = '';
      phoneNumberController.text = '';
      passwordController.text = '';
    } catch (e) {
      Get.snackbar('Edit personal information', 'error');
      e.printError();
    }
  }

  editPassword() async {
    try {
      var response = await _httpRepository.updateUserInformation(
        uId: _cacheUtils.getUID(),
        password: newPasswordController.text,
        currentPassword: _cacheUtils.getPass(),
      );
      Get.snackbar('Edit password ', response!.msg!.message!);
      newPasswordController.text = '';
      repeatNewPasswordController.text = '';
    } catch (e) {
      Get.snackbar('Edit password', 'error');
      e.printError();
    }
  }
}
