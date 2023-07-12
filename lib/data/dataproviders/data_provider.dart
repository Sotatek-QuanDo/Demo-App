import 'package:dio/dio.dart';

class DataProvider {
  final Dio _dio = Dio();

  Future<Response> getRawData() async {
    try {
      print('======== GETTING FROM THE SERVER');
      final Response overallData =
          await _dio.get('https://sukibai-api.sotatek.works/api/jobs');
      print('============== SUCCESS');
      print('===============DAY LA STATUS CODE: $overallData.statusCode');
      return overallData;
    } on DioException {
      rethrow;
    }
  }
}
