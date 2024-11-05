import 'package:flutter/material.dart';

import '../../configs/components/custom_appbar.dart';
import 'widgets/transactions_list_widget.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Transactions',
        autoImplyLeading: true,

      ),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TransactionsListWidget())),
    );
  }
}
