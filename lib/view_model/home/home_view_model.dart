import 'dart:async';

import 'package:big_cart/configs/constants/constants.dart';
import 'package:big_cart/model/product/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:big_cart/data/response/api_response.dart';
import 'package:big_cart/model/movie_list/movie_list_model.dart';
import 'package:flutter/material.dart';
import '../../repository/home_api/home_repository.dart';

class HomeViewModel with ChangeNotifier {

  HomeRepository  homeRepository ;
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

  setMoviesList(ApiResponse<MovieListModel> response){
    moviesList = response ;
    notifyListeners();
  }


  Future<void> fetchMoviesListApi ()async{

    setMoviesList(ApiResponse.loading());

    homeRepository.fetchMoviesList().then((value){
      print(value);
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }

  List<Product> productsList = [];

  setProductsList(List<Product> response){
    productsList = response ;
    notifyListeners();
  }

  setFavProduct(bool value,int index){
    productsList.elementAt(index).isFav = !value;
    notifyListeners();
  }

  Future<void> fetchProductsListApi ()async{
    setLoading(true);
    Timer(const Duration(seconds: 3), () {
      setProductsList(Constants.productsList);
      setLoading(false);
    });


  }
}