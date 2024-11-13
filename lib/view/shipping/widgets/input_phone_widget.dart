import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/view_model/signup/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../../configs/components/custom_textfiled.dart';
import '../../../configs/utils.dart';
import '../../../view_model/shipping/shipping_view_model.dart';

class InputPhoneWidget extends StatelessWidget {
  final FocusNode focusNode, addressFocusNode;
  const InputPhoneWidget(
      {Key? key, required this.focusNode, required this.addressFocusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShippingViewModel>(builder: (context, provider, child) {
      return CustomTextField(
        hintText: 'Phone number',
        // labelText: 'Phone',
        controller: provider.phoneController,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        fillColor: Theme.of(context).cardColor,
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(context, focusNode, addressFocusNode);
        },
        onChanged: (value) {
          provider.setPhone(value!);
        },
        prefixIcon: Icon(Icons.phone_outlined,size: 30,),
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
