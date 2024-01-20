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
          child:
              BlocBuilder<HomeCubit, HomeCubitState>(builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: context.watch<HomeCubit>().currentIndex != 1
                  ? const CustomAppBar()
                  : null,
              body: HomeScreenBody(
                body: context
                    .read<HomeCubit>()
                    .body[context.read<HomeCubit>().currentIndex],
              ),
              bottomNavigationBar: HomeNavBar(homeContext: context),
            );
          }),
        ),
      ),
    );
  }
}
