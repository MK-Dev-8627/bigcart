import 'package:big_cart/view/bottom_nav_bar/bottom_nav_bar_view.dart';
import 'package:big_cart/view/catergories/categories_view.dart';
import 'package:big_cart/view/product_details/product_details_view.dart';
import 'package:big_cart/view/signup/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/configs/routes/routes_name.dart';
import 'package:big_cart/view/home/home_view.dart';
import 'package:big_cart/view/login/login_view.dart';
import 'package:big_cart/view/splash/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());

      case RoutesName.bottomNavBarView:
        return MaterialPageRoute(
            builder: (BuildContext context) => CurvedBottomNavBar(),
            settings: settings);

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView(),
            settings: settings);

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView(),
            settings: settings);
      case RoutesName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignupView(),
            settings: settings);

      case RoutesName.productDetails:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProductDetailsView(),
            settings: settings);
      case RoutesName.categories:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CategoriesView(),
            settings: settings);

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
