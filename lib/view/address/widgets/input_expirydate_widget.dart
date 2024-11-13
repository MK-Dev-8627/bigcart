import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/view_model/signup/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../../configs/components/custom_textfiled.dart';
import '../../../configs/utils.dart';
import '../../../view_model/shipping/shipping_view_model.dart';

class InputExpiryDateWidget extends StatelessWidget {
  final FocusNode focusNode, cvvFocusNode;
  const InputExpiryDateWidget(
      {Key? key, required this.focusNode, required this.cvvFocusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShippingViewModel>(builder: (context, provider, child) {
      return CustomTextField(
        hintText: 'Month / Year',
        // labelText: 'ExpiryDate',
        controller: provider.monthYearController,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        fillColor: Theme.of(context).cardColor,
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(context, focusNode, cvvFocusNode);
        },
        onChanged: (value) {
          provider.setMonthYear(value!);
        },
        prefixIcon: const Icon(Icons.calendar_month_outlined,size: 30,),
      );

      /*  TextFormField(
            keyboardType: TextInputType.emailcvv,
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
