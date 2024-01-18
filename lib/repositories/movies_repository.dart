import 'package:mvvmarc/data/network/BaseApiServices.dart';
import 'package:mvvmarc/data/network/NetworkApiServices.dart';
import 'package:mvvmarc/model/movies_list_model.dart';
import 'package:mvvmarc/res/components/app_url.dart';
import 'package:mvvmarc/view_model/movies_view_model.dart';

class MoviesRepository {
  BaseApiServices _baseApiServices = NetworkApiServices();
  Future<MovieListModel> getAllMovies() async {
    try{
      dynamic response = await _baseApiServices.getApiResponse(AppUrl.moviesListEndPoint);
      return response = MovieListModel.fromJson(response);
    }
    catch(e) {
      throw e.toString();
    }
  }
}