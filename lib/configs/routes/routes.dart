import 'package:big_cart/view/bottom_nav_bar/bottom_nav_bar_view.dart';
import 'package:big_cart/view/signup/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/configs/routes/routes_name.dart';
import 'package:big_cart/view/home/home_view.dart';
import 'package:big_cart/view/login/login_view.dart';
import 'package:big_cart/view/splash/splash_view.dart';

class Routes {

  static Route<dynamic>  generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashView());

      case RoutesName.bottomNavBarView:
        return MaterialPageRoute(builder: (BuildContext context) =>  CurvedBottomNavBar());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeView());

      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());

        case RoutesName.signup:
        return MaterialPageRoute(builder: (BuildContext context) => const SignupView());

      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });

    }
  }
}