import 'package:flutter/material.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';

class DefaultIconButton extends StatelessWidget {
  const DefaultIconButton({
    Key? key,
    required this.onPressed,
    this.haveText = false,
    this.icon = Icons.import_contacts_sharp,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
    this.borderColor = Colors.white,
    this.width = 62,
    this.height = 62,
    this.iconSize,
    this.isImage = false,
    this.image = '',
    this.background = AppColor.globalDefaultColor,
    this.isUpperCase = false,
    this.radius = 0,
    this.borderWidth = 1,
  }) : super(key: key);

  final bool haveText;
  final double width;
  final double borderWidth;
  final double height;
  final Color background;
  final Color borderColor;
  final Color iconColor;
  final double? iconSize;
  final bool isUpperCase;
  final bool isImage;
  final String image;
  final double radius;
  final Function() onPressed;
  final IconData icon;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
      iconSize: iconSize,
      color: iconColor,
    );
  }
}
