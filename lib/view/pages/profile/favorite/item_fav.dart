import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:meta_shop/res/assets_res.dart';
import 'package:meta_shop/services/urls/api_url.dart';

import '../../../components/component/button/button/button.dart';
import '../../../components/component/size_config/size_config.dart';

class ItemFav extends StatelessWidget {
  String? image;
  String? catName;
  String? itemName;
  String? price;
  double? height;
  double? width;
  double? rate;

  final void Function()? onTap;
  Function() onPressedAddButton;
  Function() onPressedFavButton;

  IconData? icon;
  Color? iconColor;

  ItemFav({
    Key? key,
    required this.image,
    required this.onTap,
    required this.onPressedAddButton,
    this.height = 300,
    this.width = 180,
    this.rate = 0.0,
    this.icon = Icons.favorite_border,
    required this.catName,
    required this.itemName,
    required this.price,
    required this.onPressedFavButton,
    this.iconColor = Colors.black,
  });

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
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey.shade100,
                Colors.grey.shade100,
                Colors.grey.shade300,
                Colors.grey.shade200,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(

                    height: 250,
                    width: 250,
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(15)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                              '${UrlAPI.baseUrlImage}$image')

                      ),

                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    catName!,
                    style: const TextStyle(fontSize: 10),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.005,
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
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.01,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Button(
                        textColor: Colors.white,
                        width: 100,
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
                        icon,
                        color: iconColor,
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
