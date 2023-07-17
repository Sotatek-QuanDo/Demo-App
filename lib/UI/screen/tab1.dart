import 'package:demo_application/UI/widget/job_card.dart';
import 'package:demo_application/data/models/job_detail.dart';

import 'package:demo_application/logic/job_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class Tab1 extends StatefulWidget {
  const Tab1({super.key});

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobCubit, JobState>(
      builder: (context, state) {
        if (state is JobLoading) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
              pagingController:
                  GetIt.instance.get<PagingController<int, JobDetail>>(),
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
