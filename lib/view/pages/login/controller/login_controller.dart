import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta_shop/model/flag_model.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';
import 'package:meta_shop/view/components/constants/constant_data/constant_data.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:meta_shop/view/pages/login/model/login_model.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../components/component/baseWidget/base_widget.dart';

class LoginController extends GetxController {
  final HttpRepository _httpRepository;
  final CacheUtils cacheUtils;
  final Uri url = Uri.parse('https://metashopjo.net/ar/user/password');
  // static final facebook = FacebookLogin();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Rx<bool?> flagUser = Rx<bool?>(null);

  RxBool isLoggedIn = false.obs;

  RxBool isHuawei = false.obs;

  Map? userObj;

  Rx<LoginModel?> loginModel = Rx<LoginModel?>(null);

  Rx<IconData> ico = Icons.visibility_outlined.obs;
  RxBool hidePass = true.obs;

  LoginController(this._httpRepository, this.cacheUtils);

  hidePassFun() {
    if (hidePass.value) {
      hidePass.value = false;
      ico.value = Icons.visibility_off_outlined;
      return;
    } else {
      hidePass.value = true;
      ico.value = Icons.visibility_outlined;
      return;
    }
  }

  googleLogin() async {
    GoogleSignInAccount? currentUser = await GoogleSignIn().signIn();
    if (currentUser != null) {
      String email = currentUser.email;
      String name = currentUser.displayName ?? "";
      String photoUrl = currentUser.photoUrl ?? "";
      await userLoginWithSocial(email: email);
      // send this data to your API using the HTTP package
    }
  }

  // facebookLogin() async {
  //   try {
  //     final result = await facebook.logIn(permissions: [
  //       FacebookPermission.publicProfile,
  //       FacebookPermission.email,
  //     ]);
  //     if (result.status == FacebookLoginStatus.success) {
  //       try {
  //         final userData = await FacebookAuth.instance.getUserData();
  //         userLoginWithSocial(
  //           email: userData['email'] ?? '',
  //         );
  //       } catch (e) {
  //         e.printError();
  //       }
  //     }
  //   } catch (error) {
  //     error.printError();
  //   }
  // }

  userLogin() async {
    var status = await OneSignal.shared.getDeviceState();
    if (status == null || status.userId == null) {
      return;
    }
    String playerId = status.userId!;
    // _cacheUtils.savePlayerKey(playerKey: playerId);
    try {
      var response = await _httpRepository.login(
        email: emailController.text,
        password: passwordController.text,
        playerId: playerId,
        social: '0',
      );
      if (response == null) {
        return;
      }

      Get.snackbar(
        'login'.tr,
        'login_successfully'.tr,
        icon: const Icon(
          Icons.login,
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
      await cacheUtils.saveUserData(
        userId: response.data!.id!,
        userName: response.data!.userName!,
        userPass: passwordController.text,
        userEmail: response.data!.email!,
      );
      Get.offAll(const BaseWidget());
    } catch (e) {
      Get.snackbar(
        'login'.tr,
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

  void initialization() async {
    try {
      Response? flagResponse;
      // HttpRepository httpRepository = HttpRepositoryImpl();
      // CacheUtils cacheUtils = CacheUtils(GetStorage());
      FlagModel? flagModel;
      flagResponse = await _httpRepository.flagApi();
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

  userLoginWithSocial({required String email}) async {
    var status = await OneSignal.shared.getDeviceState();
    if (status == null || status.userId == null) {
      return;
    }
    String playerId = status.userId!;
    try {
      var response = await _httpRepository.login(
        email: email,
        password: "",
        playerId: playerId,
        social: '1',
      );
      if (response == null) {
        return;
      }
      Get.snackbar(
        'login'.tr,
        'login_successfully'.tr,
        icon: const Icon(
          Icons.login,
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
      await cacheUtils.saveUserData(
        userId: response.data!.id!,
        userName: response.data!.userName!,
        userPass: "",
        userEmail: email,
      );
      Get.offAll(const BaseWidget());
    } catch (e) {
      Get.snackbar(
        'login'.tr,
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

  Future<void> useLaunchUrl() async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Future<void> onInit() async {
    isHuawei.value = cacheUtils.getPhoneType() ?? false;
    initialization();
    super.onInit();
  }
}
