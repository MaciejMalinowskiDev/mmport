import 'package:dio/dio.dart';


class WeatherRemoteDataSource {
  Future<Map<String, dynamic>?> getWeatherData({
    required String city,
  }) async {
    try {final Response = await Dio().get<Map<String, dynamic>>(
      'http://api.weatherapi.com/v1/current.json?key=e73f6a0b6d5941be83b50709242102&q=$city&aqi=no)');
    return  Response.data; 
    } on DioError catch (error) {
      throw Exception(
        error.response?.data['error']['message'] ?? 'Unknown error');
    }
  }
}