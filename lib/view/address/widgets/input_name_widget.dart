import 'package:big_cart/configs/color/color.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../../configs/components/custom_textfiled.dart';
import '../../../configs/utils.dart';
import '../../../view_model/shipping/shipping_view_model.dart';

class InputNameWidget extends StatelessWidget {
  final FocusNode focusNode, emailFocusNode;
  const InputNameWidget(
      {Key? key, required this.focusNode, required this.emailFocusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShippingViewModel>(builder: (context, provider, child) {
      return CustomTextField(
        hintText: 'Name',
        controller: provider.nameController,
        focusNode: focusNode,
        keyboardType: TextInputType.text,
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(context, focusNode, emailFocusNode);
        },
        onChanged: (value) {
          provider.setName(value!);
        },
        prefixIcon: Icon(Icons.account_circle_outlined,size: 30,),
      );

    });
  }
}
