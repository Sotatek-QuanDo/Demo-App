import 'package:demo_application/UI/widget/job_card.dart';
import 'package:demo_application/data/models/job_detail.dart';
import 'package:demo_application/data/repositories/job_detail_data.dart';

import 'package:demo_application/logic/job_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class Tab1 extends StatefulWidget {
  const Tab1({super.key});

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  static const _pageSize = 33;
  final PagingController<int, JobDetail> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final JobDetailData detailData = JobDetailData();
      final List<JobDetail> listJob = await detailData.getJobDetail(pageKey);

      final nextPageKey = pageKey + 1;
      if (nextPageKey <= _pageSize) {
        _pagingController.appendPage(listJob, nextPageKey);
      } else {
        _pagingController.appendLastPage(listJob);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobCubit, JobState>(
      builder: (context, state) {
        if (state is JobLoading) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Please wait for a minute!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                CircularProgressIndicator(),
              ],
            ),
          );
        } else if (state is JobLoaded) {
          return PagedGridView<int, JobDetail>(
              pagingController: _pagingController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
              ),
              builderDelegate: PagedChildBuilderDelegate<JobDetail>(
                itemBuilder: (context, item, index) => JobCard(
                  name: item.name,
                  thumbnail: item.thumbnail,
                  startWorkingDate: item.startWorkingDate,
                  startWorkingTime: item.startWorkingTime,
                  endWorkingTime: item.endWorkingTime,
                  city: item.city,
                  totalBreakingMinute: item.totalBreakingMinutes.toString(),
                  hourlySalary: item.hourlySalary.toString(),
                  companyID: item.companyId.toString(),
                ),
              ));
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
