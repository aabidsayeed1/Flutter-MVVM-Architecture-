import 'dart:async';

import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/model/movies_model.dart';
import 'package:mvvm/res/app_url.dart';

class HomeRepository {
  final BaseApiServices _baseApiServices = NetworkApiServices();

  Future<MoviesListModel> moviesApi() async {
    try {
      dynamic response =
          await _baseApiServices.getGetApiResponse(AppUrl.moviesListEndPoint);
      return response = MoviesListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
