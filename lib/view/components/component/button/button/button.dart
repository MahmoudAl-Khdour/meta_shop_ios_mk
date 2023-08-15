import 'package:flutter/material.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';

class Button extends StatelessWidget {
  final double width;
  final double height;
  final Color background;
  final bool isUpperCase;
  final double radius;
  final Function() onTap;
  final String text;
  final bool withIcon;
  final double textSize;
  final Color textColor;
  final bool isGoogle;
  final IconData? icon;
  final Color colorIcon;
  final Color? color;

  const Button({
    Key? key,
    required this.onTap,
    required this.text,
    this.textSize = 15,
    this.icon,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height = 60,
    this.background = AppColor.globalDefaultColor,
    this.isUpperCase = false,
    this.radius = 0,
    this.withIcon = false,
    this.isGoogle = false,
    this.colorIcon = Colors.white,
    this.color = AppColor.globalDefaultColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: Center(
            child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            maximumSize: Size(width, height),
            minimumSize: Size(width, height),
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          onPressed: onTap,
          child: Text(
            maxLines: 1,
            textAlign: TextAlign.center,
            text,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: textSize,
            ),
          ),
        )),
      ),
    );
  }
}
