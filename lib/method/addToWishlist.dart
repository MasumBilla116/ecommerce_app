import 'package:hive_flutter/hive_flutter.dart';

final wishlistBox = Hive.box('wishlistBox');
void wishlist(product) {
  dynamic wishlistProducts = wishlistBox.get('wishlistProducts');
  dynamic wishlistProductIds = wishlistBox.get('wishlistProductIds');
  // print(product);
  // print(wishlistProducts);
  // print(wishlistProductIds);

  if (wishlistProducts == null || wishlistProductIds == null) {
    wishlistProducts = [product];
    wishlistProductIds = [product['id']];
  } else {
    if (wishlistProductIds.contains(product['id'])) {
      wishlistProductIds.remove(product['id']);
      wishlistProducts.removeWhere((pro) => pro['id'] == product['id']);
    } else {
      wishlistProducts.add(product);
      wishlistProductIds.add(product['id']);
    }
  }

  wishlistBox.put('wishlistProducts', wishlistProducts);
  wishlistBox.put('wishlistProductIds', wishlistProductIds);

  // print(wishlistBox.get('wishlistProducts'));
  // print(wishlistBox.get('wishlistProductIds'));
}

void clearWishlist() {
  wishlistBox.delete('wishlistProducts');
  wishlistBox.delete('wishlistProductIds');
}
