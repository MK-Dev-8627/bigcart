import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/configs/extensions.dart';
import 'package:big_cart/view/shipping/widgets/input_address_widget.dart';
import 'package:big_cart/view/shipping/widgets/input_city_widget.dart';
import 'package:big_cart/view/shipping/widgets/input_country_widget.dart';
import 'package:big_cart/view/shipping/widgets/input_zipcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_model/shipping/shipping_view_model.dart';
import 'input_email_widget.dart';
import 'input_phone_widget.dart';
import 'input_name_widget.dart';

class ShippingAddressWidget extends StatefulWidget {
  const ShippingAddressWidget({super.key});

  @override
  State<ShippingAddressWidget> createState() => _ShippingAddressWidgetState();
}

class _ShippingAddressWidgetState extends State<ShippingAddressWidget> {
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
      return Column(
        children: [
          InputNameWidget(
              focusNode: nameFocusNode, emailFocusNode: emailFocusNode),
          10.height,
          InputEmailWidget(
            focusNode: emailFocusNode,
            phoneFocusNode: phoneFocusNode,
          ),
          10.height,
          InputPhoneWidget(
              focusNode: phoneFocusNode, addressFocusNode: addressFocusNode),
          10.height,
          InputAddressWidget(
              focusNode: addressFocusNode, zipCodeFocusNode: zipCodeFocusNode),
          10.height,
          InputZipCodeWidget(
              focusNode: zipCodeFocusNode, cityFocusNode: cityFocusNode),
          10.height,
          InputCityWidget(
              focusNode: cityFocusNode, countryFocusNode: countryFocusNode),
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
                'Save for later',
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
          10.height,
        ],
      );
    });
  }
}
