import 'package:big_cart/configs/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../../configs/components/custom_textfiled.dart';
import '../../../configs/utils.dart';
import '../../../view_model/shipping/shipping_view_model.dart';

class InputCountryWidget extends StatelessWidget {
  final FocusNode focusNode;
  const InputCountryWidget(
      {Key? key, required this.focusNode,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShippingViewModel>(builder: (context, provider, child) {
      return CustomTextField(
        hintText: 'Country',
        controller: provider.countryController,
        focusNode: focusNode,
        keyboardType: TextInputType.text,
        onFieldSubmitted: (value) {
          // Utils.fieldFocusChange(context, focusNode, emailFocusNode);
        },
        onChanged: (value) {
          provider.setCountry(value!);
        },
        prefixIcon: const Icon(CupertinoIcons.globe,size: 30,),
      );

    });
  }
}
