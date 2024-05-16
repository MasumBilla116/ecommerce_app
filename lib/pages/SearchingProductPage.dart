import 'package:ecommerce/components/inputFields/inputField.dart';
import 'package:ecommerce/components/product/allProductsComponent.dart';
import 'package:ecommerce/components/product/productGridViewComponent.dart';
import 'package:ecommerce/language/Language.dart';
import 'package:ecommerce/utils/app.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/const.dart';
import 'package:ecommerce/utils/demoData.dart';
import 'package:ecommerce/utils/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchingProductPage extends StatefulWidget {
  State<SearchingProductPage> createState() => _SearchingProductPage();
}

class _SearchingProductPage extends State<SearchingProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithLeading("Search Your Product", context),
      body: Column(
        children: [
          Container(
            color: baseColor,
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
            child: Row(
              children: [
                // searching input field
                Expanded(
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: inputHintColor, fontSize: inputHintFontSize),
                      hintText: "Search your item",
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.all(8), // Adjust padding here
                      fillColor: inputFillColorGrey,
                      filled: true,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: inputFocusBorderColor),
                      ),
                    ),
                  ),
                ),
                // search icon
                SizedBox(
                  width: 40,
                  child: IconButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(baseDarkColor),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0))),
                        ),
                      ),
                      icon: const Icon(
                        onlySearchIcon,
                        color: whiteColor,
                      )),
                ),
              ],
            ),
          ),

          /// searching product
          Expanded(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: .78,
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                          // products.length,
                          demoProductList.length,
                          (index) => ProductGridViewComponent(
                              product: demoProductList[index])),
                    ),
                    spaceTopBottom,
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        Language.load("show_more"),
                      ),
                    ),
                  ],
                )),
          ),
          spaceTopBottom,
        ],
      ),
    );
  }
}
