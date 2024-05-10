import "package:ecommerce/components/buttons/showMoreBtn.dart";
// import "package:ecommerce/components/product/productGridViewComponent.dart";
import "package:ecommerce/utils/const.dart";
import "package:flutter/material.dart";
import "package:ecommerce/utils/demoData.dart";
import 'package:ecommerce/method/addToWishlist.dart';
import 'package:ecommerce/utils/app.dart';
// import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/icons.dart';
import 'package:ecommerce/utils/navigationMenu.dart';
// import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AllProductsComponent extends StatefulWidget {
  const AllProductsComponent({Key? key}) : super(key: key);

  @override
  _AllProductsComponentState createState() => _AllProductsComponentState();
}

class _AllProductsComponentState extends State<AllProductsComponent> {
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
    return Column(
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
            demoProductList.length,
            (index) {
              // init product details
              final product = demoProductList[index];
              final id = product["id"];
              final image = product["image"];
              final title = product["title"];
              final price = product["price"];
              final discount = product["discount"];

              return ElevatedButton(
                onPressed: () {
                  goToProductDetailPage(context, id, title);
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
                          if (image != null) Image.asset(image),
                          if (title != null)
                            Text(
                              title.length > 19
                                  ? title.substring(0, 17) + '...'
                                  : title,
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (price != null)
                                Text(
                                  "$price \$", // Assuming currency is represented by "$"
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              const Spacer(),
                              if (discount != null)
                                Text(
                                  "$discount% Off",
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 10),
                                )
                            ],
                          ),
                        ],
                      ),
                    ),
                    // wishlist love icon button
                    IconButton(
                      icon: loveIcon,
                      color: const Color.fromARGB(131, 255, 123, 0),
                      selectedIcon: loveFillIcon,
                      isSelected: wishlistProductIds.contains(id),
                      onPressed: () {
                        setState(() {
                          wishlist(product);
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        spaceTopBottom,
        showMoreBtn(),
      ],
    );
  }
}




// Widget allProductsComponent(BuildContext context) {
//   return Column(
//     children: [
//       GridView.count(
//         crossAxisCount: 2,
//         mainAxisSpacing: 12,
//         crossAxisSpacing: 12,
//         childAspectRatio: .78,
//         padding: const EdgeInsets.only(left: 15, right: 15),
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         children: List.generate(
//           demoProductList.length,
//           (index) => ProductGridViewComponent(
//             product: demoProductList[index],
//           ),
//         ),
//       ),
//       spaceTopBottom,
//       showMoreBtn(),
//     ],
//   );
// }