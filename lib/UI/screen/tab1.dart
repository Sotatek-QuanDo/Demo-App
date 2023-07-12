import 'package:demo_application/UI/widget/job_card.dart';

import 'package:demo_application/logic/job_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tab1 extends StatelessWidget {
  const Tab1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobCubit, JobState>(
      builder: (context, state) {
        if (state is JobLoading) {
          print('======= Job is loading');
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
          return GridView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
            ),
            itemCount: state.jobDetailList.length,
            itemBuilder: (context, index) => JobCard(
              name: state.jobDetailList[index].name,
              thumbnail: state.jobDetailList[index].thumbnail,
              startWorkingDate: state.jobDetailList[index].startWorkingDate,
              startWorkingTime: state.jobDetailList[index].startWorkingTime,
              endWorkingTime: state.jobDetailList[index].endWorkingTime,
              city: state.jobDetailList[index].city,
              totalBreakingMinute:
                  state.jobDetailList[index].totalBreakingMinutes.toString(),
              hourlySalary: state.jobDetailList[index].hourlySalary.toString(),
              companyID: state.jobDetailList[index].companyId.toString(),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
