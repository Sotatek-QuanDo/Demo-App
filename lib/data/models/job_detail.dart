class JobDetail {
  final int id;
  final String thumbnail;
  final int? mediaId;
  final String? endApplyDate;
  final String? endApplyTime;
  final String startWorkingDate;
  final String startWorkingTime;
  final String endWorkingTime;
  final String? startBreakTime;
  final String? endBreakTime;
  final String name;
  final int? prefectureId;
  final int companyId;
  final String city;
  final double hourlySalary;
  final double? incomeBeforeTax;
  final double? incomeAfterTax;
  final String? latitude;
  final String? longitude;
  final int? categoryId;
  final String? status;
  final int? totalBreakingMinutes;
  final int? transportExpenses;
  final int? dayOfWeekStartWorkingDate;
  final String? contactPhoneNumber;
  final int? subCategoryId;
  final String? costumeNote;
  final String? commuteRoute;
  final int? totalUser;
  final int? crawlingJobId;
  final String? crawlingSalary;
  final String? crawlingPaymentMethod;
  final String? crawlingJobType;
  final String? crawlingShiftWorkingTime;
  final String? crawlingWorkingPeriod;
  final String? crawlingQualificationRequirement;
  final String? crawlingBenefit;
  final int? isCrawling;
  final String? contract;
  final int? applierCount;
  final dynamic distance;
  final dynamic userJobApply;
  final dynamic userJobWorking;
  final dynamic userJobWorkingRequest;

  JobDetail({
    required this.id,
    required this.thumbnail,
    this.mediaId,
    this.endApplyDate,
    this.endApplyTime,
    required this.startWorkingDate,
    required this.startWorkingTime,
    required this.endWorkingTime,
    this.startBreakTime,
    this.endBreakTime,
    required this.name,
    this.prefectureId,
    required this.companyId,
    required this.city,
    required this.hourlySalary,
    this.incomeBeforeTax,
    this.incomeAfterTax,
    this.latitude,
    this.longitude,
    this.categoryId,
    this.status,
    required this.totalBreakingMinutes,
    this.transportExpenses,
    this.dayOfWeekStartWorkingDate,
    this.contactPhoneNumber,
    this.subCategoryId,
    this.costumeNote,
    this.commuteRoute,
    this.totalUser,
    this.crawlingJobId,
    this.crawlingSalary,
    this.crawlingPaymentMethod,
    this.crawlingJobType,
    this.crawlingShiftWorkingTime,
    this.crawlingWorkingPeriod,
    this.crawlingQualificationRequirement,
    this.crawlingBenefit,
    this.isCrawling,
    this.contract,
    this.applierCount,
    this.distance,
    this.userJobApply,
    this.userJobWorking,
    this.userJobWorkingRequest,
  });

  factory JobDetail.fromJson(Map<String, dynamic> json) {
    return JobDetail(
      id: json['id'],
      thumbnail: json['thumbnail'],
      mediaId: json['media_id'],
      endApplyDate: json['end_apply_date'],
      endApplyTime: json['end_apply_time'],
      startWorkingDate: json['start_working_date'],
      startWorkingTime: json['start_working_time'],
      endWorkingTime: json['end_working_time'],
      startBreakTime: json['start_break_time'],
      endBreakTime: json['end_break_time'],
      name: json['name'],
      prefectureId: json['prefecture_id'],
      companyId: json['company_id'],
      city: json['city'],
      hourlySalary: json['hourly_salary'].toDouble(),
      incomeBeforeTax: json['income_before_tax'].toDouble(),
      incomeAfterTax: json['income_after_tax'].toDouble(),
      latitude: json['latitude'],
      longitude: json['longitude'],
      categoryId: json['category_id'],
      status: json['status'],
      totalBreakingMinutes: json['total_breaking_minutes'],
      transportExpenses: json['transport_expenses'],
      dayOfWeekStartWorkingDate: json['day_of_week_start_working_date'],
      contactPhoneNumber: json['contact_phone_number'],
      subCategoryId: json['sub_category_id'],
      costumeNote: json['costume_note'],
      commuteRoute: json['commute_route'],
      totalUser: json['total_user'],
      crawlingJobId: json['crawling_job_id'],
      crawlingSalary: json['crawling_salary'],
      crawlingPaymentMethod: json['crawling_payment_method'],
      crawlingJobType: json['crawling_job_type'],
      crawlingShiftWorkingTime: json['crawling_shift_working_time'],
      crawlingWorkingPeriod: json['crawling_working_period'],
      crawlingQualificationRequirement:
          json['crawling_qualification_requirement'],
      crawlingBenefit: json['crawling_benefit'],
      isCrawling: json['is_crawling'],
      contract: json['contract'],
      applierCount: json['applier_count'],
      distance: json['distance'],
      userJobApply: json['user_job_apply'],
      userJobWorking: json['user_job_working'],
      userJobWorkingRequest: json['user_job_working_request'],
    );
  }
}
