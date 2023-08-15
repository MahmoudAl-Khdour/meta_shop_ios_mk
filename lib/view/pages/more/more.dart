import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/view/components/component/items/itemMore/item_more.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';

import 'controller/more_controller.dart';

class More extends GetWidget<MoreController> {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.only(
        top: 65,
        left: 15,
        right: 15,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: SizedBox(
          height: SizeConfig.screenHeight,
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              bottom: 24,
              top: 10,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              //childAspectRatio: ,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
            ),
            itemCount: controller.itemMoreList.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemMore(
                onTap: controller.itemMoreList[index].onTap,
                icon: controller.itemMoreList[index].icon,
                text: controller.itemMoreList[index].name,
              );
            },
          ),
        ),
      ),
    );
  }
}
