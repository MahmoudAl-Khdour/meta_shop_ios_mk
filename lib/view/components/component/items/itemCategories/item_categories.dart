import 'package:flutter/material.dart';
import 'package:meta_shop/res/assets_res.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';

class ItemCategories extends StatelessWidget {
  ItemCategories({
    Key? key,
    required this.onTap,
    required this.name,
    required this.image,
  }) : super(key: key);

  String name;
  String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
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
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeInImage(
                  imageErrorBuilder: (context, error, stackTrace) =>
                      const Image(
                    height: 30,
                    width: 30,
                    image: AssetImage(AssetsRes.PLACEHOLDER),
                  ),
                  height: 30,
                  width: 30,
                  image: NetworkImage(image),
                  placeholder: const AssetImage(AssetsRes.PLACEHOLDER),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: AppColor.globalTextColor,
                    fontSize: 12,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
