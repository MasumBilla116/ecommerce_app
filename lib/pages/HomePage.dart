import 'package:ecommerce/components/buttons/button.dart';
import 'package:ecommerce/components/carousel/carouselComponent.dart';
import 'package:ecommerce/components/product/allProductsComponent.dart';
import 'package:ecommerce/components/product/productComponent.dart';
import 'package:ecommerce/components/section/sectionTitleComponent.dart';
import 'package:ecommerce/language/Language.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/const.dart';
import 'package:ecommerce/utils/icons.dart';
import 'package:ecommerce/utils/images.dart';
import 'package:ecommerce/utils/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/utils/demoData.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic wishlistProdctIds = [];
  final _wishlistBox = Hive.box("wishlistBox");
  final cartBox = Hive.box("cartBox");
  @override
  void initState() {
    super.initState();
    var wishlistIds = _wishlistBox.get('wishlistProductIds');
    if (wishlistIds != null) {
      wishlistProdctIds = wishlistIds;
    }
  }

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
                    CarouselComponent(topSlideDemoItems),
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
                    CarouselComponent(secondSliderDemoItems),
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
                                      demoProductList.length,
                                      (index) => productComponent(
                                          demoProductList[index])),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    spaceTopBottom,
                    // carousel Component 3
                    CarouselComponent(secondSliderDemoItems),
                    // products
                    spaceTopBottom,
                    sectionTitleComponent(Language.load("all_products")),
                    const AllProductsComponent(),
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
