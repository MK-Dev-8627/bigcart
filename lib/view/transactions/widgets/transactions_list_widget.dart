import 'package:big_cart/configs/assets/image_assets.dart';
import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/configs/components/product_card_widget.dart';
import 'package:big_cart/configs/constants/constants.dart';
import 'package:big_cart/view_model/transactions/transactions_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../model/transactions/transactions_model.dart';
import '../../../view_model/home/home_view_model.dart';

class TransactionsListWidget extends StatefulWidget {
  const TransactionsListWidget({super.key});

  @override
  State<TransactionsListWidget> createState() => _TransactionsListWidgetState();
}

class _TransactionsListWidgetState extends State<TransactionsListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Schedule fetchTransactionsList to run after the build phase
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider =
          Provider.of<TransactionsViewModel>(context, listen: false);
      provider.fetchTransactionsList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionsViewModel>(builder: (context, provider, _) {
      return Skeletonizer(
        enabled: provider.loading,
        child: ListView.builder(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: provider.transactionsList.length,
          itemBuilder: (context, index) {
            final transaction = provider.transactionsList[index];
            return transactionCardWidget(context, transaction, index);
          },
        ),
      );
    });
  }

  Widget transactionCardWidget(
      BuildContext context, Transaction transaction, int index) {
    final title = transaction.cardName ?? "";
    final subTitle = transaction.timeDate ?? "";
    final amount = transaction.amount ?? "";
    return Card(
      child: Container(
        // height: 150,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                shape: BoxShape.circle),
            child: Image.asset(
              title.toLowerCase().contains('paypal')
                  ? ImageAssets.paypal
                  : title.toLowerCase().contains('master')
                      ? ImageAssets.masterCard
                      : ImageAssets.visa,
              fit: BoxFit.contain,
              height: 50,
              width: 50,
            ),
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            subTitle,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          trailing: Text(
            '${Constants.currency} $amount',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.primaryDarkColor),
          ),
        ),
      ),
    );
  }
}
