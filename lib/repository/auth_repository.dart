import 'package:mvvm/data/network/baseApiServices.dart';
import 'package:mvvm/data/network/networkApiServices.dart';
import 'package:mvvm/res/app_url.dart';

class AuthRepository {
  Baseapiservices _apiservices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiservices.posttApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

   Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
          await _apiservices.posttApiResponse(AppUrl.registerApiEndpoint , data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
