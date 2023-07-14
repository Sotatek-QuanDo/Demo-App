import 'package:demo_application/UI/widget/bottom_navigator_bar.dart';
import 'package:demo_application/UI/widget/top_navigator_bar.dart';
import 'package:demo_application/logic/job_cubit.dart';
import 'package:demo_application/logic/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: true,
        title: Text(
          '导航栏',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () => context.read<LoginCubit>().logOut(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: BlocProvider<JobCubit>(
        create: (context) => JobCubit(1),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10,
          ),
          child: TopNavigator(),
        ),
      ),
      bottomNavigationBar: const BottomNavigator(),
    );
  }
}
