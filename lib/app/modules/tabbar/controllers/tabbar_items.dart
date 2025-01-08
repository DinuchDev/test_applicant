import 'package:flutter/cupertino.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class TabbarItem {
  final String? iconPath;
  final String title;
  final Widget screen;
  final Bindings binding;

  TabbarItem({
    this.iconPath,
    required this.title,
    required this.screen,
    required this.binding,
  });
}