import 'package:big_cart/configs/color/color.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../../configs/components/custom_textfiled.dart';
import '../../../configs/utils.dart';

class InputEmailWidget extends StatelessWidget {
  final FocusNode focusNode, passwordFocusNode;
  const InputEmailWidget(
      {Key? key, required this.focusNode, required this.passwordFocusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(builder: (context, provider, child) {
      return CustomTextField(
        hintText: 'Email',
        // labelText: 'Email',
        controller: provider.emailController,
        focusNode: focusNode,
        keyboardType: TextInputType.emailAddress,
        fillColor: AppColors.whiteColor,
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(context, focusNode, passwordFocusNode);
        },
        onChanged: (value) {
          provider.setEmail(value!);
        },
        prefixIcon: Icon(Icons.email_outlined),
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
