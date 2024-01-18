import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/controllers/home_cubit/home_cubit_cubit.dart';
import 'package:movies_app/presentation/widgets/home_appbar.dart';
import 'package:movies_app/presentation/widgets/home_navbar.dart';
import 'package:movies_app/presentation/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        animationDuration: const Duration(seconds: 1),
        child: BlocProvider(
          create: (context) => HomeCubit(),
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: const CustomAppBar(),
            body: BlocBuilder<HomeCubit, HomeCubitState>(
              builder: (context, state) {
                if (state is BottomNavBarClicked || state is HomeCubitInitial) {
                  return HomeScreenBody(
                    body: context
                        .read<HomeCubit>()
                        .body[context.read<HomeCubit>().currentIndex],
                  );
                }
                return const SizedBox();
              },
            ),
            bottomNavigationBar: BlocBuilder<HomeCubit, HomeCubitState>(
              builder: (context, state) {
                if (state is BottomNavBarClicked || state is HomeCubitInitial) {
                  return HomeNavBar(homeContext: context);
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
