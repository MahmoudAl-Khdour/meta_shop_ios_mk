import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/services/urls/api_url.dart';
import 'package:meta_shop/view/components/component/button/button/button.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';

class StoreItem extends StatelessWidget {
  String? image;
  String? catName;
  String? itemName;
  String? price;
  double? height;
  double? width;
  final void Function()? onTap;
  Function() onPressedAddButton;
  Function() onPressedFavButton;

  IconData? icon;
  Color? iconColor;
  int? fav;

  StoreItem({
    Key? key,
    required this.image,
    required this.onTap,
    required this.onPressedAddButton,
    this.height = 220,
    this.width = 180,
    this.icon = Icons.favorite_border,
    required this.catName,
    required this.itemName,
    required this.price,
    required this.onPressedFavButton,
    this.iconColor = Colors.black,
    required this.fav,
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
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(
              color: AppColor.globalBorderColor,
              width: 0.4,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CachedNetworkImage(
                      imageUrl: '${UrlAPI.baseUrlImage}$image',
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                Text(
                  itemName!,
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amberAccent,
                      size: 17,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amberAccent,
                      size: 17,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amberAccent,
                      size: 17,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amberAccent,
                      size: 17,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amberAccent,
                      size: 17,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.01,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '$price JOD',
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.01,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Button(
                        textColor: Colors.white,
                        width: 80,
                        height: 35,
                        radius: 50,
                        text: 'add_to_cart'.tr,
                        textSize: SizeConfig.screenWidth * 0.02 <= 15 ? 8 : 12,
                        onTap: onPressedAddButton,
                      ),
                    ),
                    IconButton(
                      onPressed: onPressedFavButton,
                      icon: Icon(
                        fav == 1 ? Icons.favorite : Icons.favorite_border,
                        color: fav == 1 ? Colors.red : Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
