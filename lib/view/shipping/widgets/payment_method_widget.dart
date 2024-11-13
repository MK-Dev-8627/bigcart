import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/configs/components/custom_toggle_btn_widget.dart';
import 'package:big_cart/configs/extensions.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../../configs/assets/image_assets.dart';
import '../../../view_model/shipping/shipping_view_model.dart';

import 'input_cardholder_name_widget.dart';
import 'input_cardnumber_widget.dart';
import 'input_cvv_widget.dart';
import 'input_expirydate_widget.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({super.key});

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  final cardHolderNameFocusNode = FocusNode();
  final cardNumberFocusNode = FocusNode();
  final monthYearFocusNode = FocusNode();
  final cvvFocusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cardHolderNameFocusNode.dispose();
    cardNumberFocusNode.dispose();
    monthYearFocusNode.dispose();
    cvvFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ShippingViewModel>(builder: (context, provider, child) {
      return Column(
        children: [
          CustomToggleButton(isSelected: provider.isSelected, onChanged:(bools) {
            provider.setIsSelected(bools);
          }, btnLabels: provider.btnLabels),
          Container(
            height: 200,
            width: context.mediaQueryWidth,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage(ImageAssets.card), fit: BoxFit.contain)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      ImageAssets.masterCard,
                      height: 30,
                    ),
                    20.height,
                    Text(
                      'XXXX XXXX XXXX 4589',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.whiteColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CARD HOLDER',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.whiteColor),
                      ),
                      Text(
                        'MK Dev',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColors.whiteColor),
                      ),
                    ],
                  ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'EXPIRES',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: AppColors.whiteColor),
                        ),
                        Text(
                          '01 / 26',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: AppColors.whiteColor),
                        ),
                      ],
                                        ),
                    ),
                ],)
              ],
            ),
          ),
          20.height,
          InputCardHolderNameWidget(
              focusNode: cardHolderNameFocusNode,
              cardNumberFocusNode: cardNumberFocusNode),
          10.height,
          InputCardNumberWidget(
              focusNode: cardNumberFocusNode,
              monthYearFocusNode: monthYearFocusNode),
          10.height,
          Row(
            children: [
              Expanded(
                child: InputExpiryDateWidget(
                    focusNode: monthYearFocusNode, cvvFocusNode: cvvFocusNode),
              ),
              10.width,
              Expanded(child: InputCvvWidget(focusNode: cvvFocusNode)),
            ],
          ),
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
                'Save this card',
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
