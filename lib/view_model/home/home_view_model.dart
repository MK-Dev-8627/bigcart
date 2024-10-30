import 'dart:async';

import 'package:big_cart/configs/constants/constants.dart';
import 'package:big_cart/model/product/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:big_cart/data/response/api_response.dart';
import 'package:big_cart/model/movie_list/movie_list_model.dart';
import 'package:flutter/material.dart';
import '../../repository/home_api/home_repository.dart';

class HomeViewModel with ChangeNotifier {
  HomeRepository homeRepository;
  HomeViewModel({required this.homeRepository});



  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  //creating getter method to store value of input email
  TextEditingController searchController = TextEditingController();
  String _search = '';
  String get search => _search;

  setSearch(String search) {
    _search = search;
  }

  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MovieListModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading());

    homeRepository.fetchMoviesList().then((value) {
      print(value);
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }

  List<Product> productsList = [];

  setProductsList(List<Product> response) {
    productsList = response;
    notifyListeners();
  }

  setFavProduct(bool value, int index) {
    print('productsList: ${productsList.length} isFav : ${value}, index:  $index');
    // productsList.elementAt(index).isFav = !value;
    productsList.elementAt(index).toggleFavorite();
    notifyListeners();
  }

  setAddToCart(bool value, int index) {
    // productsList.elementAt(index).isAdded = !value;
    productsList.elementAt(index).toggleAdded();
    notifyListeners();
  }
  void addProductQty(int index) {
    var product = productsList.elementAt(index);

    // Initialize qty to 0 if it's null, then increment it
    product.qty = (product.qty ?? 0) + 1;

    // Notify listeners about the change
    notifyListeners();

    print('Updated qty for product at index $index: ${product.qty}');
  }

  void removeProductQty(int index) {
    var product = productsList.elementAt(index);

    // Decrease qty if it's greater than 0
    if ((product.qty ?? 0) > 1) {
      product.qty = (product.qty ?? 0) - 1;
    } else if((product.qty ?? 0) <= 1) {
      product.isAdded = false;
    }

    // Notify listeners about the change
    notifyListeners();

    print('Updated qty for product at index $index: ${product.qty}');
  }
  Future<void> fetchProductsListApi() async {
    setLoading(true);
    print("loading: $loading");
    Timer(const Duration(seconds: 0), () {
      setProductsList(Constants.productsList);
      setLoading(false);
      print("loading: $loading");
    });
    notifyListeners();
  }

  Product? _selectedProduct;

  // Getter for selectedProduct
  Product? get selectedProduct => _selectedProduct;

  // Setter for selectedProduct that notifies listeners
   setSelectedProduct(Product value) {
    _selectedProduct = value;
    notifyListeners();
    print('setSelectedProduct');
    print(_selectedProduct!.toJson());
     // Notify listeners about the change
  }
  String _productImage= '';
  String get productImage => _productImage;

  setProductImage(String productImage) {
    _productImage = productImage;
    print('_productImage:  $_productImage');
    notifyListeners();
  }



}
