Map<String, String> lang = {
  'home': 'হোম',
  'category': 'প্রকার',
  'cart': 'কার্ট',
  'add': 'যোগ করুন',
  'cancel': 'বাতিল করুন',
  'profile': 'প্রোফাইল',
  'add_to_cart': 'কার্ডে যোগ করুন',
  'add_to_piece': 'পিসে যোগ করুন',
  'add_to_boundel': 'বান্ডেলে যোগ করুন',
  'view_cart': 'কার্ট দেখুন',
  'checkout': 'চেকআউট',
  'feature_product': "বৈশিষ্ট্য পণ্য",
  'brand_product': "ব্র্যান্ড পণ্য",
  'all_products': "সকল পণ্য",
  'product_details': 'পণ্যের বিবরণ',
  'quantity': 'পরিমাণ',
  'price': 'মূল্য',
  'total': 'মোট',
  'remove': 'সরান',
  'continue_shopping': 'কেনাকাটা চালিয়ে যান',
  'order_summary': 'অর্ডার সারাংশ',
  'subtotal': 'সাবটোটাল',
  'shipping': 'শিপিং',
  'tax': 'ট্যাক্স',
  'grand_total': 'মোট টাকা',
  'shipping_address': 'শিপিং ঠিকানা',
  'payment_method': 'পেমেন্ট পদ্ধতি',
  'place_order': 'অর্ডার করুন',
  'search': 'অনুসন্ধান করুন',
  'account': 'অ্যাকাউন্ট',
  'account_settings': 'অ্যাকাউন্ট সেটিংস',
  'wishlist': 'ইচ্ছেতালিকা',
  'address_book': 'ঠিকানা বই',
  'payment': 'পেমেন্ট',
  'orders': 'অর্ডার',
  'one_piece_price': '১ পিস এর মূল্য',
  'one_bundle_price': "১ বান্ডিল এর মূল্য",
  'notifications': 'বিজ্ঞপ্তিসমূহ',
  'logout': 'লগআউট',
  'auth': 'প্রাধিকরণী',
  'login': 'লগ ইন',
  'signup': 'সাইন আপ',
  'username': 'ব্যবহারকারীর নাম',
  'email': 'ইমেইল',
  'password': 'পাসওয়ার্ড',
  'forgot_password': 'পাসওয়ার্ড ভুলে গেছেন?',
  'reset_password': 'পাসওয়ার্ড রিসেট',
  'new_password': 'নতুন পাসওয়ার্ড',
  'confirm_password': 'পাসওয়ার্ড নিশ্চিত করুন',
  'remember_me': 'আমাকে মনে রাখুন',
  'login_with_google': 'Google দিয়ে লগইন করুন',
  'login_with_facebook': 'Facebook দিয়ে লগইন করুন',
  'show_more': 'আরও দেখুন',
  'load_more': 'আরও লোড করুন',
  'colors': 'রঙ',
  'color': 'রঙ',
  'product_colors': 'পণ্যের রঙ',
  'product_color': 'পণ্যের রঙ',
  'size': 'সাইজ',
  'product_size': 'পণ্যের সাইজ',
  'description': 'বর্ণনা',
  'product_description': 'পণ্যের বর্ণনা',
  "change_language": 'ভাষা পরিবর্তন করুন',
  'change': 'পরিবর্তন করুন',
  'english': 'ইংরেজি',
  'bangla': 'বাংলা',
  'in_your_cart': 'আপনার কার্টে',
  'in_your_wishlist': 'ইচ্ছা তালিকায়',
  'in_you_ordered': 'ক্রয় করেছেন',
  'my_order': "আমার অর্ডার",
  'my_wishlist': "আমার ইচ্ছে তালিকা",
  'message': "বার্তা",
  'buy_now': "ক্রয় করুন",
  "cart_product": 'কার্টের পণ্য',
  "items": "আইটেমস্‌",
  "already_added": "অ্যাড আছে",
};

String getBanglaLang(String key) {
  return lang[key] ?? "";
}
