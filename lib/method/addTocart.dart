import 'package:hive_flutter/hive_flutter.dart';

void cartMethod(dynamic product) {
  // Retrieve the Hive box
  var cartBox = Hive.box("cartBox");

  List<dynamic> cartIds = cartBox.get("cartIds");
  dynamic cartProduct = cartBox.get("cartProduct");

  if (cartIds.isEmpty || cartProduct.isEmpty) {
    cartIds = [product['id']];
    cartProduct = [product];
  } else {
    if (cartIds.contains(product['id'])) {
      cartIds.remove(product['id']);
      cartProduct.removeWhere((item) => item['id'] == product['id']);
    } else {
      cartIds.add(product['id']);
      cartProduct.add(product);
    }
  }

  cartBox.put("cartIds", cartIds);
  cartBox.put("cartProduct", cartProduct);

  // print("Updated cartIds: ${cartBox.get("cartIds")}");
  // print("Updated cartProduct: ${cartBox.get("cartProduct")}");
}
