import 'package:ecommerce/components/navigation/bottomNavigationController.dart';
import 'package:ecommerce/controllers/homeController.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/icons.dart';
import 'package:ecommerce/utils/string.dart';
import 'package:flutter/material.dart';

Widget bottomNavigation(
    BottomNavigationController btmNavigationController, setState) {
  return BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(icon: homeIcon, label: homeLabel),
      BottomNavigationBarItem(icon: categoryIcon, label: categoryLabel),
      BottomNavigationBarItem(icon: shoppingCartIcon, label: cartLabel),
      BottomNavigationBarItem(icon: personIcon, label: profileLabel),
    ],
    currentIndex: btmNavigationController.navigationIndex,
    backgroundColor: navigationBgColor,
    selectedItemColor: navigationItemSelectedColor,
    selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
    unselectedItemColor: navigationItemUnselectedColor,
    type: BottomNavigationBarType.fixed,
    onTap: (value) {
      setState(() {
        btmNavigationController.navigationIndex = value;
      });
    },
  );
}
