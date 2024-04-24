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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:hive_flutter/hive_flutter.dart";

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _languageBox = Hive.box("languageBox");
// init langage
  String systemLanguage = 'english';
  String languageShortName = "EN";
  // init home controller
  var controller = HomeController();
  var btmNavigationController = BottomNavigationController();
  @override
  void initState() {
    super.initState();
    final custom_lang = _languageBox.get("lang");
    if (custom_lang != null) {
      if (custom_lang == 'bangla') {
        systemLanguage = custom_lang;
        languageShortName = "BN";
      }
    }
  }

  //
  var navigationTabItems = [
    HomePage(),
    CategoryPage(
      btmNavigationController: BottomNavigationController(),
    ),
    CartPage(),
    ProfilePage(),
  ];

  void changeLanguage(BuildContext context) {
    showDialog(
        context: context, builder: (context) => _changeLanguage(context));
  }

  // set language
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: whiteColor,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: searchIcon,
            color: whiteColor,
          ),
          IconButton(
            onPressed: () {},
            icon: shoppingCartIcon,
            color: whiteColor,
          ),
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
      ),
    );
  }
}
