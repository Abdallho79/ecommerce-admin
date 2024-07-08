import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:admin/core/Constant/AppTheme_Const.dart';
import 'package:admin/core/Functions/FCMConfingration_Functions.dart';
import 'package:admin/core/Services/Services.dart';

class LanguageController extends GetxController {
  MyServices myServices = Get.find();
  Locale? language;
  ThemeData apptheme = Themes.themeEnglish;
  changeLang(String codelang) {
    Locale locale = Locale(codelang);
    ThemeData theme =
        codelang == "ar" ? Themes.themeArabic : Themes.themeEnglish;
    myServices.sharedPreferences.setString("lang", codelang);
    Get.updateLocale(locale);
    Get.changeTheme(theme);
  }

  @override
  void onInit() {
    requestNotiPermission();
    fcmConfig();
    String? sharedpreflang = myServices.sharedPreferences.getString("lang");
    if (sharedpreflang == "ar") {
      language = Locale("ar");
      apptheme = Themes.themeArabic;
    } else if (sharedpreflang == "en") {
      language = Locale("en");
      apptheme = Themes.themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      apptheme = Themes.themeEnglish;
    }
    super.onInit();
  }
}
