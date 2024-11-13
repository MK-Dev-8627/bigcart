import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/configs/components/custom_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../../configs/utils.dart';

class InputNewPasswordWidget extends StatelessWidget {
  InputNewPasswordWidget({Key? key, required this.focusNode, required this.confirmPwdFocusNode}) : super(key: key);

  final FocusNode focusNode, confirmPwdFocusNode;
  final ValueNotifier<bool> _obSecurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(builder: (context, provider, child) {
      return ValueListenableBuilder(
          valueListenable: _obSecurePassword,
          builder: (context, value, child) {
            return CustomTextField(
              controller: provider.newPasswordController, focusNode: focusNode,
              hintText: 'New Password',
              // labelText: 'Password',
              obscureText: _obSecurePassword.value,
              fillColor: Theme.of(context).cardColor,
              prefixIcon: const Icon(Icons.lock_outlined,size: 30,),
              suffixIcon: InkWell(
                  onTap: () {
                    _obSecurePassword.value = !_obSecurePassword.value;
                  },
                  child: Icon(_obSecurePassword.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility,size: 20,)),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(context, focusNode, confirmPwdFocusNode);
              },
              onChanged: (value) {
                provider.setNewPassword(value!);
              },
            );

          });
    });
  }
}
