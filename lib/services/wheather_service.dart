import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:wheather_app/config/enviroment/app_enviroment.dart';
import 'package:wheather_app/models/forecast_model.dart';

import 'package:wheather_app/models/latlng.dart';
import 'package:wheather_app/models/wheather_model.dart';
import 'package:http/http.dart' as http;

class WheatherService {
  //curent weather
  Future<WheatherModel?> getCurrentWheather(Latlng? currentLoc) async {
    try {
      Logger().i(
        "request body-> Location(${currentLoc?.lat},${currentLoc?.lng})",
      );
      final response = await http.get(
        Uri.parse(
          '${AppEnviroment.baseUrl}/weather?lat=${currentLoc?.lat}&lon=${currentLoc?.lng}&appid=${AppEnviroment.openWheatherApiKey}&units=metric',
        ),
      );

      Logger().i("Response Body-> ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final whetherData = WheatherModel.fromMap(data as Map<String, dynamic>);
        return whetherData;
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }

  Future<ForecastModel?> getWeatherForecast(
    Latlng? currentLoc, [
    int days = 40,
  ]) async {
    try {
      Logger().i(
        "forecast request body-> Location(${currentLoc?.lat},${currentLoc?.lng})",
      );
      final response = await http.get(
        Uri.parse(
          '${AppEnviroment.baseUrl}/forecast?lat=${currentLoc?.lat}&lon=${currentLoc?.lng}&appid=${AppEnviroment.openWheatherApiKey}&units=metric&cnt=$days',
        ),
      );

      Logger().i("Forecast Response Body-> ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final forecastData = ForecastModel.fromJson(
          data as Map<String, dynamic>,
        );
        return forecastData;
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }

  Future<Latlng?> getCoordinatesFromCity(String cityName) async {
    try {
      Logger().i("search request body-> $cityName)");
      final response = await http.get(
        Uri.parse(
          'http://api.openweathermap.org/geo/1.0/direct?q=$cityName&limit=1&appid=${AppEnviroment.openWheatherApiKey}',
        ),
      );

      Logger().i("search response body-> ${response.body})");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data is List && data.isNotEmpty) {
          final lat = data[0]['lat'] as double;
          final lon = data[0]['lon'] as double;
          return Latlng(lat: lat, lng: lon);
        }
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
