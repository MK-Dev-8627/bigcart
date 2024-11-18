import 'package:big_cart/configs/assets/image_assets.dart';
import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/configs/components/product_card_widget.dart';
import 'package:big_cart/configs/constants/constants.dart';
import 'package:big_cart/configs/extensions.dart';
import 'package:big_cart/view/reviews/widgets/stars_widget.dart';
import 'package:big_cart/view_model/transactions/transactions_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../model/reviews/review_model.dart';
import '../../../model/transactions/transactions_model.dart';
import '../../../view_model/home/home_view_model.dart';

class ReviewsListWidget extends StatefulWidget {
  const ReviewsListWidget({super.key});

  @override
  State<ReviewsListWidget> createState() => _ReviewsListWidgetState();
}

class _ReviewsListWidgetState extends State<ReviewsListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Schedule fetchTransactionsList to run after the build phase
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider =
          Provider.of<HomeViewModel>(context, listen: false);
      provider.fetchReviewsList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, provider, _) {
      return Skeletonizer(
        enabled: provider.loading,
        child: ListView.builder(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: provider.reviewsList.length,
          itemBuilder: (context, index) {
            final review = provider.reviewsList[index];
            return reviewsCardWidget(context, review, index);
          },
        ),
      );
    });
  }

  Widget reviewsCardWidget(
      BuildContext context, Review review, int index) {
    final image = review.userProfile ?? "";
    final name = review.name ?? "";
    final createdAt = review.createdAt ?? "";
    final rating = review.rating ?? 0.0;
    final comment = review.comment ?? "";
    return Card(
      child: Container(
        // height: 150,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage( image),fit: BoxFit.contain,
                    )
                ),
              ),
              title: Text(
                name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                createdAt,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '$rating',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      10.width,
                      StarsWidget(stars: rating.toInt()),
                    ],
                  ),
                  Text(
                    comment,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
