import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta_shop/model/flag_model.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';
import 'package:meta_shop/view/components/constants/constant_data/constant_data.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../../components/component/baseWidget/base_widget.dart';

class SignupController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final numberPhoneController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  SignupController(this.httpRepository, this.cacheUtils);

  Rx<IconData> icoPass = Icons.visibility_outlined.obs;
  Rx<IconData> icoRepeatPass = Icons.visibility_outlined.obs;
  RxBool hidePass = true.obs;
  RxBool hideRepeatPass = true.obs;
  RxInt social = 0.obs;

  RxBool isHuawei = false.obs;
  Rx<bool?> flagUser = Rx<bool?>(null);

  void initialization() async {
    try {
      Response? flagResponse;
      // HttpRepository httpRepository = HttpRepositoryImpl();
      // CacheUtils cacheUtils = CacheUtils(GetStorage());
      FlagModel? flagModel;
      flagResponse = await httpRepository.flagApi();
      flagModel = FlagModel.fromJson(flagResponse!.body);
      bool? flag = flagModel.status;
      print('\n\n\n\n mk flag: $flag \n\n\n\n\n\n');

      if (flag == true) {
        await cacheUtils.saveFlag(flag: true);
        MySingleton.instance.setFlag = true;
        flagUser.value = true;
        // Get.offAll(() => const BaseWidget());
      } else if (flag == false) {
        MySingleton.instance.setFlag = false;
        await cacheUtils.saveFlag(flag: false);
        flagUser.value = false;
      }
    } catch (e) {
      flagUser.value = false;
    }
  }

  hidePassFun() {
    if (hidePass.value) {
      hidePass.value = false;
      icoPass.value = Icons.visibility_off_outlined;
      return;
    } else {
      hidePass.value = true;
      icoPass.value = Icons.visibility_outlined;
      return;
    }
  }

  hideRepeatPassFun() {
    if (hideRepeatPass.value) {
      hideRepeatPass.value = false;
      icoRepeatPass.value = Icons.visibility_off_outlined;
      return;
    } else {
      hideRepeatPass.value = true;
      icoRepeatPass.value = Icons.visibility_outlined;
      return;
    }
  }

  void userSignUp() async {
    var status = await OneSignal.shared.getDeviceState();
    if (status == null || status.userId == null) {
      return;
    }
    String playerId = status.userId!;
    try {
      var response = await httpRepository.signUp(
        fullName: nameController.text,
        email: emailController.text,
        phoneNumber: numberPhoneController.text,
        password: passwordController.text,
        social: '$social',
        playerId: playerId,
      );
      if (response!.msg!.status! == 200 || response.msg!.status! == 1) {
        await cacheUtils.saveUserData(
          userId: response.data!.id!,
          userName: response.data!.userName!,
          userPass: passwordController.text,
          userEmail: response.data!.email!,
        );
        Get.off(const BaseWidget());
      }
      Get.snackbar('Signup', response.msg!.message!);
    } catch (e) {
      Get.snackbar('Signup', 'error');
      e.printError();
    }
  }

  // facebookSignUp() async {
  //   try {
  //     final result =
  //         await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
  //     if (result.status == LoginStatus.success) {
  //       try {
  //         final userData = await FacebookAuth.i.getUserData();
  //         emailController.text = userData['email'] ?? '';
  //         nameController.text = userData['name'] ?? '';
  //         // userLoginWithSocial(email: userData['email'] ?? '');
  //       } catch (e) {
  //         print('\n\n\n\n\n\n\n isBlank ${e.isBlank} \n\n\n\n\n\n\n');
  //         e.printError();
  //         print('\n\n\n\n\n\n\n\n\n\n e $e \n\n\n\n\n\n\n\n\n\n\n\n\n\n');
  //       }
  //     }
  //   } catch (error) {
  //     print('\n\n\n\n\n\n\n\n\n\n error $error \n\n\n\n\n\n\n\n\n\n\n\n\n\n');
  //   }
  // }

  googleSignUp() async {
    GoogleSignInAccount? currentUser = await GoogleSignIn().signIn();
    if (currentUser != null) {
      emailController.text = currentUser.email;
      nameController.text = currentUser.displayName ?? "";
      // await userLoginWithSocial(email: email);
      // send this data to your API using the HTTP package
    }
  }

  @override
  Future<void> onInit() async {
    isHuawei.value = cacheUtils.getPhoneType() ?? false;
    initialization();

    super.onInit();
  }
}
