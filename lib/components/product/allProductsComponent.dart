import "package:ecommerce/components/buttons/showMoreBtn.dart";
import "package:ecommerce/components/product/productGridViewComponent.dart";
import "package:ecommerce/utils/const.dart";
import "package:flutter/material.dart";
import "package:ecommerce/utils/demoData.dart";

Widget allProductsComponent(BuildContext context) {
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
          (index) => ProductGridViewComponent(
            product: demoProductList[index],
          ),
        ),
      ),
      spaceTopBottom,
      showMoreBtn(),
    ],
  );
}
