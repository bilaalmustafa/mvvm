import 'package:mvvm/data/network/baseApiServices.dart';
import 'package:mvvm/data/network/networkApiServices.dart';
import 'package:mvvm/model/movie_model.dart';
import 'package:mvvm/res/app_url.dart';

class HomeRepository{
   Baseapiservices _apiservices = NetworkApiServices();

  Future<movie_model> fetchMoviesList() async {
    try {
      dynamic response = await _apiservices.getApiResponse(
        AppUrl.movieListEndPoint,
      );
      return response = movie_model.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}