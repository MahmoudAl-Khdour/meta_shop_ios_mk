import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';

import '../size_config/size_config.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown({
    Key? key,
    required this.onChange,
    required this.dropdownController,
    this.openBoxColor = Colors.white,
    required this.items,
    required this.screenWidth,
    required this.haveAnother,
    this.itemWidth,
    this.numberItem,
    this.paddingWidth,
    required this.placeholder,
    this.colorItem = Colors.white,
    this.borderItemColor = Colors.white,
    this.radius = 0,
    this.placeHolderStyle = const TextStyle(
      color: AppColor.globalDefaultColor,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
  }) : super(key: key);

  DropdownController dropdownController;
  List<Map<int, String>> items;
  void Function(int value) onChange;
  double screenWidth;
  double? itemWidth;
  double? numberItem;
  double? paddingWidth;
  double radius;
  Color colorItem;
  Color borderItemColor;
  bool haveAnother;
  String placeholder;
  Color openBoxColor;
  TextStyle? placeHolderStyle;

  @override
  Widget build(BuildContext context) {
    return CoolDropdown(
      controller: dropdownController,
      dropdownList: items
          .map(
            (e) => CoolDropdownItem(
              label: e.values.single,
              value: e.keys.single,
            ),
          )
          .toList(),
      onChange: onChange,
      onOpen: (value) {},
      resultOptions: ResultOptions(
        placeholderTextStyle: placeHolderStyle!,
        padding: EdgeInsets.symmetric(
          horizontal: haveAnother ? 10 : paddingWidth!,
        ),
        width: haveAnother
            ? (screenWidth - paddingWidth!) / numberItem!
            : itemWidth!,
        boxDecoration: BoxDecoration(
          color: colorItem,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: borderItemColor,
          ),
        ),
        icon: const SizedBox(
          width: 10,
          height: 10,
          child: CustomPaint(
            painter: DropdownArrowPainter(),
          ),
        ),
        render: ResultRender.all,
        placeholder: placeholder,
        textStyle: const TextStyle(
          color: AppColor.globalDefaultColor,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        openBoxDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: openBoxColor,
            border: Border.all(
              color: Colors.white,
            )),
        errorBoxDecoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
        ),
        isMarquee: true,
      ),
      dropdownOptions: DropdownOptions(
        borderRadius: BorderRadius.circular(30),
        top: 20,
        height: 250,
        width: SizeConfig.screenWidth - 25,
        gap: const DropdownGap.all(5),
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        borderSide: const BorderSide(
          style: BorderStyle.solid,
          color: Colors.white,
        ),
        align: DropdownAlign.left,
        animationType: DropdownAnimationType.size,
      ),
      dropdownTriangleOptions: const DropdownTriangleOptions(
        width: 0,
        height: 0,
        borderRadius: 0,
      ),
      dropdownItemOptions: DropdownItemOptions(
        selectedTextStyle: const TextStyle(
          color: Colors.white,
        ),
        textStyle: const TextStyle(
          color: AppColor.globalDefaultColor,
        ),
        selectedBoxDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColor.globalDefaultColor.withOpacity(0.7),
          border: Border.all(
            color: AppColor.globalDefaultColor,
            width: 0.4,
          ),
        ),
        isMarquee: true,
        mainAxisAlignment: MainAxisAlignment.start,
        render: DropdownItemRender.all,
        height: 50,
        boxDecoration: BoxDecoration(
          color: AppColor.globalIconColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: AppColor.globalIconColor,
          ),
        ),
      ),
    );
  }
}
