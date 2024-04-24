import 'package:ecommerce/components/buttons/button.dart';
import 'package:ecommerce/components/carousel/carouselComponent.dart';
import 'package:ecommerce/components/product/allProductsComponent.dart';
import 'package:ecommerce/components/product/productComponent.dart';
import 'package:ecommerce/components/product/productGridViewComponent.dart';
import 'package:ecommerce/components/section/sectionTitleComponent.dart';
import 'package:ecommerce/language/Language.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/const.dart';
import 'package:ecommerce/utils/font.dart';
import 'package:ecommerce/utils/icons.dart';
import 'package:ecommerce/utils/images.dart';
import 'package:ecommerce/utils/padding.dart';
import 'package:ecommerce/utils/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  final products = [
    {
      "image": "assets/images/brands/p1.jpeg",
      "title": "ASUS Laptop. (Core 8)",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "550",
      "discount": "10"
    },
    {
      "image": "assets/images/brands/p2.jpeg",
      "title": "Modern Cosmetics.",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "650",
      "discount": "15"
    },
    {
      "image": "assets/images/brands/p3.jpeg",
      "title": "HP Laptop. (Core 5)",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "650",
      "discount": "15"
    },
    {
      "image": "assets/images/brands/p4.jpeg",
      "title": "Lotto Ladies Shoes",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "650",
      "discount": "15"
    },
    {
      "image": "assets/images/brands/p5.jpeg",
      "title": "Ladies Lather Bag",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "650",
      "discount": "15"
    },
    {
      "image": "assets/images/brands/p6.jpeg",
      "title": "Lotto Ladies Sport Shoes",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "650",
      "discount": "15"
    },
    {
      "image": "assets/images/brands/p7.jpeg",
      "title": "Ladies Sunglasses",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "650",
      "discount": "15"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
        child: Column(
          children: [
            // scrollable
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // carousel Component 1
                    spaceTopBottom,
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
                    // carousel Component 2
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
                    sectionTitleComponent(Language.load("brand_product")),
                    // Featured category buttons
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          3,
                          (index) => Column(
                            children: [
                              button(
                                width: MediaQuery.of(context).size.width / 1.8,
                                height: MediaQuery.of(context).size.height * .1,
                                marginLeft: 13.0,
                                title: featuredText1[index],
                                imagePath: featuredImagesList1[index],
                                buttonTextColor: buttonTextBlackColor,
                              ),
                              spaceTopBottom,
                              button(
                                width: MediaQuery.of(context).size.width / 1.8,
                                height: MediaQuery.of(context).size.height * .1,
                                marginLeft: 13.0,
                                title: featuredText2[index],
                                imagePath: featuredImagesList2[index],
                                buttonTextColor: buttonTextBlackColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    spaceTopBottom,
                    // Featured product title
                    sectionTitleComponent(Language.load("feature_product")),
                    // featured product
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: List.generate(
                                      products.length,
                                      (index) =>
                                          productComponent(products[index])),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    spaceTopBottom,
                    // carousel Component 3
                    CarouselComponent(secondSlideItems),
                    // products
                    spaceTopBottom,
                    sectionTitleComponent(Language.load("all_products")),
                    allProductsComponent(context),
                    spaceTopBottom,
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
