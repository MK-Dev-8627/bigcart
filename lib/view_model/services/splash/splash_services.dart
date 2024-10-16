import 'dart:async';
import 'package:flutter/material.dart';
import 'package:big_cart/view_model/services/session_manager/session_controller.dart';
import '../../../configs/routes/routes_name.dart';


class SplashServices {

  void checkAuthentication(BuildContext context)async{
     bool  isLogin = false;
    if(isLogin){
      Timer(const Duration(seconds: 2),
            () =>
            Navigator.pushNamedAndRemoveUntil(context, RoutesName.bottomNavBarView, (route) => false),
      );
    }else {
      Timer(const Duration(seconds: 2),
            () =>
            Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false),
      );

    }
/*

    SessionController().getUserFromPreference().then((value)async{

      // if(SessionController().isLogin!){
      if(true){
        Timer(const Duration(seconds: 2),
              () =>
          Navigator.pushNamedAndRemoveUntil(context, RoutesName.home, (route) => false),
        );
      }else {
        Timer(const Duration(seconds: 2),
              () =>
          Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false),
        );

      }

    }).onError((error, stackTrace){

      Timer(const Duration(seconds: 2),
            () =>
        Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false),
      );

    });
*/

  }



}