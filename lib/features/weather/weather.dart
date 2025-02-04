import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmport/app/core/enums.dart';
import 'package:mmport/data/weather_remote_data_source.dart';
import 'package:mmport/domain/models/weather_model.dart';
import 'package:mmport/domain/repositories/weather_repository.dart';
import 'package:mmport/features/weather/cubit/weather_cubit.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(
        WeatherRepository(WeatherRemoteDataSource()),
      ),
        child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Unkown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
          builder: (context, state) {
            final weatherModel = state.model;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Weather App'),
              ),
              body: Center(
                child: Builder(builder: (context) {
                  if (state.status == Status.loading) {
                    return const Text('Loading');
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (weatherModel != null)
                        _DisplayWeatherWidget(
                          weatherModel: weatherModel,
                        ),
                      _SearchWidget(),
                    ],
                  );
                }),
              ),
            );
          },
        ),
      );
  }
}

class _DisplayWeatherWidget extends StatelessWidget {
  const _DisplayWeatherWidget({
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(
              weatherModel.temperature.toString(),
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const Text('°C'),
            const SizedBox(height: 60),
            Text(
              weatherModel.city,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 60),
          ],
        );
      },
    );
  }
}

class _SearchWidget extends StatelessWidget {
  _SearchWidget();

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('City'),
                hintText: 'Enter any city',
              ),
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              context.read<WeatherCubit>().getWeatherModel(city: _controller.text);
              const Text('dsd');
            },
            child: const Text('Get'),
          ),
        ],
      ),
    );
  }
}