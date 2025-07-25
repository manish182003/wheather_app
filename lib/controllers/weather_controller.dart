import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:wheather_app/models/forecast_model.dart';
import 'package:wheather_app/models/latlng.dart';
import 'package:wheather_app/models/wheather_model.dart';
import 'package:wheather_app/services/wheather_service.dart';

class WeatherController extends GetxController {
  final WheatherService _wheatherService = WheatherService();

  var weather = Rxn<WheatherModel>();
  var forecast = Rxn<ForecastModel>();
  RxBool isloading = false.obs;
  RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchWeather();
    forecastWeather();
  }

  Future<void> fetchWeather() async {
    isloading.value = true;
    error.value = '';
    try {
      Logger().i("checking permission");
      var permission = await Geolocator.checkPermission();

      Logger().i("permission->${permission.name}");

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        Logger().i("permission->${permission.name}");
      }

      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        //get current location
        var currentloc = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
        );
        //get current location weather
        var result = await _wheatherService.getCurrentWheather(
          Latlng(lat: currentloc.latitude, lng: currentloc.longitude),
        );

        if (result != null) {
          weather.value = result;
        } else {
          error.value = 'Failed To Fetch Weather Data';
        }
      }
    } catch (err) {
      error.value = err.toString();
    } finally {
      isloading.value = false;
    }
  }

  //forecast weather

  Future<void> forecastWeather() async {
    isloading.value = true;
    error.value = '';
    try {
      Logger().i("checking permission");
      var permission = await Geolocator.checkPermission();

      Logger().i("permission->${permission.name}");

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        Logger().i("permission->${permission.name}");
      }

      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        //get current location
        var currentloc = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
        );
        //get forecast  weather data for next 5 days
        var result = await _wheatherService.getWeatherForecast(
          Latlng(lat: currentloc.latitude, lng: currentloc.longitude),
        );

        if (result != null) {
          forecast.value = result;
        } else {
          error.value = 'Failed To Fetch Weather Forecast Data';
        }
      }
    } catch (err) {
      error.value = err.toString();
    } finally {
      isloading.value = false;
    }
  }

  Future<void> searchCityName(String cityName) async {
    isloading.value = true;
    error.value = '';
    try {
      var result = await _wheatherService.getCoordinatesFromCity(cityName);

      if (result != null) {
        final currentWeatherData = await _wheatherService.getCurrentWheather(
          result,
        );
        final forecastData = await _wheatherService.getWeatherForecast(result);

        if (currentWeatherData != null) {
          weather.value = currentWeatherData;
        }
        if (forecastData != null) {
          forecast.value = forecastData;
        }
      }
    } catch (err) {
      error.value = err.toString();
    } finally {
      isloading.value = false;
    }
  }
}
