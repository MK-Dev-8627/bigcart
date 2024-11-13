import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/configs/extensions.dart';
import 'package:big_cart/view/shipping/widgets/input_address_widget.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../../view_model/shipping/shipping_view_model.dart';
import 'input_email_widget.dart';
import 'input_phone_widget.dart';
import 'input_name_widget.dart';
import 'input_city_widget.dart';
import 'input_country_widget.dart';
import 'input_zipcode_widget.dart';

class InputMyAddressWidget extends StatefulWidget {
  const InputMyAddressWidget({super.key});

  @override
  State<InputMyAddressWidget> createState() => _InputMyAddressWidgetState();
}

class _InputMyAddressWidgetState extends State<InputMyAddressWidget> {
  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final addressFocusNode = FocusNode();
  final zipCodeFocusNode = FocusNode();
  final cityFocusNode = FocusNode();
  final countryFocusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    addressFocusNode.dispose();
    zipCodeFocusNode.dispose();
    cityFocusNode.dispose();
    countryFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ShippingViewModel>(builder: (context, provider, child) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            InputNameWidget(
                focusNode: nameFocusNode, emailFocusNode: emailFocusNode),
            10.height,
            InputEmailWidget(
                focusNode: emailFocusNode, phoneFocusNode: phoneFocusNode),
            10.height,
            InputPhoneWidget(
                focusNode: phoneFocusNode, addressFocusNode: addressFocusNode),
            10.height,
            InputAddressWidget(
                focusNode: addressFocusNode, zipCodeFocusNode: zipCodeFocusNode),
            10.height,
            Row(
              children: [
                Expanded(
                  child: InputZipCodeWidget(
                      focusNode: zipCodeFocusNode, cityFocusNode: cityFocusNode),
                ),
                10.width,
                Expanded(
                  child: InputCityWidget(
                      focusNode: cityFocusNode, countryFocusNode: countryFocusNode),
                ),
              ],
            ),
            10.height,
            InputCountryWidget(focusNode: countryFocusNode),
            10.height,
            Row(
              children: [
                Transform.scale(
                  scale: 0.7,
                  child: Switch(
                    value: provider.saveForLater,
                    onChanged: (value) {
                      provider.setSaveForLater(value);
                    },
                    activeColor: AppColors.primaryDarkColor,
                  ),
                ),
                Text(
                  'Make default',
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
            10.height,
          ],
        ),
      );
    });
  }
}
