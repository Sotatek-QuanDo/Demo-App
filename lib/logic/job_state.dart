part of 'job_cubit.dart';

abstract class JobState {}

class JobInitial extends JobState {}

class JobLoading extends JobState {}

class JobLoaded extends JobState {
  late List<JobDetail> jobDetailList;
  JobLoaded(this.jobDetailList);
}
