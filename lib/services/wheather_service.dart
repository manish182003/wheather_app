import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:wheather_app/config/enviroment/app_enviroment.dart';

import 'package:wheather_app/models/latlng.dart';
import 'package:wheather_app/models/wheather_model.dart';
import 'package:http/http.dart' as http;

class WheatherService {
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
}
