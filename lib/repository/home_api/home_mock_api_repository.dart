import 'package:big_cart/model/movie_list/movie_list_model.dart';
import 'package:big_cart/model/product/product_model.dart';

import 'home_repository.dart';

class HomeMockApiRepository implements HomeRepository {


  @override
  Future<MovieListModel> fetchMoviesList()async{
    dynamic response = {
      "total": "25369",
      "page": 1,
      "pages": 1269,
      "tv_shows": [
        {
          "id": 35624,
          "name": "The Flash",
          "permalink": "the-flash",
          "start_date": "2014-10-07",
          "end_date": null,
          "country": "US",
          "network": "The CW",
          "status": "Ended",
          "image_thumbnail_path": "https://static.episodate.com/images/tv-show/thumbnail/35624.jpg"
        }
      ]
    };
    return response = MovieListModel.fromJson(response);
  }



}