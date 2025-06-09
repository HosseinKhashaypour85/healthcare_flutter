import 'package:dio/dio.dart';

import 'auth_api_services.dart';

class AuthApiRepository {
  final AuthApiServices _apiServices = AuthApiServices();

  // sign in future
  Future<Response> callSignInAuthApi(String identity, String password) async {
    return await _apiServices.callSignInApi(identity, password);
  }

//   sign up future
  Future<Response> callSignUpApi(String password, String passwordConfirm , String phoneNum , String userName , ) async {
    return await _apiServices.callSignUpApi(password, passwordConfirm , phoneNum , userName);
  }
}