import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta_shop/view/components/component/button/button/button.dart';
import 'package:meta_shop/view/components/component/text_filed/text_form_filed_widget.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:meta_shop/view/pages/address/controller/address_controller.dart';

class EditAddress extends GetWidget<AddressController> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: Form(
        key: controller.editFormKey,
        child: Column(
          children: [
            DefaultFormField(
              validator: (value) {
                if ((value == null || value.isEmpty) &&
                    (controller.familyNameUpdateController.text.isEmpty) &&
                    (controller.localityUpdateController.text.isEmpty) &&
                    (controller.addressLineUpdateController.text.isEmpty)) {
                  return 'name_required'.tr;
                }
                return null;
              },
              controller: controller.nameUpdateController,
              hint: 'user_name'.tr,
              isPassword: false,
              enabled: true,
              readOnly: false,
              radius: 15,
              autofocus: false,
              focusBorderColor: AppColor.globalDefaultColor,
              textColor: AppColor.globalDefaultColor,
            ),
            const SizedBox(
              height: 10,
            ),
            DefaultFormField(
              validator: (value) {
                if ((value == null || value.isEmpty) &&
                    (controller.nameUpdateController.text.isEmpty) &&
                    (controller.localityUpdateController.text.isEmpty) &&
                    (controller.addressLineUpdateController.text.isEmpty)) {
                  return 'family_name_required'.tr;
                }
                return null;
              },
              controller: controller.familyNameUpdateController,
              hint: 'family_name'.tr,
              isPassword: false,
              enabled: true,
              readOnly: false,
              radius: 15,
              autofocus: false,
              focusBorderColor: AppColor.globalDefaultColor,
              textColor: AppColor.globalDefaultColor,
            ),
            const SizedBox(
              height: 10,
            ),
            DefaultFormField(
              validator: (value) {
                if ((value == null || value.isEmpty) &&
                    (controller.familyNameUpdateController.text.isEmpty) &&
                    (controller.nameUpdateController.text.isEmpty) &&
                    (controller.addressLineUpdateController.text.isEmpty)) {
                  return 'locality_required'.tr;
                }
                return null;
              },
              controller: controller.localityUpdateController,
              hint: 'locality'.tr,
              isPassword: false,
              enabled: true,
              readOnly: false,
              radius: 15,
              autofocus: false,
              focusBorderColor: AppColor.globalDefaultColor,
              textColor: AppColor.globalDefaultColor,
            ),
            const SizedBox(
              height: 10,
            ),
            DefaultFormField(
              validator: (value) {
                if ((value == null || value.isEmpty) &&
                    (controller.familyNameUpdateController.text.isEmpty) &&
                    (controller.localityUpdateController.text.isEmpty) &&
                    (controller.nameUpdateController.text.isEmpty)) {
                  return 'name_street_is_required'.tr;
                }
                return null;
              },
              controller: controller.addressLineUpdateController,
              hint: 'address_line'.tr,
              isPassword: false,
              enabled: true,
              readOnly: false,
              radius: 15,
              autofocus: false,
              focusBorderColor: AppColor.globalDefaultColor,
              textColor: AppColor.globalDefaultColor,
            ),
            const SizedBox(
              height: 10,
            ),
            Button(
              height: 50,
              radius: 15,
              onTap: () {
                if (controller.editFormKey.currentState!.validate()) {
                  controller.editAddress(
                    familyName: controller
                        .addressModel
                        .value!
                        .data![controller.index.value!]
                        .fullAddress!
                        .familyName!,
                    locality: controller.addressModel.value!
                        .data![controller.index.value!].fullAddress!.locality!,
                    givenName: controller.addressModel.value!
                        .data![controller.index.value!].fullAddress!.givenName!,
                    profileId: controller.addressModel.value!
                        .data![controller.index.value!].profileId!,
                    addressLine: controller
                        .addressModel
                        .value!
                        .data![controller.index.value!]
                        .fullAddress!
                        .addressLine1!,
                  );
                }
              },
              text: 'Edit',
            ),
          ],
        ),
      ),
    );
  }
}
