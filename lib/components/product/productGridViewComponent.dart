import 'package:ecommerce/method/wishlist.dart';
import 'package:ecommerce/utils/app.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/icons.dart';
import 'package:ecommerce/utils/navigationMenu.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductGridViewComponent extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductGridViewComponent({Key? key, required this.product})
      : super(key: key);

  @override
  _ProductGridViewComponentState createState() =>
      _ProductGridViewComponentState();
}

class _ProductGridViewComponentState extends State<ProductGridViewComponent> {
  final wishlistBox = Hive.box("wishlistBox");
  dynamic wishlistProductIds = [];

  @override
  void initState() {
    super.initState();
    final wishlistIds = wishlistBox.get("wishlistProductIds");
    if (wishlistIds != null) {
      wishlistProductIds = wishlistIds;
    }
  }

  @override
  Widget build(BuildContext context) {
    double discountPrice = 0;
    double lessPrice = 0.0;

    if (widget.product['discount'] != null) {
      lessPrice = (double.parse(widget.product['discount']) *
              double.parse(widget.product['price'])) /
          100;
      discountPrice = double.parse(widget.product['price']) - lessPrice;
    }

    return ElevatedButton(
      onPressed: () {
        goToProductDetailPage(context, 1, widget.product['title']);
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 2,
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(25, 0, 0, 0),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.product["image"] != null)
                  Image.asset(widget.product["image"]),
                if (widget.product["title"] != null)
                  Text(
                    widget.product["title"].length > 19
                        ? widget.product['title'].substring(0, 17) + '...'
                        : widget.product['title'],
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (widget.product["price"] != null)
                      Text(
                        "$discountPrice $currency.",
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    const Spacer(),
                    if (widget.product['discount'] != null)
                      Text(
                        widget.product['discount'] + "% Off",
                        style: const TextStyle(color: Colors.red, fontSize: 10),
                      )
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: loveIcon,
            color: Color.fromARGB(131, 255, 123, 0),
            selectedIcon: loveFillIcon,
            isSelected: wishlistProductIds.contains(widget.product['id']),
            onPressed: () {
              setState(() {
                wishlist(widget.product);
              });
            },
          ),
        ],
      ),
    );
  }
}
