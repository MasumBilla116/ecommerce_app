import 'package:ecommerce/language/Bangla.dart';
import 'package:ecommerce/language/English.dart';
import "package:hive_flutter/hive_flutter.dart";

enum LanguageType { bangla, english }

class Language {
  static LanguageType _currentLanguage = LanguageType.bangla;

  static void setLanguage(LanguageType languageType) {
    _currentLanguage = languageType;
  }

  static String load(key) {
    final _languageBox = Hive.box("languageBox");
    final settingLang = _languageBox.get("lang");

    if (settingLang == null) {
      _currentLanguage = LanguageType.english;
    } else {
      _currentLanguage = LanguageType.values
          .firstWhere((e) => e.toString() == 'LanguageType.$settingLang');
    }

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
