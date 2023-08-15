import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/view/components/component/size_config/size_config.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
import 'package:meta_shop/view/pages/profile/order/controller/my_order_controller.dart';
import 'package:meta_shop/view/pages/profile/order/model/view_all_order_model.dart';

class MyOrderItem extends GetWidget<MyOrderController> {
  final String date;
  final String state;
  final String total;
  final List<Items> items;

  const MyOrderItem({
    required this.total,
    required this.state,
    required this.date,
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return items.isEmpty
        ? Container()
        : Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
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
            ),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Column(
                  children: [
                    Text(
                      date,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      state,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    items.isEmpty
                        ? Container()
                        : ListView.separated(
                            physics: const ScrollPhysics(),
                            clipBehavior: Clip.hardEdge,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: items.length,
                            separatorBuilder: (context, index) => Divider(
                              height: 1,
                              indent: 30,
                              endIndent: SizeConfig.screenWidth * 0.08,
                              color:
                                  AppColor.globalDefaultColor.withOpacity(0.5),
                            ),
                            itemBuilder: (BuildContext ctx, index) {
                              return Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${items[index].quantity}x',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '${items[index].title}x',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '${items[index].unitPrice} JD',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                            },
                          ),
                    Divider(
                      color: AppColor.globalDefaultColor.withOpacity(0.5),
                      endIndent: 20,
                      indent: 20,
                    ),
                    ListTile(
                      title: Text(
                        'total'.tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        total,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )),
          );
  }
}
