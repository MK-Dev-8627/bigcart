import 'package:big_cart/configs/assets/image_assets.dart';
import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/configs/constants/constants.dart';
import 'package:big_cart/configs/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/components/custom_appbar.dart';
import '../../view_model/shopping_cart/shopping_cart_view_model.dart';
import 'widgets/cart_product_list_widget.dart';
import 'widgets/checkout_button_widget.dart';

class ShoppingCartView extends StatefulWidget {
  const ShoppingCartView({super.key});

  @override
  State<ShoppingCartView> createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Schedule fetchFavProductsList to run after the build phase
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider =
      Provider.of<ShoppingCartViewModel>(context, listen: false);
      provider.fetchCartProductsList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Shopping Cart',
        autoImplyLeading: true,
      ),
      body: SafeArea(
        child: Consumer<ShoppingCartViewModel>(builder: (context, provider, _) {
          return provider.cartProductsList.isEmpty
              ? Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const ImageIcon(
                        AssetImage(ImageAssets.cart),
                        color: AppColors.primaryDarkColor,
                        size: 100,
                      ),
                      20.height,
                      Text(
                        'Your cart is empty !',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  ),
              )
              : Column(
                  children: [
                    20.height,
                    const Expanded(
                      child:  Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: CartProductListWidget(),
                      ),
                    ),
                    20.height,
                    buildCalculationContainer(context),
                  ],
                );
        }),
      ),
      // bottomNavigationBar: buildCalculationContainer(context)
    );
  }

  Widget buildCalculationContainer(BuildContext context) {
    return Consumer<ShoppingCartViewModel>(builder: (context, provider, _) {
      return Container(
        width: context.mediaQueryWidth,
        color: Theme.of(context).cardColor,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'SubTotal : ',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '\$ ${provider.subtotal}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            10.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shipping Charges : ',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '\$ ${Constants.shippingCharges}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            10.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discount : ',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '\$ ${provider.totalDiscount}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            20.height,
            Divider(
              height: 2,
              thickness: 2,
            ),
            20.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total : ',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  '\$ ${provider.totalAmount}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            20.height,
            CheckOutButtonWidget(),
            20.height,
          ],
        ),
      );
    });
  }
}
