import 'package:demo_application/logic/job_cubit.dart';

import 'package:flutter/material.dart';

import 'package:demo_application/UI/screen/tab1.dart';
import 'package:demo_application/UI/screen/tab2.dart';
import 'package:demo_application/UI/screen/tab3.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopNavigator extends StatefulWidget {
  const TopNavigator({super.key});

  @override
  State<TopNavigator> createState() => _TopNavigatorState();
}

class _TopNavigatorState extends State<TopNavigator> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelStyle: Theme.of(context).textTheme.titleMedium,
            labelColor: const Color(0xFF3478F5),
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(
                text: '募集中',
              ),
              Tab(text: '募集終了'),
              Tab(text: '企業'),
            ],
            indicatorColor: Colors.blue,
          ),
          Expanded(
            child: BlocProvider<JobCubit>(
              create: (context) => JobCubit(1),
              child: const TabBarView(
                children: [
                  Tab1(),
                  Tab2(),
                  Tab3(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
