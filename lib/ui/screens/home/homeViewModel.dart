import 'package:flutter/cupertino.dart';

import '../../../data/utils/api_response.dart';

class HomeViewViewModel with ChangeNotifier {

  ApiResponse<List<String>> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<List<String>> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading());

    Future.delayed(const Duration(seconds: 5));
    setMoviesList(ApiResponse.completed(["Abc", "Bcd", "Efg"]));
  }
}
