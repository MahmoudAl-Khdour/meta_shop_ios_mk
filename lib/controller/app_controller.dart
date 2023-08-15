import 'package:get/get.dart';
import 'package:meta_shop/model/itemModel/bottom_nav_bar_model.dart';
import 'package:meta_shop/view/components/component/routes/routes.dart';
import 'package:meta_shop/view/pages/home/home_screen.dart';
import 'package:meta_shop/view/pages/more/more.dart';
import 'package:meta_shop/view/pages/offer/offers.dart';
import 'package:meta_shop/view/pages/store/store.dart';
import 'package:meta_shop/view/pages/user/user.dart';

import '../view/pages/new/new_products.dart';

class AppController extends GetxController {
  Rx<int> index = Rx<int>(0);

  List<BottomNavBarModel> bottomNavBar = [
    BottomNavBarModel(
      widget: HomeScreen(),
      navBarItem: NavBarItem.home,
      name: 'home'.tr,
      nameRoute: Routes.home,
    ),
    BottomNavBarModel(
      widget: const Store(),
      navBarItem: NavBarItem.store,
      name: 'store'.tr,
      nameRoute: Routes.store,
    ),
    BottomNavBarModel(
      widget: const NewProducts(),
      navBarItem: NavBarItem.sell,
      name: 'new_products'.tr,
      nameRoute: Routes.newProducts,
    ),
    BottomNavBarModel(
      widget: const Offers(),
      navBarItem: NavBarItem.offer,
      name: 'offers'.tr,
      nameRoute: Routes.offers,
    ),
    BottomNavBarModel(
      widget: const More(),
      navBarItem: NavBarItem.more,
      name: 'more'.tr,
      nameRoute: Routes.more,
    ),
    BottomNavBarModel(
      nameRoute: Routes.user,
      widget: const User(),
      name: 'User',
      navBarItem: NavBarItem.user,
    ),
  ];
}
