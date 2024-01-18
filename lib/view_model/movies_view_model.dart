import 'package:flutter/cupertino.dart';
import 'package:mvvmarc/repositories/movies_repository.dart';

class MoviesViewModel  with ChangeNotifier {
  final _myRepo = MoviesRepository();
   Future<void> fetchMoviesListApi() async {
     _myRepo.getAllMovies().then((value) {

     }).onError((error, stackTrace) {
       print(error.toString());
     });
}
}