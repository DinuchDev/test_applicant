import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../account/views/account_view.dart';
import '../../home/views/home_view.dart';
import '../controllers/tabbar_controller.dart';

class TabbarView extends GetView<TabbarController> {
  TabbarView({super.key});

  var screen = [
    HomeView(),
    AccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.bottomNavigationController.selectedIndex.value,
          children: screen,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.black,
          onTap: (index) {
            controller.bottomNavigationController.changeIndex(index);
          },
          currentIndex:
              controller.bottomNavigationController.selectedIndex.value,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              // backgroundColor: Colors.white,
              icon: SvgPicture.asset('assets/svg/home.svg'),
              activeIcon: SvgPicture.asset('assets/svg/home_fill.svg',
                  color: Colors.grey.withOpacity(1)),
            ),
            BottomNavigationBarItem(
              label: "Account",
              // backgroundColor: Colors.white,
              icon: SvgPicture.asset('assets/svg/account.svg'),
              activeIcon: SvgPicture.asset('assets/svg/account_fill.svg',
                  color: Colors.grey.withOpacity(1)),
            ),
          ],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          showSelectedLabels: false,
        ),
      ),
    );
  }
}
