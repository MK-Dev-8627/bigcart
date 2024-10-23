import 'package:big_cart/configs/extensions.dart';
import 'package:flutter/material.dart';

import '../../../configs/color/color.dart';
import '../../../configs/constants/constants.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: AppColors.blackColor),
              ),
              InkWell(
                  onTap: () {},
                  child: const Icon(Icons.arrow_forward_ios))
            ],
          ),
          10.height,
          SizedBox(
            height: 100,
            width: context.mediaQueryWidth,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Constants.categories.length,
                itemBuilder: (context, index) {
                  final category =
                  Constants.categories.elementAt(index);
                  return Container(
                    height: 100,
                    // width: 80,
                    // color: Colors.lightGreen
                    //     .withOpacity(double.parse('0.${index}')),
                    margin: const EdgeInsets.only(right: 10),
                    // padding: const EdgeInsets.all(10),
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
                              .bodyMedium,
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}