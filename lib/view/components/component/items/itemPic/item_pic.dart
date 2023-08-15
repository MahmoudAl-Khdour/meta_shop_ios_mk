import 'package:flutter/material.dart';
import 'package:meta_shop/res/assets_res.dart';
import 'package:meta_shop/services/urls/api_url.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';

class ItemPic extends StatelessWidget {
  String imagePath;
  void Function() onTap;

  ItemPic({
    Key? key,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          clipBehavior: Clip.antiAlias,
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              width: 0.1,
              color: AppColor.globalBorderColor,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: FadeInImage(
              fit: BoxFit.cover,
              imageErrorBuilder: (context, error, stackTrace) =>
                  const Image(image: AssetImage(AssetsRes.PLACEHOLDER)),
              placeholder: const AssetImage(AssetsRes.PLACEHOLDER),
              image: NetworkImage('${UrlAPI.baseUrlImage}$imagePath'),
            ),
          )),
    );
  }
}
