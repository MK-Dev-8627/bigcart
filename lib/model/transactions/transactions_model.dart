import 'package:flutter/material.dart';

class Transaction {
  int? id;
  String? cardName;
  String? timeDate;
  String? amount;
  String? currency;

  Transaction(
      {this.id, this.cardName, this.timeDate, this.amount, this.currency});

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cardName = json['cardName'];
    timeDate = json['timeDate'];
    amount = json['amount'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cardName'] = this.cardName;
    data['timeDate'] = this.timeDate;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    return data;
  }
}
