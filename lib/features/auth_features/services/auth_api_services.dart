import 'package:dio/dio.dart';

import '../../public_features/functions/id_generator/id_generator.dart';

class AuthApiServices {
  final Dio _dio = Dio();

  // sign in
  Future<Response> callSignInApi(String identity, String password) async {
    final apiUrl =
        'https://hosseinkhashaypour.chbk.app/api/collections/users/auth-with-password';
    final Response response = await _dio.post(
      apiUrl,
      data: {'identity': identity, 'password': password},
    );
    return response;
  }

  //   sign up api
  Future<Response> callSignUpApi(String name,String phoneNum , String password , String passwordConfirm) async {
    final apiUrl =
        'https://hosseinkhashaypour.chbk.app/api/collections/users/records';
    final String generateId = IdGenerator().idGenerator();
    final Response response = await _dio.post(apiUrl, data: {
      'id' : generateId,
      'name' : name,
      'userName' : phoneNum,
      'password' : password,
      'passwordConfirm' : passwordConfirm,
    });
    return response;
  }
}
