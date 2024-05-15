import 'package:hive_flutter/hive_flutter.dart';

void addToCart(cartItem) {
  // Retrieve the Hive box
  final cartBox = Hive.box("cartBox");
  dynamic cartProducts = cartBox.get("cartProducts");
  // cartProducts = null;
  cartItem = {...cartItem, 'quantity': 1};
  if (cartProducts == null) {
    cartProducts = {
      'total_items': 1,
      'total_price': cartItem['price'],
      'products': [cartItem]
    };
  } else {
    List<dynamic> cartProductItems = cartProducts['products'];
    bool productExists =
        cartProductItems.any((item) => item['id'] == cartItem['id']);
    if (!productExists) {
      cartProductItems.add(cartItem);
      cartProducts['total_items'] += 1;
      cartProducts['total_price'] += cartItem['price'];
    }
  }
  cartBox.put("cartProducts", cartProducts);
  // print("cart: ${cartBox.get("cartProducts")}");
}

void incrementOrDecrementCartItems(productId, type) {
  final cartBox = Hive.box("cartBox");
  dynamic cartProducts = cartBox.get("cartProducts");
  if (cartProducts != null) {
    List<dynamic> cartProductItems = cartProducts['products'];

    var productIndex =
        cartProductItems.indexWhere((item) => item['id'] == productId);
    if (productIndex != -1) {
      if (type == 'increment') {
        cartProductItems[productIndex]['quantity'] += (1);
        cartProducts['total_price'] += cartProductItems[productIndex]['price'];
      } else {
        if (cartProductItems[productIndex]['quantity'] > 1) {
          cartProductItems[productIndex]['quantity'] -= 1;
          cartProducts['total_price'] -=
              cartProductItems[productIndex]['price'];
        }
      }
      cartBox.put("cartProducts", cartProducts);
      // print("inc or dec cart: ${cartBox.get("cartProducts")}");
    }
  }
}

void deleteCartProduct(product) {
  final cartBox = Hive.box("cartBox");
  dynamic cartProducts = cartBox.get("cartProducts");
  if (cartProducts != null) {
    List<dynamic> products = cartProducts['products'];
    products.removeWhere((item) => item['id'] == product['id']);

    if (cartProducts['total_items'] != null &&
        cartProducts['total_items'] > 0) {
      cartProducts['total_items'] -= 1;
    }
    if (cartProducts['total_price'] != null && product['price'] != null) {
      cartProducts['total_price'] -= product['price'];
    }

    cartProducts['products'] = products;
    cartBox.put("cartProducts", cartProducts);
  }
}

void clearCartProduct() {
  final cartBox = Hive.box("cartBox");
  cartBox.delete("cartProducts");
}
