import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta_shop/binding/app_bindings.dart';
import 'package:meta_shop/services/helper/app_translations.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';
import 'package:meta_shop/services/repository/http_repository_impl.dart';
import 'package:meta_shop/view/components/component/baseWidget/base_widget.dart';
import 'package:meta_shop/view/components/constants/constant_data/constant_data.dart';
import 'package:meta_shop/view/pages/login/login.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'model/flag_model.dart';

const String appID = 'c278b53c-88a5-4c3c-ae59-ce17caac2a5b';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // await Firebase.initializeApp();

  await OneSignal.shared.setAppId(appID);

  OneSignal.shared
      .promptUserForPushNotificationPermission(fallbackToSettings: true)
      .then((accepted) {});

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  void initialization() async {
    Response? flagResponse;
    HttpRepository httpRepository = HttpRepositoryImpl();
    CacheUtils cacheUtils = CacheUtils(GetStorage());
    FlagModel? flagModel;
    flagResponse = await httpRepository.flagApi();
    flagModel = FlagModel.fromJson(flagResponse!.body);
    bool? flag = flagModel.status;
    print('\n\n\n\n mk flag: $flag \n\n\n\n\n\n');

    if (flag == true) {
      await cacheUtils.saveFlag(flag: true);
      MySingleton.instance.setFlag = true;
      // Get.offAll(() => const BaseWidget());
    } else if (flag == false) {
      MySingleton.instance.setFlag = false;
      await cacheUtils.saveFlag(flag: false);
    }
  }

  Future<void> checkDeviceManufacturer() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    CacheUtils cacheUtils = CacheUtils(GetStorage());

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      if (androidInfo.brand.toLowerCase() == 'huawei') {
        await cacheUtils.phoneType(isHuawei: true);
        print('\n\n\n\n\n is  huawei \n\n\n\n\n\n');
      } else {
        await cacheUtils.phoneType(isHuawei: false);
        print('\n\n\n\n\n is not huawei \n\n\n\n\n\n');
      }
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      await cacheUtils.phoneType(isHuawei: false);
      print('\n\n\n\n\n is not huawei \n\n\n\n\n\n');
    }
  }

  @override
  void initState() {
    checkDeviceManufacturer();
    initialization();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meta Shop'.tr,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: checkInitialPage(),
      translations: LocaleString(),
      locale: const Locale('ar'),
      fallbackLocale: const Locale('ar'),
      initialBinding: AppBindings(),
    );
  }
}

Widget checkInitialPage() {
  final cacheUtils = Get.put(CacheUtils(GetStorage()), permanent: true);
  if (cacheUtils.isUserLoggedIn()) {
    return const BaseWidget();
  } else {
    return const Login();
  }
}
