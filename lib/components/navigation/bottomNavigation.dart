import 'package:ecommerce/controllers/homeController.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/icons.dart';
import 'package:ecommerce/utils/string.dart';
import 'package:flutter/material.dart';

Widget bottomNavigation(HomeController controller, setState) {
  return BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(icon: homeIcon, label: homeLabel),
      BottomNavigationBarItem(icon: categoryIcon, label: categoryLabel),
      BottomNavigationBarItem(icon: shoppingCartIcon, label: cartLabel),
      BottomNavigationBarItem(icon: personIcon, label: profileLabel),
    ],
    currentIndex: controller.currentNavIndex,
    backgroundColor: navigationBgColor,
    selectedItemColor: navigationItemSelectedColor,
    selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
    unselectedItemColor: navigationItemUnselectedColor,
    type: BottomNavigationBarType.fixed,
    onTap: (value) {
      setState(() {
        controller.currentNavIndex = value;
      });
    },
  );
}
