import 'package:flutter/foundation.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/model/movie_model.dart';
import 'package:mvvm/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();
  ApiResponse<movie_model> movieList = ApiResponse.loading();
  setMovieList(ApiResponse<movie_model> movieReponse) {
    movieList = movieReponse;
    notifyListeners();
  }

  Future<void> fetchMovieListApi() async {
    setMovieList(ApiResponse.loading(  ));
    _myRepo.fetchMoviesList().then((value) {
        setMovieList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
        setMovieList(ApiResponse.error(error.toString()));
    });
  }
}
