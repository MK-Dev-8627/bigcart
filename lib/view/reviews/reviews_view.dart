import 'package:big_cart/view/reviews/widgets/reviews_list_widget.dart';
import 'package:flutter/material.dart';

import '../../configs/assets/image_assets.dart';
import '../../configs/components/custom_appbar.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: CustomAppBar(
        title: 'Reviews',
        autoImplyLeading: true,
        actionWidgets: [
          IconButton(
              onPressed: () {
                // Navigator.pushNamedAndRemoveUntil(context, RoutesName.addAddressView, (route) => true);
              },
              icon: const ImageIcon(AssetImage(ImageAssets.add ?? ""))),
        ],
      ),
      body: const SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ReviewsListWidget())),
    );
  }
}
