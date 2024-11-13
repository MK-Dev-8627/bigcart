import 'package:big_cart/configs/extensions.dart';

import 'package:flutter/material.dart';

import '../../configs/components/custom_appbar.dart';
import 'widgets/input_name_widget.dart';
import 'widgets/input_phone_widget.dart';
import 'widgets/save_button_widget.dart';
import 'widgets/input_confirm_password_widget.dart';
import 'widgets/input_new_password_widget.dart';
import 'widgets/input_password_widget.dart';
import 'widgets/input_email_widget.dart';

class AboutMeView extends StatefulWidget {
  const AboutMeView({super.key});

  @override
  State<AboutMeView> createState() => _AboutMeViewState();
}

class _AboutMeViewState extends State<AboutMeView> {
  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final currentPwdFocusNode = FocusNode();
  final newPwdFocusNode = FocusNode();
  final confirmPwdFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    currentPwdFocusNode.dispose();
    newPwdFocusNode.dispose();
    confirmPwdFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'About Me',
        autoImplyLeading: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.height,
                    Text(
                      'Personal Details',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    10.height,
                    InputNameWidget(
                        focusNode: nameFocusNode, emailFocusNode: emailFocusNode),
                    10.height,
                    InputEmailWidget(
                        focusNode: emailFocusNode,
                        phoneFocusNode: phoneFocusNode,),
                    10.height,
                    InputPhoneWidget(
                        focusNode: phoneFocusNode,
                        passwordFocusNode: currentPwdFocusNode),
                    20.height,
                    Text(
                      'Change Password',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    10.height,
                    InputCurrentPasswordWidget(
                        focusNode: currentPwdFocusNode,
                        newPwdFocusNode: newPwdFocusNode),
                    10.height,
                    InputNewPasswordWidget(
                        focusNode: newPwdFocusNode,
                        confirmPwdFocusNode: confirmPwdFocusNode),
                    10.height,
                    InputConfirmPasswordWidget(
                      focusNode: confirmPwdFocusNode,
                    ),
                    20.height,
                    SaveButtonWidget(),
                    20.height,
                  ],
                )),
          )),
    );
    ;
  }
}
