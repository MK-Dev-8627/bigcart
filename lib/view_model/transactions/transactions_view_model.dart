import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../configs/constants/constants.dart';
import '../../model/transactions/transactions_model.dart';

class TransactionsViewModel with ChangeNotifier {

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  

  List<Transaction> _transactionsList = [];
  List<Transaction> get transactionsList => _transactionsList;

  setTransactionsList(List<Transaction> value) {
    _transactionsList = value;
    print('_transactionsList:  $_transactionsList');
    notifyListeners();
  }

  Future<void> fetchTransactionsList() async {
    setLoading(true);
    _transactionsList = Constants.transactionsList;
        Future.delayed(const Duration(seconds: 2))
        .then((value) => setLoading(false));

    notifyListeners();
  }


}
