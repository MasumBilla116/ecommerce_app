import 'package:hive_flutter/hive_flutter.dart';

void wishlist(product) {
  final wishlistBox = Hive.box('wishlistBox');
  dynamic wishlistProducts = wishlistBox.get('wishlistProducts');
  dynamic wishlistProductIds = wishlistBox.get('wishlistProductIds');

  if (wishlistProducts == null || wishlistProductIds == null) {
    wishlistProducts = [];
    wishlistProductIds = [];
  } else {
    if (wishlistProductIds.contains(product['id'])) {
      wishlistProductIds.remove(product['id']);
      wishlistProducts.removeWhere((pro) => pro['id'] == product['id']);
    } else {
      wishlistProducts.add(product);
      wishlistProductIds.add(product['id']);
      wishlistBox.put('wishlistProducts', wishlistProducts);
      wishlistBox.put('wishlistProductIds', wishlistProductIds);
    }
  }

  // print(wishlistBox.get('wishlistProducts'));
  // print(wishlistBox.get('wishlistProductIds'));
}
