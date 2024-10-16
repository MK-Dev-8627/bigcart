import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/view_model/signup/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../../configs/components/custom_textfiled.dart';
import '../../../configs/utils.dart';

class InputPhoneWidget extends StatelessWidget {
  final FocusNode focusNode, passwordFocusNode;
  const InputPhoneWidget(
      {Key? key, required this.focusNode, required this.passwordFocusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupViewModel>(builder: (context, provider, child) {
      return CustomTextField(
        hintText: 'Phone number',
        // labelText: 'Phone',
        controller: provider.phoneController,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        fillColor: AppColors.whiteColor,
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(context, focusNode, passwordFocusNode);
        },
        onChanged: (value) {
          provider.setPhone(value!);
        },
        prefixIcon: Icon(Icons.phone),
      );

      /*  TextFormField(
            keyboardType: TextInputType.emailAddress,
            focusNode: focusNode,
            decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.alternate_email)
            ),
            onFieldSubmitted: (value){
              Utils.fieldFocusChange(context, focusNode, passwordFocusNode);
            },
            onChanged: (value){
              provider.setEmail(value);
            },
          );*/
    });
  }
}
