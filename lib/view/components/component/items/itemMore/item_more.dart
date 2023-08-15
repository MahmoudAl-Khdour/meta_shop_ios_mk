import 'package:flutter/material.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';

class ItemMore extends StatelessWidget {
  void Function() onTap;
  IconData icon;
  String text;

  ItemMore({
    required this.onTap,
    required this.icon,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
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
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey.shade100,
                Colors.grey.shade50,
                Colors.grey.shade200,
                Colors.grey.shade50,
              ],
            ),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(25))),
        height: 150,
        width: 150,
        child: InkWell(
          onTap: onTap,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              icon,
              color: AppColor.globalDefaultColor,
              size: 35,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: const TextStyle(
                color: AppColor.globalDefaultColor,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
