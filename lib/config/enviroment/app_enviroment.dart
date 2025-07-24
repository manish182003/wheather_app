import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnviroment {
  static final String openWheatherApiKey =
      dotenv.env['OPENWHEATHER_API_KEY'] ?? '';
  static final String baseUrl = dotenv.env['BASE_URL'] ?? '';
}
