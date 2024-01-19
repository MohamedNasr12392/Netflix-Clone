import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/controllers/home_cubit/home_cubit_cubit.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({super.key, required this.homeContext});

  final BuildContext homeContext;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: homeContext.read<HomeCubit>().currentIndex,
      onTap: (newIndex) {
        homeContext.read<HomeCubit>().tapNavBar(newIndex);
      },
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      backgroundColor: Colors.black,
      items: const [
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.home,
            size: 16,
            color: Colors.grey,
          ),
          activeIcon: Icon(
            Icons.home,
            size: 16,
            color: Colors.red,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.search,
            size: 16,
            color: Colors.grey,
          ),
          activeIcon: Icon(
            Icons.search,
            size: 16,
            color: Colors.red,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.download,
            size: 16,
            color: Colors.grey,
          ),
          activeIcon: Icon(
            Icons.download,
            size: 16,
            color: Colors.red,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.person,
            size: 16,
            color: Colors.grey,
          ),
          activeIcon: Icon(
            Icons.person,
            size: 16,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
