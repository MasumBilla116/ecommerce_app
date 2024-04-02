Map<String, String> lang = {
  'add_to_cart': 'Add to Cart',
  'view_cart': 'View Cart',
  'checkout': 'Checkout',
  'product_details': 'Product Details',
  'quantity': 'Quantity',
  'price': 'Price',
  'total': 'Total',
  'remove': 'Remove',
  'continue_shopping': 'Continue Shopping',
  'order_summary': 'Order Summary',
  'subtotal': 'Subtotal',
  'shipping': 'Shipping',
  'tax': 'Tax',
  'grand_total': 'Grand Total',
  'shipping_address': 'Shipping Address',
  'payment_method': 'Payment Method',
  'place_order': 'Place Order',
  'search': 'Search',
  'account': 'Account',
  'account_settings': 'Account Settings',
  'wishlist': 'Wishlist',
  'address_book': 'Address Book',
  'payment': 'Payment',
  'orders': 'Orders',
  'one_piece_price': '1 PEICE PRICE',
  'one_bundle_price': "1 BUNDLE PRICE",
  'notifications': 'Notifications',
  'logout': 'Logout',
  'auth': 'Authorization',
  'login': 'Login',
  'signup': 'Sign Up',
  'username': 'Username',
  'email': 'Email',
  'password': 'Password',
  'forgot_password': 'Forgot Password?',
  'reset_password': 'Reset Password',
  'new_password': 'New Password',
  'confirm_password': 'Confirm Password',
  'remember_me': 'Remember Me',
  'login_with_google': 'Login with Google',
  'login_with_facebook': 'Login with Facebook',
};

String getEnglishLang(String key) {
  return lang[key] ?? "";
}
