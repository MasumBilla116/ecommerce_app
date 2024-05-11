import 'package:ecommerce/components/background/BgTopImage.dart';
import 'package:ecommerce/components/product/productGridViewComponent.dart';
import 'package:ecommerce/language/Language.dart';
import 'package:ecommerce/utils/app.dart';
import 'package:flutter/material.dart';
import "package:ecommerce/utils/demoData.dart";

class CategoryProductsPage extends StatefulWidget {
  final int categoryId;
  final String categoryName;
  const CategoryProductsPage(
      {required this.categoryId, required this.categoryName, Key? key})
      : super(key: key);
  @override
  State<CategoryProductsPage> createState() => _CategoryProductsPage();
}

class _CategoryProductsPage extends State<CategoryProductsPage> {
  final subCategoryList = [
    {
      "name": "Women Shooes",
    },
    {
      "name": "Watch",
    },
    {
      "name": "Bag",
    },
    {
      "name": "Cosmetics",
    },
    {
      "name": "T-shirt",
    },
    {
      "name": "Laptop",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return bgTopImage(
      child: Scaffold(
        appBar: appBarWithLeading(widget.categoryName, context),
        body: Column(
          children: [
            // sub-category list
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: const EdgeInsets.all(8),
                color: const Color.fromARGB(255, 13, 112, 74),
                child: Row(
                  children: List.generate(
                    subCategoryList.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ElevatedButton(
                        onPressed: () => {},
                        child: Text(
                          subCategoryList[index]['name'] ?? "",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // category product list
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
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
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          Language.load("show_more"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
