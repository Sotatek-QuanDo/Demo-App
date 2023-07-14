import 'package:demo_application/data/models/job_detail.dart';
import 'package:demo_application/data/repositories/overall_data.dart';

class JobDetailData {
  Future<List<JobDetail>> getJobDetail(int page) async {
    try {
      final overallData = await OverallData().getOverallData(page);

      List<dynamic> tmp = overallData['data']['data'] as List<dynamic>;

      return tmp.map((dataDetail) {
        return JobDetail.fromJson(dataDetail);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }
}
