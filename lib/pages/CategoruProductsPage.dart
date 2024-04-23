import 'package:ecommerce/components/background/BgTopImage.dart';
import 'package:ecommerce/components/product/productGridViewComponent.dart';
import 'package:ecommerce/language/Language.dart';
import 'package:ecommerce/utils/app.dart';
import 'package:flutter/material.dart';

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
    },
    {
      "image": "assets/images/brands/p2.jpeg",
      "title": "Modern Cosmetics.",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "650",
      "discount": "15"
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
                color: Color.fromARGB(255, 13, 112, 74),
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
                            products.length,
                            (index) => productGridViewComponent(
                                context, products[index])),
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
