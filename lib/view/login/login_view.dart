import 'package:big_cart/configs/assets/image_assets.dart';
import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/configs/components/custom_text_button.dart';
import 'package:big_cart/view/login/widgets/curved_container_widget.dart';
import 'package:big_cart/view/signup/widgets/background_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/configs/extensions.dart';
import 'package:big_cart/view/login/widgets/input_email_widget.dart';
import 'package:big_cart/view/login/widgets/input_password_widget.dart';
import 'package:big_cart/view/login/widgets/login_button_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../configs/routes/routes_name.dart';
import '../../view_model/login/login_view_model.dart';
import 'widgets/background_image_widget.dart';
import 'widgets/remember_me_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SizedBox(
        height: context.mediaQueryHeight,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
                top: 0, child: AuthBgImageWidget(image: ImageAssets.login)),
            Positioned(
              bottom: 0,
              child: CurvedContainer(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back !',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  5.height,
                  Text(
                    'Sign in your account',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  20.height,
                  InputEmailWidget(
                      focusNode: emailFocusNode,
                      passwordFocusNode: passwordFocusNode),
                  10.height,
                  InputPasswordWidget(focusNode: passwordFocusNode),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RememberMeSwitchWidget(),
                      CustomTextButton(
                          title: 'Forget password', onPress: () {}),
                    ],
                  ),
                  SizedBox(
                    height: context.mediaQueryHeight * 0.05,
                  ),
                  LoginButtonWidget(),
                  SizedBox(
                    height: context.mediaQueryHeight * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("Don't have account ?",
                      style: Theme.of(context).textTheme.bodyLarge,),
                      CustomTextButton(title: 'Sign Up',
                          textColor: AppColors.blackColor,
                          onPress: (){
                        Navigator.pushNamedAndRemoveUntil(context, RoutesName.signup, (route) => false);
                          }),
                  ],)
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
