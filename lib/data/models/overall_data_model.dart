import 'package:demo_application/data/models/job.dart';

class OverallDataModel {
  final bool? success;
  final String? message;
  final String? dataVersion;
  final Job data;

  OverallDataModel({
    this.success,
    this.message,
    this.dataVersion,
    required this.data,
  });

  factory OverallDataModel.fromJson(Map<String, dynamic> json) {
    return OverallDataModel(
      success: json['success'],
      message: json['message'],
      dataVersion: json['dataVersion'],
      data: Job.fromJson(json['data']),
    );
  }
}
