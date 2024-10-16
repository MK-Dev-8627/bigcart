import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/configs/components/custom_textfiled.dart';
import 'package:big_cart/view_model/signup/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({Key? key, required this.focusNode}) : super(key: key);

  final FocusNode focusNode;
  final ValueNotifier<bool> _obSecurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupViewModel>(builder: (context, provider, child) {
      return ValueListenableBuilder(
          valueListenable: _obSecurePassword,
          builder: (context, value, child) {
            return CustomTextField(
              controller: provider.passwordController, focusNode: focusNode,
              fillColor: AppColors.whiteColor,
              hintText: 'Password',
              // labelText: 'Password',
              obscureText: _obSecurePassword.value,
              prefixIcon: const Icon(Icons.lock_outlined),
              suffixIcon: InkWell(
                  onTap: () {
                    _obSecurePassword.value = !_obSecurePassword.value;
                  },
                  child: Icon(_obSecurePassword.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility)),
              onChanged: (value) {
                provider.setPassword(value!);
              },
            );
          });
    });
  }
}
