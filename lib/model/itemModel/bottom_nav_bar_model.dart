import 'package:flutter/material.dart';

class BottomNavBarModel {
  NavBarItem navBarItem;
  String name;
  String nameRoute;
  Widget widget;

  BottomNavBarModel({
    required this.widget,
    required this.navBarItem,
    required this.name,
    required this.nameRoute,
  });
}

enum NavBarItem { home, store, sell, offer, more, user }
