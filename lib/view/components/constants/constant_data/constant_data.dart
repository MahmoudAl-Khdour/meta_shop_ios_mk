import 'package:get/get.dart';
import 'package:meta_shop/model/itemModel/bottom_nav_bar_model.dart';

import '../../../pages/home/home_screen.dart';
import '../../../pages/more/more.dart';
import '../../../pages/new/new_products.dart';
import '../../../pages/offer/offers.dart';
import '../../../pages/store/store.dart';
import '../../../pages/user/user.dart';
import '../../component/routes/routes.dart';

int currentPageIndex = 0;

List<BottomNavBarModel> bottomNavBar = [
  BottomNavBarModel(
    widget: const HomeScreen(),
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

class MySingleton {
  int? _numberItem;
  bool? _loginFlag = false;

  // Private constructor
  MySingleton._privateConstructor();

  // Singleton instance
  static final MySingleton _instance = MySingleton._privateConstructor();

  // Getter for the instance
  static MySingleton get instance => _instance;

  // Getter for receiverId
  int? get numberItem => _numberItem;

  // Setter for receiverId
  set setNumberItem(int? value) {
    _numberItem = value;
  }

  bool? get getFlag => _loginFlag;

  set setFlag(bool? value) {
    _loginFlag = value;
  }
}
