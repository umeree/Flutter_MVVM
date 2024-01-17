import 'dart:convert';
import 'dart:io';

import 'package:mvvmarc/data/app_exceptions.dart';
import 'package:mvvmarc/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApiResponse(String url) async {
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future postApiResponse(String url, data) async {
    dynamic responseJson;
    try{
      final response = await http.post(
          Uri.parse(url),
          body: data
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
       switch(response.statusCode){
         case 200:
           dynamic responseJson = jsonDecode(response.body);
           return responseJson;
         case 400:
           throw BadRequestException(response.statusCode.toString());
         case 404:
           throw UnauthorizedException(response.statusCode.toString());
         default:
           throw FetchDataException("Error occurred while communication with server with status code ${response.statusCode}");
       }
  } 
}