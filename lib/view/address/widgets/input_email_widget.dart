import 'package:big_cart/configs/color/color.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../../configs/components/custom_textfiled.dart';
import '../../../configs/utils.dart';
import '../../../view_model/shipping/shipping_view_model.dart';

class InputEmailWidget extends StatelessWidget {
  final FocusNode focusNode, phoneFocusNode;
  const InputEmailWidget(
      {Key? key, required this.focusNode, required this.phoneFocusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShippingViewModel>(builder: (context, provider, child) {
      return CustomTextField(
        hintText: 'Email',
        // labelText: 'Email',
        controller: provider.emailController,
        focusNode: focusNode,
        keyboardType: TextInputType.emailAddress,
        // fillColor: Theme.of(context).cardColor,
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(context, focusNode, phoneFocusNode);
        },
        onChanged: (value) {
          provider.setEmail(value!);
        },
        prefixIcon: const Icon(Icons.email_outlined,size: 30,),
      );

    });
  }
}