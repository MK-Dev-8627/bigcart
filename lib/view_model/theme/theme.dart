import 'package:big_cart/view_model/theme/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../configs/color/color.dart';
import '../../configs/constants/constants.dart';

class ThemeNotifier with ChangeNotifier, WidgetsBindingObserver {
  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this); // remove the observer
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    final brightness = WidgetsBinding.instance?.window.platformBrightness;

    // Set device default theme

    // if (brightness == Brightness.dark) {
    //   _themeData =
    //       darkTheme; // update the theme to dark if the phone's brightness level is dark
    // } else {
    //   _themeData =
    //       lightTheme; // update the theme to light if the phone's brightness level is light
    // }
    notifyListeners(); // notify listeners that the theme has changed
  }

  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primaryDarkColor,
      selectionColor: AppColors.primaryColor,
      selectionHandleColor: AppColors.primaryColor,
    ),
    popupMenuTheme: PopupMenuThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: Colors.transparent, // make menu background transparent
      textStyle: TextStyle(
        color: Colors.white,
      ),
      elevation: 8.0,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xff2A3747),
      // backgroundColor: const Color(0xff162734),
    ),
    // fontFamily: AppFonts.poppins,
    primaryColor: const Color(0xffffffff),
    cardColor: const Color(0xff2A3747), // Color(0xff162734), // Feild, Card
    backgroundColor: Colors.transparent,
    scaffoldBackgroundColor: const Color(0xff182937), //Backgorund Color
    shadowColor: Colors.transparent,
    canvasColor: const Color(0xffF0536B), // Button Color
    highlightColor: const Color(0xffF0536B), // Icons BG Color
    // dialogBackgroundColor: Colors.white,
    toggleableActiveColor: AppColors.primaryColor,
    iconTheme: IconThemeData(size: 30)
  );

  final lightTheme = ThemeData(
    // brightness: Brightness.light,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primaryDarkColor,
      selectionColor: AppColors.primaryColor,
      selectionHandleColor: AppColors.primaryColor,
    ),
    // change copy/paste menu color
    // fontFamily: AppFonts.poppins,
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xffffffff),
    ),
    primaryColor: AppColors.primaryColor, //F2F2F2 Feild, Card
    scaffoldBackgroundColor: AppColors.backgroundColor, //Backgorund Color
    // shadowColor: Colors.transparent,
    shadowColor: Color(0xff000000).withOpacity(0.1),
    canvasColor: AppColors.textColor, // Button Color, Drawar Icons Color
    cardColor: const Color(0xffffffff),
    highlightColor: AppColors.primaryColor, // Icons BG Color
    dialogBackgroundColor: const Color(0xffffffff), //Color(0xffF1F4FF),
    toggleableActiveColor: AppColors.primaryColor,
    fontFamily: 'poppins',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: AppColors.blackColor),
      titleLarge: TextStyle(
          color: AppColors.blackColor,
          fontWeight: FontWeight.w600,
          fontSize: 18),
      titleMedium: TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.w600,
          fontSize: 15),
      titleSmall: TextStyle(
        color: AppColors.textColor,
      ),
      bodyLarge: TextStyle(color: AppColors.textColor),
      bodyMedium: TextStyle(color: AppColors.textColor),
      bodySmall: TextStyle(color: AppColors.textColor),
    ),
      iconTheme: IconThemeData(size: 30)
  );

  ThemeData? _themeData;

  ThemeData? getTheme() => _themeData;

  ThemeNotifier() {
    WidgetsBinding.instance?.addObserver(this);
    _initTheme();
  }
  void _initTheme() async {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    // Initialize theme based on stored value or system preference
    StorageManager.readData('themeMode').then((value) {
      bool themeMode = value ?? isDarkMode;
      _themeData = themeMode ? darkTheme : lightTheme;
      Constants.themValue = themeMode;
      notifyListeners();
    });
  }

  void getStoreValue() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("themeValue") != null) {
      var themeBoolValue = prefs.getBool("themeValue");

      print('themeBoolValue:  $themeBoolValue');
      Constants.themValue = themeBoolValue;
    } else {
      Constants.themValue = false;
    }
  }

  void setTheme({required bool themeValue}) async {
    Constants.themValue = themeValue;
    if (themeValue == false) {
      _themeData = lightTheme;
      StorageManager.saveData('themeMode', themeValue);
      notifyListeners();
    } else {
      _themeData = darkTheme;
      StorageManager.saveData('themeMode', themeValue);
      notifyListeners();
    }
    print('value updated.....');
    notifyListeners();
  }

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  void onThemeChange(BuildContext context, bool value) {
    _isDarkMode = !_isDarkMode;
    // _isDarkMode = value;
    setTheme(themeValue: _isDarkMode);

    notifyListeners();
  }
}
