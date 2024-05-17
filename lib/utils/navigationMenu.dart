import 'package:ecommerce/components/category/categoryProductComponent.dart';
import 'package:ecommerce/pages/CartPage.dart';
import 'package:ecommerce/pages/CategoryProductsPage.dart';
import 'package:ecommerce/pages/Home.dart';
import 'package:ecommerce/pages/OrderPage.dart';
import 'package:ecommerce/pages/ProductDetailsPage.dart';
import 'package:ecommerce/pages/ProfileEditPage.dart';
import 'package:ecommerce/pages/SearchingProductPage.dart';
import 'package:ecommerce/pages/auth/Login.dart';
import 'package:ecommerce/pages/auth/Register.dart';
import 'package:flutter/material.dart';

goToHomePage(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Home()),
  );
}

goToLoginPage(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Login()),
  );
}

goToRegisterPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Register()),
  );
}

back(BuildContext context) {
  Navigator.of(context).pop();
}

goToCategoryProductPage(BuildContext context, categoryId, categoryName) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => CategoryProductsPage(
              categoryId: categoryId,
              categoryName: categoryName,
            )),
  );
}

goToProductDetailPage(BuildContext context, productId, productTitle) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => ProductDetailsPage(
              productId: productId,
              productTitle: productTitle,
            )),
  );
}

goToAddToCartProductPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
}

goToOrderPage(context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => OrderPage()),
  );
}

goToProfileEditPage(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ProfileEditPage()));
}

goToSearchPage(context, searchingTitle, searchProductType) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SearchingProductPage(
              searchingTitle: searchingTitle,
              searchProductType: searchProductType)));
}
