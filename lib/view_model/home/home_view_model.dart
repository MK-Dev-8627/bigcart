import 'dart:async';

import 'package:big_cart/configs/assets/image_assets.dart';
import 'package:big_cart/configs/constants/constants.dart';
import 'package:big_cart/model/product/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:big_cart/data/response/api_response.dart';
import 'package:big_cart/model/movie_list/movie_list_model.dart';
import 'package:flutter/material.dart';
import '../../model/reviews/review_model.dart';
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

  List<Product> _productsList = [];
  List<Product> get productsList => _productsList;

  setProductsList(List<Product> response) {
    _productsList = response;
    notifyListeners();
  }

  setFavProduct(bool value, int index) {
    print(
        'productsList: ${productsList.length} isFav : ${value}, index:  $index');
    // productsList.elementAt(index).isFav = !value;
    if (productsList.isNotEmpty) {
      productsList.elementAt(index).toggleFavorite();
      if (productsList[index].isFav == true) {
        _favProductsList.add(productsList[index]); // Add if favorite
        notifyListeners();
      } else {
        _favProductsList.remove(productsList[index]); // Remove if not favorite

        notifyListeners();
      }
    }

    notifyListeners();
  }

  setAddToCart(bool value, int index) {
    // productsList.elementAt(index).isAdded = !value;
    productsList.elementAt(index).toggleAdded();
    if (productsList[index].isAdded == true) {
      _cartProductsList.add(productsList[index]); // Add if cart
    } else {
      _cartProductsList.remove(productsList[index]); // Remove if not cart
    }
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
    } else if ((product.qty ?? 0) <= 1) {
      product.isAdded = false;
    }

    // Notify listeners about the change
    notifyListeners();

    print('Updated qty for product at index $index: ${product.qty}');
  }

  Future<void> fetchProductsListApi() async {
    setLoading(true);
    setProductsList(Constants.productsList);
    Future.delayed(const Duration(seconds: 3))
        .then((value) => setLoading(false));
    notifyListeners();
  }

  Product? _selectedProduct;

  // Getter for selectedProduct
  Product? get selectedProduct => _selectedProduct;

  // Setter for selectedProduct that notifies listeners
  setSelectedProduct(Product value) {
    _selectedProduct = value;
    notifyListeners();
    // Notify listeners about the change
  }

  String _productImage = '';
  String get productImage => _productImage;

  setProductImage(String productImage) {
    _productImage = productImage;
    print('_productImage:  $_productImage');
    notifyListeners();
  }

  List<Product> _favProductsList = [];
  List<Product> get favProductsList => _favProductsList;

  setFavProductsList(List<Product> value) {
    _favProductsList = value;
    print('_favProductsList:  $_favProductsList');
    notifyListeners();
  }

  Future<void> fetchFavProductsList() async {
    setLoading(true);
    _favProductsList = [];
    print("loading: $loading");
    print("productsList: $productsList");
    // _favProductsList = [];
    productsList.forEach((element) {
      print('element.isFav ${element.isFav}');
      if (element.isFav ?? false) {
        _favProductsList.add(element);
      }
    });
    Future.delayed(const Duration(seconds: 3))
        .then((value) => setLoading(false));

    print("loading: $loading");
    notifyListeners();
  }

  Future<void> removeFavProduct(int index) async {
    if (productsList.isNotEmpty) {
      final int productIndex = productsList.indexWhere(
          (element) => element.name == _favProductsList.elementAt(index).name);
      productsList.elementAt(productIndex).toggleFavorite();

      if (_favProductsList.isNotEmpty) {
        _favProductsList.removeAt(index); // Remove if not favorite
      }
    }
    notifyListeners();
  }

  List<Product> _cartProductsList = [];
  List<Product> get cartProductsList => _cartProductsList;

  setCartProductsList(List<Product> value) {
    _cartProductsList = value;
    print('_cartProductsList:  $_cartProductsList');
    notifyListeners();
  }

  List<Review> _reviewsList = [];
  List<Review> get reviewsList => _reviewsList;

  setReviewsList(List<Review> value) {
    _reviewsList = value;
    print('_reviewsList:  $_reviewsList');
    notifyListeners();
  }

  Future<void> fetchReviewsList() async {
    setLoading(true);
    _reviewsList = [];
_reviewsList = Constants.reviewsList;
    Future.delayed(const Duration(seconds: 3))
        .then((value) => setLoading(false));
    notifyListeners();
  }

  int _currentStars = 3;
  int get currentStars => _currentStars;

  setCurrentStars(int value) {
    _currentStars = value;
    notifyListeners();
  }

//creating getter method to store value of input review comment
  TextEditingController commentController = TextEditingController();
  String _comment = '';
  String get comment => _comment;

  setComment(String comment) {
    _comment = comment;
  }

  Future<void> addReview() async{
    final Review review = Review(
      id: '',
      name: 'MK Dev',
      userProfile: ImageAssets.mkDev,
      rating: currentStars.toDouble(),
      comment: commentController.text.trim(),
      createdAt: '10 min ago'
    );

    _reviewsList.add(review);
    commentController.clear();
    notifyListeners();
  }
}
