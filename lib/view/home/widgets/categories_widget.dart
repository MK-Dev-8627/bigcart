import 'package:big_cart/configs/extensions.dart';
import 'package:big_cart/configs/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../configs/color/color.dart';
import '../../../configs/constants/constants.dart';
import '../../../view_model/home/home_view_model.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, provider, _) {
      return SizedBox(
        height: 120,
        width: context.mediaQueryWidth,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, RoutesName.categories, (route) => true);
                    },
                    child: const Icon(Icons.arrow_forward_ios))
              ],
            ),
            10.height,
            SizedBox(
              height: 80,
              width: context.mediaQueryWidth,
              child: Skeletonizer(
                enabled: provider.loading,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Constants.categories.length,
                    itemBuilder: (context, index) {
                      final category = Constants.categories.elementAt(index);
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              RoutesName.categoriesProducts,
                              arguments: {'category': category['title']},
                              (route) => true);
                        },
                        child: Hero(
                          tag: '${category['image']}',
                          child: Container(
                            height: 60,
                            // width: 80,
                            // color: Colors.lightGreen
                            //     .withOpacity(double.parse('0.${index}')),
                            margin: const EdgeInsets.only(right: 10),
                            // padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Expanded(
                                    child:
                                        Image.asset(category['image'] ?? "")),
                                5.height,
                                Text(
                                  category['title'] ?? "",
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      );
    });
  }
}
