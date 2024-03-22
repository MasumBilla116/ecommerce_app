import 'package:ecommerce/components/buttons/button.dart';
import 'package:ecommerce/components/carousel/carouselComponent.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/const.dart';
import 'package:ecommerce/utils/font.dart';
import 'package:ecommerce/utils/icons.dart';
import 'package:ecommerce/utils/padding.dart';
import 'package:ecommerce/utils/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeComponent extends StatefulWidget {
  @override
  State<HomeComponent> createState() => _HomeComponentState();
}

class _HomeComponentState extends State<HomeComponent> {
  List<Widget> topSlideItems = const [
    Image(image: AssetImage("assets/images/carousel/add-1.jpg")),
    Image(image: AssetImage("assets/images/carousel/add-2.jpg")),
    Image(image: AssetImage("assets/images/carousel/add-3.jpeg")),
    Image(
      image: AssetImage("assets/images/carousel/add-5.jpg"),
    ),
    Image(
      image: AssetImage("assets/images/carousel/add-7.jpg"),
    ),
  ];

  List<Widget> secondSlideItems = const [
    Image(
      image: AssetImage("assets/images/carousel/add-5.jpg"),
    ),
    Image(image: AssetImage("assets/images/carousel/add-2.jpg")),
    Image(
      image: AssetImage("assets/images/carousel/add-7.jpg"),
    ),
    Image(image: AssetImage("assets/images/carousel/add-3.jpeg")),
    Image(image: AssetImage("assets/images/carousel/add-1.jpg")),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: commonComponentPadding,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: componentBgColor,
      child: SafeArea(
        child: Column(
          children: [
            // search bar
            Container(
              height: 50,
              margin: containerMarginLeftRight,
              alignment: Alignment.topCenter,
              color: lightBlueColor,
              child: TextFormField(
                decoration: const InputDecoration(
                  suffixIcon: searchIcon,
                  suffixIconColor: inputHintColor,
                  filled: true,
                  fillColor: inputFillColorWhite,
                  hintText: searchHintText,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: inputHintColor,
                  ),
                ),
              ),
            ),
            spaceTopBottom,
            // scrollable
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // top carousel
                    CarouselComponent(topSlideItems),
                    spaceTopBottom,
                    // buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        2,
                        (index) => button(
                          width: MediaQuery.of(context).size.width / 2.2,
                          height: MediaQuery.of(context).size.height * 0.1,
                          icon: index == 0
                              ? onlyShoppingCartIcon
                              : onlyFlashDealIcon,
                          title: index == 0 ? todayDealText : flashDealText,
                          buttonIconColor: index == 0
                              ? buttonRedIconColor
                              : buttonBlueIconColor,
                          buttonTextColor: buttonTextGreyColor,
                        ),
                      ),
                    ),
                    spaceTopBottom,
                    // middle carousel
                    CarouselComponent(secondSlideItems),
                    spaceTopBottom,
                    // buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        3,
                        (index) => button(
                          width: MediaQuery.of(context).size.width / 3.5,
                          height: MediaQuery.of(context).size.height * 0.1,
                          icon: index == 0
                              ? onlyCategoryIcon
                              : index == 1
                                  ? onlyLightBulbIcon
                                  : onlyFireIcon,
                          title: index == 0
                              ? categoryText
                              : index == 1
                                  ? brandText
                                  : topSallersText,
                          buttonIconColor: index == 0
                              ? buttonRedIconColor
                              : index == 1
                                  ? buttonBlueIconColor
                                  : buttonOrangeIconColor,
                          buttonTextColor: buttonTextGreyColor,
                        ),
                      ),
                    ),
                    spaceTopBottom,
                    // featured Category
                    Container(
                      margin: containerMarginLeftRight,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          featuredCategoriesText,
                          style: sectionTitleTextStyle,
                        ),
                      ),
                    ),
                    Container(
                      margin: containerMarginLeftRight,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          featuredCategoriesText,
                          style: sectionTitleTextStyle,
                        ),
                      ),
                    ),
                    Container(
                      margin: containerMarginLeftRight,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          featuredCategoriesText,
                          style: sectionTitleTextStyle,
                        ),
                      ),
                    ),
                    Container(
                      margin: containerMarginLeftRight,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          featuredCategoriesText,
                          style: sectionTitleTextStyle,
                        ),
                      ),
                    ),
                    Container(
                      margin: containerMarginLeftRight,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          featuredCategoriesText,
                          style: sectionTitleTextStyle,
                        ),
                      ),
                    ),
                    Container(
                      margin: containerMarginLeftRight,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          featuredCategoriesText,
                          style: sectionTitleTextStyle,
                        ),
                      ),
                    ),
                    Container(
                      margin: containerMarginLeftRight,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          featuredCategoriesText,
                          style: sectionTitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
