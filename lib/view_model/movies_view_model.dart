import 'package:flutter/cupertino.dart';
import 'package:mvvmarc/data/response/api_response.dart';
import 'package:mvvmarc/model/movies_list_model.dart';
import 'package:mvvmarc/repositories/movies_repository.dart';

class MoviesViewModel  with ChangeNotifier {
  final _myRepo = MoviesRepository();
  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MovieListModel> response) {
    moviesList = response;
    notifyListeners();

  }

   Future<void> fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading());
     _myRepo.getAllMovies().then((value) {
      setMoviesList(ApiResponse.completed(value));
     }).onError((error, stackTrace) {
       setMoviesList(ApiResponse.error(error.toString()));
       print(error.toString());
     });
}
}