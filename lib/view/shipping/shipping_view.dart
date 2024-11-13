import 'package:big_cart/configs/assets/image_assets.dart';
import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/configs/constants/constants.dart';
import 'package:big_cart/configs/extensions.dart';
import 'package:big_cart/view/shipping/widgets/address_next_button_widget.dart';
import 'package:big_cart/view/shipping/widgets/make_payment_button_widget.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

import '../../configs/components/custom_appbar.dart';
import '../../view_model/shopping_cart/shopping_cart_view_model.dart';
import 'widgets/delivery_next_button_widget.dart';
import 'widgets/payment_method_widget.dart';
import 'widgets/shipping_address_widget.dart';

class ShippingView extends StatelessWidget {
  const ShippingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Shipping',
        autoImplyLeading: true,
      ),
      body: SafeArea(
        child: Consumer<ShoppingCartViewModel>(
            builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  EasyStepper(
                    activeStep: provider.activeStep,
                    showLoadingAnimation: false,
                    lineStyle: LineStyle(
                      lineLength: 50,
                      lineThickness: 6,
                      lineSpace: 4,
                      lineType: LineType.normal,
                      defaultLineColor: AppColors.primaryColor,
                      progress: provider.progress,
                      progressColor: AppColors.primaryDarkColor,
                    ),
                    borderThickness: 10,
                    internalPadding: 15,
                    // activeStepBackgroundColor: AppColors.primaryColor,
                    activeStepIconColor: AppColors.primaryDarkColor,
                    activeStepBorderColor: AppColors.primaryDarkColor,
                    activeStepTextColor: AppColors.primaryDarkColor,
                    finishedStepBackgroundColor: AppColors.primaryDarkColor,
                    finishedStepTextColor: AppColors.primaryDarkColor,
                    // loadingAnimation: 'assets/loading_circle.json',
                    steps: const [
                      EasyStep(
                        icon: Icon(CupertinoIcons.cart),
                        title: 'Delivery',
                      ),
                      EasyStep(
                        icon: Icon(CupertinoIcons.location_solid),
                        title: 'Address',
                      ),
                      EasyStep(
                        icon: Icon(Icons.wallet),
                        title: 'Payment',
                      ),
                    ],
                    onStepReached: (index) => provider.setActiveStep(index),
                  ),
                  provider.activeStep == 0
                      ? buildDeliveryWidget()
                      : provider.activeStep == 1
                          ? const ShippingAddressWidget()
                          : provider.activeStep == 2
                              ? const PaymentMethodWidget()
                              : const SizedBox.shrink()
                ],
              ),
            ),
          );
        }),
      ),
      bottomNavigationBar:
          Consumer<ShoppingCartViewModel>(builder: (context, provider, child) {
        return Padding(
            padding: const EdgeInsets.all(20),
            child: provider.activeStep == 0
                ? const DeliveryNextButtonWidget()
                : provider.activeStep == 1
                    ? const ShippingAddressNextButtonWidget()
                    : provider.activeStep == 2
                        ? const MakePaymentButtonWidget()
                        : const SizedBox.shrink());
      }),
    );
  }

  Widget buildDeliveryWidget() {
    return Consumer<ShoppingCartViewModel>(builder: (context, provider, child) {
      return ListView.builder(
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: provider.deliveryList.length,
        itemBuilder: (context, index) {
          final delivery = provider.deliveryList[index];
          return Card(
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  delivery['title'],
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: Text(
                  delivery['subTitle'],
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                trailing: Text(
                  "${Constants.currency} ${delivery['amount']}",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.primaryDarkColor),
                ),
              ),
            ),
          );
        },
      );
    });
  }

  Widget buildAddressWidget() {
    return const Column(
      children: [
        // InputEmailWidget(),
      ],
    );
  }

  Widget buildPaymentWidget() {
    return const Center(
      child: Text('Payment'),
    );
  }
}
