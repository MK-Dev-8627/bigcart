import 'package:big_cart/configs/color/color.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../../configs/components/custom_textfiled.dart';
import '../../../configs/utils.dart';
import '../../../view_model/shipping/shipping_view_model.dart';

class InputZipCodeWidget extends StatelessWidget {
  final FocusNode focusNode, cityFocusNode;
  const InputZipCodeWidget(
      {Key? key, required this.focusNode, required this.cityFocusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShippingViewModel>(builder: (context, provider, child) {
      return CustomTextField(
        hintText: 'ZipCode',
        controller: provider.zipCodeController,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(context, focusNode, cityFocusNode);
        },
        onChanged: (value) {
          provider.setZipCode(value!);
        },
        prefixIcon: const Icon(Icons.password_outlined,size: 30,),
      );

    });
  }
}
