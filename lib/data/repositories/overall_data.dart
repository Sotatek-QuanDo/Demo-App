import 'package:demo_application/data/dataproviders/data_provider.dart';
import 'package:dio/dio.dart';

class OverallData {
  final DataProvider _dataProvider = DataProvider();

  Future<Map<String, dynamic>> getOverallData(int page) async {
    try {
      final Response overallDataRaw = await _dataProvider.getRawData(page);
      final Map<String, dynamic> overallData = overallDataRaw.data;

      return overallData;
    } on DioException {
      rethrow;
    }
  }
}
