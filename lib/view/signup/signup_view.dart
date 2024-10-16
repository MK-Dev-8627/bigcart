import 'package:big_cart/configs/assets/image_assets.dart';
import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/configs/components/custom_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/configs/extensions.dart';
import 'package:flutter/widgets.dart';
import '../../configs/routes/routes_name.dart';
import 'widgets/background_image_widget.dart';
import 'widgets/curved_container_widget.dart';
import 'widgets/input_email_widget.dart';
import 'widgets/input_password_widget.dart';
import 'widgets/input_phone_widget.dart';
import 'widgets/signup_button_widget.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();

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
              child: AuthBgImageWidget(image: ImageAssets.signup),
            ),
            Positioned(
                bottom: 0,
                child: CurvedContainer(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create Account',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    10.height,
                    Text(
                      'Quickly create account',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    20.height,
                    InputEmailWidget(
                        focusNode: emailFocusNode,
                        phoneFocusNode: phoneFocusNode),
                    10.height,
                    InputPhoneWidget(
                        focusNode: phoneFocusNode,
                        passwordFocusNode: passwordFocusNode),
                    10.height,
                    InputPasswordWidget(focusNode: passwordFocusNode),
                    SizedBox(
                      height: context.mediaQueryHeight * 0.02,
                    ),
                    SignupButtonWidget(),
                    20.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account? ',
                            style: Theme.of(context).textTheme.bodyMedium),
                        CustomTextButton(
                            title: 'Login',
                            onPress: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, RoutesName.login, (route) => false);
                            }),
                      ],
                    )
                  ],
                )))
          ],
        ),
      ),
    );
  }
}
