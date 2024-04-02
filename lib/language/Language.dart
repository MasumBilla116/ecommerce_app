import 'package:ecommerce/language/Bangla.dart';
import 'package:ecommerce/language/English.dart';

enum LanguageType { bangla, english }

class Language {
  static late LanguageType _currentLanguage = LanguageType.bangla;

  static void setLanguage(LanguageType languageType) {
    _currentLanguage = languageType;
  }

  static String load(key) {
    switch (_currentLanguage) {
      case LanguageType.bangla:
        return getBanglaLang(key);
      case LanguageType.english:
        return getEnglishLang(key);
      default:
        return getEnglishLang(key);
    }
  }
}
