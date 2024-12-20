import 'dart:async';

import 'package:big_cart/configs/constants/constants.dart';
import 'package:big_cart/data/network/network_api_services.dart';
import 'package:big_cart/model/movie_list/movie_list_model.dart';
import 'package:big_cart/configs/app_url.dart';
import 'package:big_cart/model/product/product_model.dart';

import 'home_repository.dart';

class HomeHttpApiRepository implements HomeRepository{

  final _apiServices = NetworkApiService() ;

  @override
  Future<MovieListModel> fetchMoviesList()async{
    dynamic response = await _apiServices.getGetApiResponse(AppUrl.popularMoviesListEndPoint);
    return response = MovieListModel.fromJson(response);
  }

}