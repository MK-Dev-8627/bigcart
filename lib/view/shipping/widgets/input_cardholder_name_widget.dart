import 'package:big_cart/configs/color/color.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../../configs/components/custom_textfiled.dart';
import '../../../configs/utils.dart';
import '../../../view_model/shipping/shipping_view_model.dart';

class InputCardHolderNameWidget extends StatelessWidget {
  final FocusNode focusNode, cardNumberFocusNode;
  const InputCardHolderNameWidget(
      {Key? key, required this.focusNode, required this.cardNumberFocusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShippingViewModel>(builder: (context, provider, child) {
      return CustomTextField(
        hintText: 'Card Holder Name',
        controller: provider.cardHolderNameController,
        focusNode: focusNode,
        keyboardType: TextInputType.text,
        fillColor: Theme.of(context).cardColor,
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(context, focusNode, cardNumberFocusNode);
        },
        onChanged: (value) {
          provider.setCardHolderName(value!);
        },
        prefixIcon: const Icon(Icons.account_circle_outlined,size: 30,),
      );

    });
  }
}
