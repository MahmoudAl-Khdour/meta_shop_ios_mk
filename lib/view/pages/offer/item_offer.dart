import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:meta_shop/services/urls/api_url.dart';
import 'package:meta_shop/view/components/component/button/button/button.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';

class ItemOffer extends StatelessWidget {
  String? image;
  String? catName;
  String? itemName;
  String? price;
  double? height;
  double? width;
  double? discountPercentage;
  final void Function()? onTap;
  Function() onPressedAddButton;
  Function() onPressedFavButton;
  Widget? button;
  IconData? icon;
  Color? iconColor;
  double? rate;

  ItemOffer({
    Key? key,
    required this.discountPercentage,
    required this.image,
    required this.onTap,
    required this.onPressedAddButton,
    this.height = 300,
    this.width = 180,
    this.icon = Icons.favorite_border,
    required this.catName,
    required this.itemName,
    required this.price,
    required this.onPressedFavButton,
    this.iconColor = Colors.black,
    this.button,
    this.rate = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  width: width,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 2,
                        offset: const Offset(
                          0,
                          3,
                        ),
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 2,
                        offset: const Offset(
                          3,
                          0,
                        ),
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 2,
                        offset: const Offset(
                          0,
                          -3,
                        ),
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 2,
                        offset: const Offset(
                          -3,
                          0,
                        ),
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white,
                        Colors.grey.shade50,
                        Colors.grey.shade100,
                        Colors.grey.shade200,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10, top: 1, right: 1, left: 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: CachedNetworkImageProvider(
                                      '${UrlAPI.baseUrlImage}$image')),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.005,
                        ),
                        Text(
                          itemName!,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.01,
                        ),
                        RatingBar.builder(
                          ignoreGestures: true,
                          glow: false,
                          updateOnDrag: false,
                          itemSize: 15,
                          initialRating: rate ?? 0,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          tapOnlyMode: true,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemPadding: const EdgeInsets.symmetric(
                            horizontal: 1.0,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$price JOD',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.01,
                        ),
                        button ?? Container(),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.01,
                        ),
                        Button(
                          textColor: Colors.white,
                          height: 35,
                          radius: 50,
                          text: 'add_to_cart'.tr,
                          textSize:
                              SizeConfig.screenWidth * 0.02 <= 15 ? 8 : 12,
                          onTap: onPressedAddButton,
                        ),
                      ],
                    ),
                  ),
                ),
                discountPercentage == 0
                    ? Container()
                    : Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                            color: AppColor.globalDefaultColor.withOpacity(0.7),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),
                            )),
                        child: Center(
                          child: Text('%${discountPercentage!.ceil()}'),
                        ),
                      ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 45,
                width: 45,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: onPressedFavButton,
                    icon: Icon(
                      icon,
                      color: iconColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
