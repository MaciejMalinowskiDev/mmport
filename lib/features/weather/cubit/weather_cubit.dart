import 'package:bloc/bloc.dart';
import 'package:mmport/app/core/enums.dart';
import 'package:mmport/domain/repositories/weather_repository.dart';
import 'package:mmport/domain/models/weather_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._weatherRepository) : super(const WeatherState());

  final WeatherRepository _weatherRepository;

  Future<void> getWeatherModel({
    required String city,
  }) async {
    emit(const WeatherState(status: Status.loading));
    try {
      final weatherModel = await _weatherRepository.getWeatherModel(city: city);
      emit(
        WeatherState(
          model: weatherModel,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        WeatherState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}