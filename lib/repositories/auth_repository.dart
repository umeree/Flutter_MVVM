import 'package:mvvmarc/data/network/BaseApiServices.dart';
import 'package:mvvmarc/data/network/NetworkApiServices.dart';
import 'package:mvvmarc/res/components/app_url.dart';

class AuthRepository {
BaseApiServices _baseApiServices = NetworkApiServices();

    //Login Api
    Future<dynamic> loginAPi(dynamic data) async {
      try{
        dynamic response = await _baseApiServices.postApiResponse(AppUrl.loginEndPoint, data);
        return response;
      }
      catch(e) {
        throw e.toString();
      }
    }
    //Register Api
    Future<dynamic> registerApi(dynamic data) async {
      try {
        dynamic response = _baseApiServices.postApiResponse(AppUrl.registerEndPoint, data);
        return response;
      }
      catch(e) {
        throw e.toString();
      }
    }
}