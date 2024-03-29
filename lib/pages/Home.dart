import 'package:ecommerce/components/cart/cartComponent.dart';
import 'package:ecommerce/components/category/categoryComponent.dart';
import 'package:ecommerce/components/home/homeComponent.dart';
import 'package:ecommerce/components/navigation/bottomNavigation.dart';
import 'package:ecommerce/components/navigation/bottomNavigationController.dart';
import 'package:ecommerce/components/profile/profileComponent.dart';
import 'package:ecommerce/controllers/homeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // init home controller
  var controller = HomeController();
  var btmNavigationController = BottomNavigationController();
  @override
  void initState() {
    super.initState();
  }

  //
  var navigationTabItems = [
    HomeComponent(),
    CategoryComponent(
      btmNavigationController: BottomNavigationController(),
    ),
    CartComponent(),
    ProfileComponent(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigation(btmNavigationController, setState),
      body: navigationTabItems[btmNavigationController.navigationIndex],
    );
  }
}
