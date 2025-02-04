import 'package:mmport/data/weather_remote_data_source.dart';
import 'package:mmport/domain/models/weather_model.dart';

class WeatherRepository {
  WeatherRepository(this._weatherRemoteDataSource);

  final WeatherRemoteDataSource _weatherRemoteDataSource;

  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    final responseData = await _weatherRemoteDataSource.getWeatherData(
      city: city); 
   
    if(responseData == null){
      return null;
    }

    return WeatherModel.fromJson(responseData);
  }
}
