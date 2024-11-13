import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/configs/extensions.dart';
import 'package:big_cart/model/address/address_model.dart';
import 'package:big_cart/view/address/widgets/add_address_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/assets/image_assets.dart';
import '../../configs/components/custom_appbar.dart';
import '../../view_model/shipping/shipping_view_model.dart';
import 'widgets/shipping_address_widget.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Add Address',
        autoImplyLeading: true,
      ),
      body: SafeArea(
        child: Consumer<ShippingViewModel>(builder: (context, provider, child) {
          return const InputMyAddressWidget();
        }),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(20),
        child: AddAddressButtonWidget(),
      ),
    );
  }
}
