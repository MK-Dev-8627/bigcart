import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/view_model/signup/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../../configs/components/custom_textfiled.dart';
import '../../../configs/utils.dart';
import '../../../view_model/shipping/shipping_view_model.dart';

class InputCardNumberWidget extends StatelessWidget {
  final FocusNode focusNode, monthYearFocusNode;
  const InputCardNumberWidget(
      {Key? key, required this.focusNode, required this.monthYearFocusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShippingViewModel>(builder: (context, provider, child) {
      return CustomTextField(
        hintText: 'Card Number',
        // labelText: 'CardNumber',
        controller: provider.cardNumberController,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        fillColor: Theme.of(context).cardColor,
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(context, focusNode, monthYearFocusNode);
        },
        onChanged: (value) {
          provider.setCardNumber(value!);
        },
        prefixIcon: const Icon(Icons.wallet_outlined,size: 30,),
      );

      /*  TextFormField(
            keyboardType: TextInputType.emailmonthYear,
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
