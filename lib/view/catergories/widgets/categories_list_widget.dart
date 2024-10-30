import 'package:big_cart/configs/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../configs/color/color.dart';
import '../../../configs/constants/constants.dart';
import '../../../view_model/home/home_view_model.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, provider, _) {
      return Skeletonizer(
        enabled: provider.loading,
        child: GridView.builder(
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
              crossAxisSpacing: 10
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: Constants.categories.length,

            itemBuilder: (context, index) {
              final category =
              Constants.categories.elementAt(index);
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Expanded(
                          child: Image.asset(
                              category['image'] ?? "")),
                      5.height,
                      Text(
                        category['title'] ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall,
                      )
                    ],
                  ),
                ),
              );
            }),
      );});
  }
}