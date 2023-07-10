import 'package:demo_application/data/models/job_detail.dart';

class Job {
  final int currentPage;
  final List<JobDetail> jobs;

  Job({
    required this.currentPage,
    required this.jobs,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      currentPage: json['current_page'],
      jobs: List<JobDetail>.from(json['data'].map((job) => Job.fromJson(job))),
    );
  }
}
