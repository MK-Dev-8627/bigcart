import 'package:big_cart/configs/assets/image_assets.dart';
import 'package:big_cart/configs/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../configs/color/color.dart';
import '../../../configs/constants/constants.dart';
import '../../../configs/routes/routes_name.dart';
import '../../../model/product/product_model.dart';
import '../../../view_model/home/home_view_model.dart';
import '../../../view_model/shopping_cart/shopping_cart_view_model.dart';

class CartProductListWidget extends StatelessWidget {
  const CartProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingCartViewModel>(builder: (context, provider, _) {
      return Skeletonizer(
        enabled: provider.loading,
        child: ListView.builder(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: provider.cartProductsList.length,
          itemBuilder: (context, index) {
            final product = provider.cartProductsList[index];
            return buildProductCard(context, product, provider, index);
          },
        ),
      );
    });
  }

  Widget buildProductCard(BuildContext context, Product product,
      ShoppingCartViewModel provider, int index) {
    return Slidable(
      endActionPane: Utils.deleteSlidableAction(
          onDeletePressed: (context) => provider.removeItemFromCart(index)),
      child: GestureDetector(
        onTap: ()=>Navigator.pushNamed(
          context,
          RoutesName.productDetails,
          arguments: {'product': product, 'index': index},
        ),
        child: Card(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    leading: Hero(
                      tag: '${product.name}',
                      child: Image.asset(
                        '${product.image}',
                        height: 80,
                        width: 80,
                        fit: BoxFit.contain,
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${Constants.currency} ${product.price} x ${product.qty}",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: AppColors.primaryDarkColor),
                        ),
                        Text(
                          '${product.name}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    subtitle: Text(
                      '${product.unit}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                _buildCartControls(context, product, provider, index),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCartControls(BuildContext context, Product product,
      ShoppingCartViewModel provider, int index) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => provider.removeProductQty(index),
            icon: const ImageIcon(AssetImage(ImageAssets.minus),
                size: 15, color: AppColors.primaryDarkColor),
          ),
          Text('${product.qty}', style: Theme.of(context).textTheme.titleSmall),
          IconButton(
            onPressed: () => provider.addProductQty(index),
            icon: const ImageIcon(AssetImage(ImageAssets.plus),
                size: 15, color: AppColors.primaryDarkColor),
          ),
        ],
      ),
    );
  }
}
