import 'package:ecommerce/components/buttons/addToCartAppBarBtn.dart';
import 'package:ecommerce/components/cart/cartComponent.dart';
import 'package:ecommerce/components/home/OldhomeComponent.dart';
import 'package:ecommerce/components/navigation/bottomNavigation.dart';
import 'package:ecommerce/components/navigation/bottomNavigationController.dart';
import 'package:ecommerce/components/profile/profileComponent.dart';
import 'package:ecommerce/controllers/homeController.dart';
import 'package:ecommerce/language/Language.dart';
import 'package:ecommerce/pages/CartPage.dart';
import 'package:ecommerce/pages/CategoryPage.dart';
import 'package:ecommerce/pages/HomePage.dart';
import 'package:ecommerce/pages/ProfilePage.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/icons.dart';
import 'package:ecommerce/utils/navigationMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "package:hive_flutter/hive_flutter.dart";

final GlobalKey<_HomeState> homeKey = GlobalKey<_HomeState>();

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
  Home({Key? key}) : super(key: key);
}

class _HomeState extends State<Home> {
  // hive box
  final _languageBox = Hive.box("languageBox");
  final cartBox = Hive.box("cartBox");

  // init langage
  String systemLanguage = 'english';
  String languageShortName = "EN";

  // init home controller
  var controller = HomeController();
  var btmNavigationController = BottomNavigationController();

  // globar variable
  var totalCartItems = 0;

  // init state
  @override
  void initState() {
    super.initState();
    // hive box
    final customLang = _languageBox.get("lang");
    final cartItems = cartBox.get("cartIds");

    // for language
    if (customLang != null) {
      if (customLang == 'bangla') {
        systemLanguage = customLang;
        languageShortName = "BN";
      }
    }
    // update cart items
    // totalCartItems = cartItems != null ? cartItems.length : 0;
    updateCartItems();
    cartBox.watch().listen((event) {
      updateCartItems();
    });
  }

  // navigation bottom page items
  var navigationTabItems = [
    HomePage(),
    CategoryPage(
      btmNavigationController: BottomNavigationController(),
    ),
    CartPage(),
    ProfilePage(),
  ];

  // handler method
  //-----------------------
  // cart
  void updateCartItems() {
    final cartProducts = cartBox.get("cartProducts");
    setState(() {
      totalCartItems = cartProducts != null ? cartProducts['total_items'] : 0;
    });
  }

  // language
  void changeLanguage(BuildContext context) {
    showDialog(
        context: context, builder: (context) => _changeLanguage(context));
  }

  void setSystemLanguage() {
    _languageBox.put("lang", systemLanguage);
  }

  Widget _changeLanguage(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: Text(Language.load("change_language")),
        insetPadding: const EdgeInsets.all(12),
        contentPadding: const EdgeInsets.all(12),
        titleTextStyle: const TextStyle(
            fontSize: 18, color: darkColor, fontWeight: FontWeight.w400),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile(
              value: "english",
              groupValue: systemLanguage,
              title: Text(Language.load("english")),
              onChanged: (String? value) {
                setState(() {
                  systemLanguage = value as String;
                });
              },
            ),
            RadioListTile(
                value: "bangla",
                groupValue: systemLanguage,
                title: Text(Language.load("bangla")),
                onChanged: (String? value) {
                  setState(() {
                    systemLanguage = value as String;
                  });
                })
          ],
        ),
        actions: [
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(redColor)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              Language.load("cancel"),
              style: const TextStyle(color: whiteColor),
            ),
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(greenColor)),
            onPressed: () {
              setSystemLanguage();
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (Route<dynamic> route) => false,
              );
            },
            child: Text(
              Language.load("change"),
              style: const TextStyle(color: whiteColor),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigation(btmNavigationController, setState),
      body: navigationTabItems[btmNavigationController.navigationIndex],
      appBar: btmNavigationController.navigationIndex != 3
          ? AppBar(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
                color: whiteColor,
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: searchIcon,
                  color: whiteColor,
                ),
                addToCartAppBarBtn(context, totalCartItems),
                TextButton(
                  onPressed: () {
                    changeLanguage(context);
                  },
                  child: Text(
                    languageShortName,
                    style: const TextStyle(
                        color: whiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            )
          : null,
    );
  }
}
