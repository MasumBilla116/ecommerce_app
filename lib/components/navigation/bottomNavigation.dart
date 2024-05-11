import 'package:ecommerce/components/navigation/bottomNavigationController.dart';
import 'package:ecommerce/language/Language.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/icons.dart';
import 'package:flutter/material.dart';

Widget bottomNavigation(
    BottomNavigationController btmNavigationController, setState) {
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
        icon: homeIcon,
        label: Language.load("home"),
      ),
      BottomNavigationBarItem(
          icon: categoryIcon, label: Language.load("category")),
      BottomNavigationBarItem(
          icon: shoppingCartIcon, label: Language.load("cart")),
      BottomNavigationBarItem(
          icon: personIcon, label: Language.load("profile")),
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
