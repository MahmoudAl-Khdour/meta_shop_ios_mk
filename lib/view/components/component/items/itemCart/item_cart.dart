import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/services/urls/api_url.dart';
import 'package:meta_shop/view/components/component/button/counterButton/counter_button.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';

class ItemCart extends StatelessWidget {
  final void Function(int) onChange;
  final void Function() onPressed;
  final String? itemName;
  final String? itemPrice;
  final String? itemImage;
  final int? counterValue;
  Color countColor = AppColor.globalDefaultColor;
  Color buttonColor = AppColor.globalDefaultColor;
  Color progressColor = AppColor.globalDefaultColor;

  ItemCart({
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
    required this.onChange,
    required this.counterValue,
    required this.onPressed,
    required this.countColor,
    required this.buttonColor,
    required this.progressColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              itemName!,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: RichText(
                text: TextSpan(
                    text: 'Item Price:'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    children: [
                  TextSpan(
                      text: ' $itemPrice ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      )),
                  TextSpan(
                      text: 'JOD',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ))
                ])),
          ),
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      CounterButton(
                        loading: false,
                        onChange: onChange,
                        count: counterValue!,
                        countColor: countColor,
                        buttonColor: buttonColor,
                        progressColor: progressColor,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      IconButton(
                        highlightColor: Colors.red,
                        onPressed: onPressed,
                        icon: const Icon(
                          Icons.delete,
                          size: 27,
                          color: AppColor.globalIconColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                  left: 15,
                  bottom: 15,
                ),
                child: CachedNetworkImage(
                  width: 122,
                  height: 122,
                  fit: BoxFit.fill,
                  imageUrl: '${UrlAPI.baseUrlImage}$itemImage',
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
