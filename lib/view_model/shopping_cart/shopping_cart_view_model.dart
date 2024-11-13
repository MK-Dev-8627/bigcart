import 'dart:async';

import 'package:big_cart/main.dart';
import 'package:big_cart/model/product/product_model.dart';
import 'package:big_cart/repository/home_api/home_repository.dart';
import 'package:big_cart/view_model/home/home_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../configs/constants/constants.dart';

class ShoppingCartViewModel with ChangeNotifier {
  final HomeViewModel homeViewModel;

  ShoppingCartViewModel({required this.homeViewModel});

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<Product> get productsList => homeViewModel.productsList;

  void addProductQty(int index) {
    var product = cartProductsList.elementAt(index);

    // Initialize qty to 0 if it's null, then increment it
    product.qty = (product.qty ?? 0) + 1;
    calculateTotals();
    // Notify listeners about the change
    notifyListeners();

    // print('Updated qty for product at index $index: ${product.qty}');
  }

  void removeProductQty(int index) {
    var product = cartProductsList.elementAt(index);

    // Decrease qty if it's greater than 0
    if ((product.qty ?? 0) > 1) {
      product.qty = (product.qty ?? 0) - 1;
      calculateTotals();
    } else if ((product.qty ?? 0) <= 1) {
      product.isAdded = false;
      cartProductsList.removeAt(index);
      calculateTotals();
    }

    // Notify listeners about the change
    notifyListeners();

    print('Updated qty for product at index $index: ${product.qty}');
  }

  List<Product> _cartProductsList = [];
  List<Product> get cartProductsList => _cartProductsList;

  setCartProductsList(List<Product> value) {
    _cartProductsList = value;
    print('_cartProductsList:  $_cartProductsList');
    notifyListeners();
  }

  Future<void> fetchCartProductsList() async {
    setLoading(true);
    _cartProductsList = [];

    final homeCartProducts = homeViewModel.cartProductsList;
    productsList.forEach((element) {
      if (element.isAdded ?? false) {
        _cartProductsList.add(element);
        // print("${element.toJson()}");
      }
    });

    // Combine the existing _cartProductsList and homeCartProducts
    List<Product> combinedCartProducts = [
      ..._cartProductsList,
      ...homeCartProducts
    ];

    // Create a Set to keep track of unique products based on a unique attribute (e.g., id)
    final uniqueProductsSet = <String>{}; // assuming product.name is an String
    _cartProductsList = combinedCartProducts.where((product) {
      // Check if the product is already in the set
      final isUnique = uniqueProductsSet.add(
          product.name ?? ""); // Add returns false if id is already present
      return isUnique;
    }).toList();

    calculateTotals();
    Future.delayed(const Duration(seconds: 3))
        .then((value) => setLoading(false));

    notifyListeners();
  }

  void removeItemFromCart(int index){
    cartProductsList.removeAt(index);
    calculateTotals();
    notifyListeners();
  }

  double _subtotal = 0.0;
  double _totalDiscount = 0.0;
  double _totalAmount = 0.0;

  double get subtotal => Constants.roundToTwoDecimalPlaces(_subtotal);
  double get totalDiscount => Constants.roundToTwoDecimalPlaces(_totalDiscount);
  double get totalAmount => Constants.roundToTwoDecimalPlaces(_totalAmount);

  void calculateTotals() {
    _subtotal = 0.0;
    _totalDiscount = 0.0; // To store cumulative discount

    // Calculate subtotal
    for (Product product in _cartProductsList) {
      try {
        double price = double.tryParse(product.price ?? '0') ?? 0.0;
        int quantity = product.qty ?? 1;

        // Calculate the cost for this product
        double productTotal = price * quantity;
        _subtotal += productTotal;

        // Calculate discount for this product
        double productDiscount = (product.discount ?? 0.0) * productTotal;
        _totalDiscount += Constants.roundToTwoDecimalPlaces(productDiscount);

        print(
            'Product: ${product.name}, qty: $quantity, price: $price, discount: ${product.discount}, productTotal: $productTotal');
      } catch (e) {
        print(e);
      }
    }

    // Calculate total with any additional fees (e.g., tax or discount)
    double charges = Constants.shippingCharges; // Example: 10% tax
    if (_subtotal > 0.0) {
      _totalAmount = _subtotal + charges - _totalDiscount;
    } else {
      _totalAmount = 0.0;
    }
    print(
        '_subtotal:  $_subtotal, _totalDiscount:  $_totalDiscount, _totalAmount: $_totalAmount');
    notifyListeners();
  }


  int _activeStep = 0;
  double _progress = 0.0;

  int get activeStep => _activeStep;
  double get progress => _progress;

  void setActiveStep(int value){
    _activeStep = value;
    notifyListeners();
  }
  void setProgress(double value){
    _progress = value;
    notifyListeners();
  }

  List<Map<String, dynamic>> deliveryList =[
    {"title":"Standard Delivery","subTitle":"Order will be delivered between 3 - 4 business days straights to your doorstep.","amount":"3"},
    {"title":"Next Day Delivery","subTitle":"Order will be delivered between 3 - 4 business days straights to your doorstep.","amount":"3"},
    {"title":"Nominated Delivery","subTitle":"Order will be delivered between 3 - 4 business days straights to your doorstep.","amount":"3"},
  ];
}
