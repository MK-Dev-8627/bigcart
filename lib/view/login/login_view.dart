import 'package:big_cart/configs/assets/image_assets.dart';
import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/configs/components/custom_text_button.dart';
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
                top: 0,
                child: LoginBackgroundImage(
                  image: ImageAssets.login,
                )),
            Positioned(
              // bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(20),
                height: context.mediaQueryHeight * 0.6,
                decoration: const BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back !',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    5.height,
                    Text(
                      'Sign in to your account',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: context.mediaQueryHeight * .02,
                    ),
                    InputEmailWidget(
                        focusNode: emailFocusNode,
                        passwordFocusNode: passwordFocusNode),
                    10.height,
                    InputPasswordWidget(focusNode: passwordFocusNode),
                    20.height,
                    Consumer<LoginViewModel>(
                        builder: (context, provider, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Transform.scale(
                                scale: 0.6,
                                child: Switch(
                                    activeColor: AppColors.primaryDarkColor,
                                    value: provider.rememberMe,
                                    onChanged: (value) =>
                                        provider.setRememberMe(value)),
                              ),
                              Text(
                                'Remember Me',
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                          CustomTextButton(
                              title: 'Forget Password', onPress: () {})
                        ],
                      );
                    }),
                    SizedBox(
                      height: context.mediaQueryHeight * .05,
                    ),
                    const SignupButtonWidget(),
                    SizedBox(
                      height: context.mediaQueryHeight * .02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account ?',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        CustomTextButton(
                          title: 'Sign Up',
                          textColor: AppColors.blackColor,
                          onPress: () {
                            Navigator.pushNamedAndRemoveUntil(context, RoutesName.signup, (route) => false);
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
