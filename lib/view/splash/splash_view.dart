import 'package:big_cart/configs/extensions.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/view_model/services/splash/splash_services.dart';

import '../../configs/assets/image_assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: context.mediaQueryHeight,
          width: context.mediaQueryWidth,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageAssets.splashScreen),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              150.height,
              Image.asset(
                ImageAssets.bigCart,
                height: 100,
              )
            ],
          )
          // Center(
          //   child: Text('Big Cart', style: Theme.of(context).textTheme.displayLarge,),
          // ),
          ),
    );
  }
}
