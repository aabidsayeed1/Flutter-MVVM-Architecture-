import 'package:flutter/material.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/model/movies_model.dart';
import 'package:mvvm/respository/home_repository.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<MoviesListModel> moviesList = ApiResponse.loading();
  setMovieslist(ApiResponse<MoviesListModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMovieslistApi() async {
    setMovieslist(ApiResponse.loading());
    _myRepo.moviesApi().then((value) {
      setMovieslist(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMovieslist(ApiResponse.error(error.toString()));
    });
  }
}
