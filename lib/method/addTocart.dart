import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

void addToCart(product) {
  // Retrieve the Hive box
  final cartBox = Hive.box("cartBox");
  dynamic cartIds = cartBox.get("cartIds");
  dynamic cartProducts = cartBox.get("cartProducts");

  if (cartProducts == null || cartIds == null) {
    cartIds = [product['id']];
    cartProducts = [product];
  } else {
    if (!cartIds.contains(product['id'])) {
      cartIds.add(product['id']);
      cartProducts.add(product);
    }
  }

  cartBox.put("cartIds", cartIds);
  cartBox.put("cartProducts", cartProducts);

  // Update app bar cart

  print("Updated cartIds: ${cartBox.get("cartIds")}");
  print("Updated cartProduct: ${cartBox.get("cartProducts")}");
}

void deleteCartProduct(productId) {
  final cartBox = Hive.box("cartBox");
  List<dynamic> cartIds = cartBox.get("cartIds");
  dynamic cartProducts = cartBox.get("cartProducts");
  // print(cartProducts);

  if (cartIds.contains(productId)) {
    cartIds.remove(productId);
    cartProducts.removeWhere((pro) => pro['id'] == productId);
  }

  print(cartProducts);

  cartBox.put("cartIds", cartIds);
  cartBox.put("cartProducts", cartProducts);
}

void clearCartProduct() {
  final cartBox = Hive.box("cartBox");
  cartBox.delete("cartIds");
  cartBox.delete("cartProducts");
}
