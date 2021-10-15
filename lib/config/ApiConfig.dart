import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  static final String BASE_URL = "https://app.cupidknot.com/api";
  static final String API_KEY = dotenv.env['APIKEY'] ?? "";
  static final String TEMP_TOKEN = dotenv.env['TEMP_TOKEN'] ?? "";
}
