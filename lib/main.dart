import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/view_model/signup/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/repository/auth_api/auth_http_api_repository.dart';
import 'package:big_cart/repository/auth_api/auth_repository.dart';
import 'package:big_cart/repository/home_api/home_http_api_repository.dart';
import 'package:big_cart/repository/home_api/home_repository.dart';
import 'package:big_cart/view_model/home/home_view_model.dart';
import 'package:big_cart/view_model/login/login_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'configs/routes/routes.dart';
import 'configs/routes/routes_name.dart';

// creating an instance of GetIt
// GetIt is a package used for service locator or to manage dependency injection
GetIt getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerLazySingleton<AuthRepository>(() => AuthHttpApiRepository());
  getIt.registerLazySingleton<HomeRepository>(() => HomeHttpApiRepository());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // initializing all the view model crated with Provider to used them across the app
        ChangeNotifierProvider(
            create: (_) => LoginViewModel(authRepository: getIt())),
        ChangeNotifierProvider(
            create: (_) => SignupViewModel(authRepository: getIt())),
        ChangeNotifierProvider(
            create: (_) => HomeViewModel(homeRepository: getIt())),
      ],
      child: MaterialApp(
        title: 'Big Cart',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: AppColors.primaryColor,
          backgroundColor: AppColors.backgroundColor,
          canvasColor: AppColors.textColor,
          cardColor: AppColors.whiteColor,
          iconTheme: const IconThemeData(
            color: AppColors.textColor, // Set the default icon color here
            // size: 30, // Optional: You can also change the default size of icons
          ),
          fontFamily: 'poppins',
          textTheme: const TextTheme(
            titleLarge: TextStyle(color: AppColors.blackColor,fontWeight: FontWeight.w600,fontSize: 18),
            titleMedium: TextStyle(color: AppColors.textColor,fontWeight: FontWeight.w600,fontSize: 15),
            titleSmall: TextStyle(color: AppColors.textColor,),
            bodyLarge: TextStyle(color: AppColors.textColor),
            bodyMedium: TextStyle(color: AppColors.textColor),
            bodySmall: TextStyle(color: AppColors.textColor),
          ),
        ),
        // this is the initial route indicating from where our app will start
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
