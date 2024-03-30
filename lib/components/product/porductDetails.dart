import 'package:ecommerce/components/background/BgTopImage.dart';
import 'package:ecommerce/components/buttons/iconButtonComponent.dart';
import 'package:ecommerce/components/carousel/carouselComponent.dart';
import 'package:ecommerce/components/carousel/carouselIndicatorComponent.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/const.dart';
import 'package:ecommerce/utils/font.dart';
import 'package:ecommerce/utils/icons.dart';
import 'package:ecommerce/utils/navigationMenu.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  int productId;
  String productTitle;
  ProductDetails(
      {required this.productId, required this.productTitle, Key? key})
      : super(key: key);
  State<ProductDetails> createState() => _ProductDetails();
}

class _ProductDetails extends State<ProductDetails> {
  var bookMark = false;
  var isShare = false;
  void initState() {
    super.initState();
  }

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

  void bookMarkProduct() {
    setState(() {
      bookMark = !bookMark;
    });
  }

  void shareProduct() {
    setState(() {
      isShare = !isShare;
    });
  }

  @override
  Widget build(BuildContext context) {
    return bgTopImage(
      child: Scaffold(
        // backgroundColor: Color.fromARGB(255, 221, 220, 220),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                shareProduct();
              },
              icon: shareIcon,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(whiteColor),
                elevation: MaterialStateProperty.all(4),
                iconColor:
                    MaterialStateProperty.all(isShare ? blueColor : greyColor),
                shadowColor: MaterialStateProperty.all(
                  Colors.black.withOpacity(0.8),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                bookMarkProduct();
              },
              icon: bookMark ? loveFillIcon : loveIcon,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(whiteColor),
                elevation: MaterialStateProperty.all(4),
                iconColor: MaterialStateProperty.all(lightRedColor),
                shadowColor:
                    MaterialStateProperty.all(Colors.black.withOpacity(0.8)),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
          leading: IconButton(
            onPressed: () {
              back(context);
            },
            icon: arrowTurnUpLeftIcon,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(whiteColor),
              elevation: MaterialStateProperty.all(5),
              iconColor: MaterialStateProperty.all(greyColor),
              shadowColor: MaterialStateProperty.all(
                Colors.black.withOpacity(0.8),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(9),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [CarouselIndicatorComponent(topSlideItems)],
              ),
              spaceTopBottom,
              Container(
                color: const Color.fromARGB(64, 158, 158, 158),
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  widget.productTitle,
                  style: sectionTitleTextStyle,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                color: const Color.fromARGB(25, 158, 158, 158),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButtonComponent(
                            whiteColor, const Icon(Icons.remove)),
                        Container(
                          width: 25,
                          height: 25,
                          child: Text("1"),
                        ),
                        IconButtonComponent(whiteColor, const Icon(Icons.add)),
                      ],
                    ),
                    const Text(
                        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
