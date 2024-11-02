import 'package:big_cart/configs/assets/image_assets.dart';
import 'package:big_cart/configs/extensions.dart';
import 'package:big_cart/configs/routes/routes_name.dart';
import 'package:big_cart/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../configs/color/color.dart';
import '../../../configs/components/loading_widget.dart';
import '../../../configs/components/product_card_widget.dart';
import '../../../configs/constants/constants.dart';
import '../../../data/response/status.dart';
import '../../../model/product/product_model.dart';
import '../../../view_model/home/home_view_model.dart';
import 'error_widgets.dart';

class ProductListWidget extends StatefulWidget {
  const ProductListWidget({super.key});

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Schedule fetchFavProductsList to run after the build phase
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<HomeViewModel>(context, listen: false);
      provider.fetchProductsListApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        // ChangeNotifierProvider<HomeViewModel>(
        // create: (BuildContext context) =>
        //     HomeViewModel(homeRepository: getIt())..fetchProductsListApi(),
        // child:

        Consumer<HomeViewModel>(builder: (context, provider, _) {
      print('HomeScreen:   ${provider.productsList}');
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Features Products',
                  style: Theme.of(context).textTheme.titleLarge),
              InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RoutesName.featuresProducts, (route) => true);
                  },
                  child: const Icon(Icons.arrow_forward_ios))
            ],
          ),
          10.height,
          Skeletonizer(
            enabled: provider.loading,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: provider.productsList.length,
              itemBuilder: (context, index) {
                final product = provider.productsList[index];
                return ProductCard(
                  product: product,
                  provider: provider,
                  index: index,
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      );
    });
    // );
  }
}


