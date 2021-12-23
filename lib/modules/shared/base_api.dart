import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BaseApi {
  static var dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env["API_URL"]!,
    ),
  );

  Dio get api => BaseApi.dio;
}
