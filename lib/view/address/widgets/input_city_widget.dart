import 'package:big_cart/configs/color/color.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../../configs/components/custom_textfiled.dart';
import '../../../configs/utils.dart';
import '../../../view_model/shipping/shipping_view_model.dart';

class InputCityWidget extends StatelessWidget {
  final FocusNode focusNode, countryFocusNode;
  const InputCityWidget(
      {Key? key, required this.focusNode, required this.countryFocusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShippingViewModel>(builder: (context, provider, child) {
      return CustomTextField(
        hintText: 'City',
        controller: provider.cityController,
        focusNode: focusNode,
        keyboardType: TextInputType.text,
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(context, focusNode, countryFocusNode);
        },
        onChanged: (value) {
          provider.setCity(value!);
        },
        prefixIcon: const Icon(Icons.location_city_outlined,size: 30,),
      );

    });
  }
}
