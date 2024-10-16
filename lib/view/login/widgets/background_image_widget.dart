import 'package:big_cart/configs/extensions.dart';
import 'package:flutter/material.dart';

class LoginBackgroundImage extends StatelessWidget {
  LoginBackgroundImage({
    super.key,
    required this.image,
  });

  String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      //ImageAssets.login,
      height: context.mediaQueryHeight * 0.6,
      width: context.mediaQueryWidth,
      fit: BoxFit.cover,
    );
  }
}