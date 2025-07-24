import 'package:get/get.dart';
import 'package:wheather_app/controllers/weather_controller.dart';

class AppDependency extends Bindings {
  @override
  void dependencies() {
    Get.put<WeatherController>(WeatherController());
  }
}
