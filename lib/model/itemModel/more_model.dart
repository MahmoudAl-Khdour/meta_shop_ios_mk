import 'package:flutter/material.dart';

class MoreModel {
  MoreItem moreKey;
  String name;
  IconData icon;
  void Function() onTap;

  MoreModel({
    required this.moreKey,
    required this.name,
    required this.icon,
    required this.onTap,
  });
}

enum MoreItem {
  editInformation,
  myOrder,
  favorite,
  location,
  logout,
  callUs,
  aboutUs,
}
