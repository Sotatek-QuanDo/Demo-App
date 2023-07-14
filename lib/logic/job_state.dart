part of 'job_cubit.dart';

abstract class JobState {}

class JobInitial extends JobState {}

class JobLoading extends JobState {
  int page;
  JobLoading({required this.page});
}

class JobLoaded extends JobState {
  late List<JobDetail> jobDetailList;
  JobLoaded(this.jobDetailList);
}
