import 'package:dio/dio.dart';

class DataProvider {
  final Dio _dio = Dio();

  Future<Response> getRawData() async {
    try {
      final Response overallData =
          await _dio.get('https://sukibai-api.sotatek.works/api/jobs');
      return overallData;
    } on DioException {
      rethrow;
    }
  }
}
