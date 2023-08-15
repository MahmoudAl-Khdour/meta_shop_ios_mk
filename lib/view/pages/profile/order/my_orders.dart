import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/view/components/component/items/my_order_item/my_order_item.dart';

import '../../../../res/assets_res.dart';
import '../../../components/component/headerWidget/header_widget.dart';
import '../../../components/component/size_config/size_config.dart';
import 'controller/my_order_controller.dart';

class MyOrders extends GetWidget<MyOrderController> {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: SizeConfig.screenHeight,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AssetsRes.BACKGROUND_1,
                ))),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 70,
              ),
              child: Obx(() {
                return controller.viewAllOrderModel.value == null
                    ? const Center(child: CircularProgressIndicator())
                    : controller.viewAllOrderModel.value!.msg!.status == 0
                        ? Center(
                            child: Text(
                              'no_item_in_order'.tr,
                              style: TextStyle(
                                fontSize: 23,
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ),
                          )
                        : ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 10,
                            ),
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 20,
                              right: 15,
                              left: 15,
                            ),
                            clipBehavior: Clip.hardEdge,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: controller
                                .viewAllOrderModel.value!.data!.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return MyOrderItem(
                                total: controller.viewAllOrderModel.value!
                                    .data![index].totalOrderPriceAfter!,
                                date: controller.viewAllOrderModel.value!
                                    .data![index].date!,
                                state: controller.viewAllOrderModel.value!
                                    .data![index].state!,
                                items: controller.viewAllOrderModel.value!
                                    .data![index].items!,
                              );
                            },
                          );
              }),
            ),
            HeaderWidget(
              numberCartItem: 0,
              haveBack: false,
              title: 'my_orders'.tr,
              onPressed: () {
                Get.back();
              },
              haveNotification: false,
            ),
          ],
        ),
      )),
    );
  }
}
