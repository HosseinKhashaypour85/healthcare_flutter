import 'package:dio/dio.dart';

class HomeApiServices {
  final Dio _dio = Dio();
  Future<Response>callHomeApi()async{
    final apiUrl = 'https://hosseinkhashaypour.chbk.app/api/collections/healthcare_api/records';
    final Response response = await _dio.get(apiUrl);
    return response;
  }
}