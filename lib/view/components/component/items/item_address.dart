import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/view/pages/address/menu.dart';

class ItemAddress extends StatelessWidget {
  ItemAddress({
    Key? key,
    required this.onSelected,
    required this.nameAddress,
    required this.locationDetails,
  }) : super(key: key);

  String? nameAddress;
  String? locationDetails;
  void Function(Menu item) onSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(nameAddress!),
      subtitle: Text(locationDetails!),
      trailing: PopupMenuButton<Menu>(
        onSelected: onSelected,
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
          PopupMenuItem<Menu>(
            value: Menu.delete,
            child: Text('delete'.tr),
          ),
          PopupMenuItem<Menu>(
            value: Menu.edit,
            child: Text('edit'.tr),
          ),
          PopupMenuItem<Menu>(
            value: Menu.makeDefault,
            child: Text('make_it_default'.tr),
          ),
        ],
      ),
    );
  }
}
