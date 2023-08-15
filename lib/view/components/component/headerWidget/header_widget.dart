import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:meta_shop/view/components/component/button/iconButtonWidget/default_icon_button.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';

import '../../../../res/assets_res.dart';
import '../../../pages/cart/cart.dart';
import '../../../pages/profile/favorite/favorite.dart';

class HeaderWidget extends StatelessWidget {
  String? title;
  bool haveNotification;
  bool haveBack;
  bool haveCart;
  bool isHome;
  double sizeIcon;
  int numberCartItem;
  var colorContainer;
  final Function()? onTap;
  final Function() onPressed;

  HeaderWidget({
    Key? key,
    this.colorContainer,
    required this.title,
    this.isHome = false,
    this.haveCart = false,
    this.onTap,
    required this.onPressed,
    required this.haveNotification,
    this.haveBack = true,
    this.sizeIcon = 22.0,
    required this.numberCartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return isHome
        ? Row(
            children: [
              const Expanded(
                  child: Row(
                children: [
                  Image(
                      height: 80, width: 90, image: AssetImage(AssetsRes.LOGO)),
                ],
              )),
              Align(
                alignment: Alignment.topRight,
                child: Row(
                  children: [
                    Stack(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(() => const Cart());
                          },
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),

                        //cart Button
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColor.globalDefaultColor,
                          ),
                          child:  Center(
                              child: Text(
                                '$numberCartItem',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(const Favorite());
                      },
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  blurStyle: BlurStyle.solid,
                  offset: const Offset(
                    0,
                    3,
                  ),
                ),
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  blurStyle: BlurStyle.solid,
                  offset: const Offset(
                    3,
                    0,
                  ),
                ),
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  blurStyle: BlurStyle.solid,
                  offset: const Offset(
                    0,
                    -3,
                  ),
                ),
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  blurStyle: BlurStyle.solid,
                  offset: const Offset(
                    -3,
                    0,
                  ),
                ),
              ],
            ),
            height: 65,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Center(
                child: AppBar(
                  elevation: 0,
                  iconTheme: const IconThemeData(
                    color: AppColor.globalIconColor,
                  ),
                  title: Text(
                    title!,
                    style: const TextStyle(
                      color: AppColor.globalTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: haveBack
                      ? DefaultIconButton(
                          icon: FontAwesomeIcons.arrowRight,
                          borderWidth: 0.3,
                          iconColor: AppColor.globalIconColor,
                          width: 40,
                          height: 40,
                          borderColor: AppColor.globalDefaultColor,
                          background: Colors.white,
                          onPressed: onPressed,
                          radius: 50,
                          iconSize: 20,
                        )
                      : null,
                  actions: [
                    haveCart
                        ? Stack(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.to(() => const Cart())!;
                                },
                                icon: const Icon(
                                  Icons.shopping_cart_outlined,
                                  size: 30,
                                  color: AppColor.globalIconColor,
                                ),
                              ),
                              //cart Button
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: AppColor.globalDefaultColor,
                                ),
                                child: Center(
                                  child: Text(
                                    '$numberCartItem',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                  backgroundColor: Colors.white.withOpacity(0.0),
                  centerTitle: true,
                ),
              ),
            ),
          );
  }
}
