import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/view_model/signup/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../../configs/components/custom_textfiled.dart';
import '../../../configs/utils.dart';
import '../../../view_model/shipping/shipping_view_model.dart';

class InputCvvWidget extends StatelessWidget {
  final FocusNode focusNode;
  const InputCvvWidget(
      {Key? key, required this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShippingViewModel>(builder: (context, provider, child) {
      return CustomTextField(
        hintText: 'CVV',
        // labelText: 'Cvv',
        controller: provider.cvvController,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        fillColor: Theme.of(context).cardColor,
        onFieldSubmitted: (value) {
          // Utils.fieldFocusChange(context, focusNode, monthYearFocusNode);
        },
        onChanged: (value) {
          provider.setCvv(value!);
        },
        prefixIcon: const Icon(Icons.lock_outline,size: 30,),
      );

    });
  }
}
