import 'package:flutter/cupertino.dart';

final List<Map<String, dynamic>> demoProductList = [
  {
    "id": 1,
    "price": 550,
    "discount": 10,
    "image": "assets/images/brands/p1.jpeg",
    "title": "ASUS Laptop. (Core 8)",
    "description":
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
  },
  {
    "id": 2,
    "price": 650,
    "discount": 1,
    "image": "assets/images/brands/p2.jpeg",
    "title": "Modern Cosmetics.",
    "description":
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
  },
  {
    "id": 3,
    "price": 25000,
    "discount": 5,
    "image": "assets/images/brands/p3.jpeg",
    "title": "HP Laptop. (Core 5)",
    "description":
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
  },
  {
    "id": 4,
    "price": 1500,
    "discount": 3,
    "image": "assets/images/brands/p4.jpeg",
    "title": "Lotto Ladies Shoes",
    "description":
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
  },
  {
    "id": 5,
    "price": 800,
    "discount": 0,
    "image": "assets/images/brands/p5.jpeg",
    "title": "Ladies Lather Bag",
    "description":
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
  },
  {
    "id": 6,
    "price": 1600,
    "discount": 10,
    "image": "assets/images/brands/p6.jpeg",
    "title": "Lotto Ladies Sport Shoes",
    "description":
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
  },
  {
    "id": 7,
    "price": 350,
    "discount": 0,
    "image": "assets/images/brands/p7.jpeg",
    "title": "Ladies Sunglasses",
    "description":
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
  },
  {
    "id": 8,
    "price": 1700,
    "discount": 10,
    "image": "assets/images/brands/p4.jpeg",
    "title": "Lotto Ladies Shoes",
    "description":
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
  },
];

List<Widget> topSlideDemoItems = const [
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

List<Widget> secondSliderDemoItems = const [
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
