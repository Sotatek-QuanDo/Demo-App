import 'package:demo_application/data/repositories/job_detail_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demo_application/data/models/job_detail.dart';

part 'job_state.dart';

class JobCubit extends Cubit<JobState> {
  JobCubit(int page) : super(JobLoading(page: 0)) {
    getJobDetail(page);
  }

  Future<void> getJobDetail(int page) async {
    emit(JobLoading(page: page));
    try {
      final listJobDetail = await JobDetailData().getJobDetail(page);
      emit(JobLoaded(listJobDetail));
    } catch (e) {
      rethrow;
    }
  }
}
