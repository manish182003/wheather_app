import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:wheather_app/models/latlng.dart';
import 'package:wheather_app/models/wheather_model.dart';
import 'package:wheather_app/services/wheather_service.dart';

class WeatherController extends GetxController {
  final WheatherService _wheatherService = WheatherService();

  var weather = Rxn<WheatherModel>();
  RxBool isloading = false.obs;
  RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchWeather();
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
}
