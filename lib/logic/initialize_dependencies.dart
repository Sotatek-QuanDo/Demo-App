import 'package:demo_application/data/models/job_detail.dart';
import 'package:demo_application/data/repositories/job_detail_data.dart';
import 'package:demo_application/logic/job_cubit.dart';
import 'package:demo_application/logic/login_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'authenticate_cubit.dart';

Future initializeDependencies() async {
  GetIt.instance.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  //AuthenticateCubit instance
  GetIt.instance.registerSingleton(LoginCubit());
  GetIt.instance
      .registerSingleton(AuthenticateCubit(loginCubit: GetIt.instance.get()));

  // JobCubit instance to get data
  GetIt.instance.registerSingleton(JobCubit(0));

  // PagingController instance
  final PagingController<int, JobDetail> pagingController =
      PagingController(firstPageKey: 0);
  Future<void> fetchPage(int pageKey) async {
    try {
      final JobDetailData detailData = JobDetailData();
      final List<JobDetail> listJob = await detailData.getJobDetail(pageKey);

      final nextPageKey = pageKey + 1;
      if (nextPageKey <= 33) {
        pagingController.appendPage(listJob, nextPageKey);
      } else {
        pagingController.appendLastPage(listJob);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  pagingController.addPageRequestListener((pageKey) {
    fetchPage(pageKey);
  });
  GetIt.instance
      .registerSingleton<PagingController<int, JobDetail>>(pagingController);

  //SharedPreferences
}
