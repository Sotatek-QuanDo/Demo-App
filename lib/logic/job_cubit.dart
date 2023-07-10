import 'package:demo_application/data/repositories/job_detail_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demo_application/data/models/job_detail.dart';

part 'job_state.dart';

class JobCubit extends Cubit<JobState> {
  JobCubit() : super(JobLoading()) {
    getJobDetail();
  }

  Future<void> getJobDetail() async {
    try {
      final listJobDetail = await JobDetailData().getJobDetail();
      emit(JobLoaded(listJobDetail));
    } catch (e) {
      rethrow;
    }
  }
}
