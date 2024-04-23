import 'package:ecommerce/components/background/BgTopImage.dart';
import 'package:ecommerce/components/navigation/bottomNavigationController.dart';
import 'package:ecommerce/components/product/allProductsComponent.dart';
import 'package:ecommerce/language/Language.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/navigationMenu.dart';
import 'package:ecommerce/utils/string.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  final BottomNavigationController btmNavigationController;
  const CategoryPage({required this.btmNavigationController, Key? key})
      : super(key: key);
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final categories = [
    {
      "image": "assets/images/brands/p1.jpeg",
      "name": "Laptop.",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "550",
      "discount": "10"
    },
    {
      "image": "assets/images/brands/p2.jpeg",
      "name": "Cosmetics.",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "650",
      "discount": "15"
    },
    {
      "image": "assets/images/brands/p3.jpeg",
      "name": "Laptop",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "650",
      "discount": "15"
    },
    {
      "image": "assets/images/brands/p4.jpeg",
      "name": "Shoes",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "650",
      "discount": "15"
    },
    {
      "image": "assets/images/brands/p5.jpeg",
      "name": "Bag",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "650",
      "discount": "15"
    },
    {
      "image": "assets/images/brands/p6.jpeg",
      "name": "Sport Shoes",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "650",
      "discount": "15"
    },
    {
      "image": "assets/images/brands/p7.jpeg",
      "name": "Sunglasses",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "650",
      "discount": "15"
    },
    {
      "image": "assets/images/brands/p2.jpeg",
      "name": "Cosmetics.",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "650",
      "discount": "15"
    },
    {
      "image": "assets/images/brands/p1.jpeg",
      "name": "Laptop.",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "550",
      "discount": "10"
    },
    {
      "image": "assets/images/brands/p2.jpeg",
      "name": "Cosmetics.",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "650",
      "discount": "15"
    },
    {
      "image": "assets/images/brands/p3.jpeg",
      "name": "Laptop",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "650",
      "discount": "15"
    },
    {
      "image": "assets/images/brands/p4.jpeg",
      "name": "Shoes",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "650",
      "discount": "15"
    },
    {
      "image": "assets/images/brands/p5.jpeg",
      "name": "Bag",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "650",
      "discount": "15"
    },
    {
      "image": "assets/images/brands/p6.jpeg",
      "name": "Sport Shoes",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "650",
      "discount": "15"
    },
    {
      "image": "assets/images/brands/p1.jpeg",
      "name": "Laptop.",
      "description":
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
      "price": "550",
      "discount": "10"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return bgTopImage(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Language.load("category"),
            style: const TextStyle(color: whiteColor),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(
            left: 12,
            right: 12,
            bottom: 5,
            top: 12,
          ),
          color: Colors.transparent,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.65,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final name = categories[index]['name'];
              final imagePath = categories[index]['image'];
              return ElevatedButton(
                  onPressed: () =>
                      {goToCategoryProductPage(context, index, name)},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    elevation: 2,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        if (imagePath != null)
                          Image.asset(
                            imagePath,
                            fit: BoxFit.fill,
                          ),
                        if (name != null) Text(name),
                      ],
                    ),
                  ));
            },
          ),
        ),
      ),
    );
  }
}
