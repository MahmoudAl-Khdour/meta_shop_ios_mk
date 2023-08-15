import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/helper/helper_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';

import '../model/contact_information.dart';

class ContactUSController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;

  final formKey = GlobalKey<FormState>();
  final contactInformationModel = Rx<ContactInformationModel?>(null);
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  var image = ''.obs;
  RxBool enabled = false.obs;

  ContactUSController(this.httpRepository, this.cacheUtils);

  getContactInformation() async {
    try {
      var response = await httpRepository.getContactInformation();
      contactInformationModel.value = response;
    } catch (e) {
      Get.snackbar('Get Categories', 'error');
      e.printError();
    }
  }

  getFromGallery() async {
    var path = await HelperUtils.importImage();
    if (path != null) {
      image.value = path;
      enabled.value = true;
    }
  }

  sendContactData() async {
    try {
      var response = await httpRepository.contactUS(
        email: emailController.text,
        uId: cacheUtils.getUID(),
        name: nameController.value.text,
        message: messageController.value.text,
        phone: phoneController.value.text,
        subject: '',
      );
      Get.snackbar('Contact US', response!.msg!.message!);
    } catch (e) {
      Get.snackbar('Contact US', 'error');
      e.printError();
    }
  }

  @override
  void onInit() {
    getContactInformation();
    super.onInit();
  }
}
