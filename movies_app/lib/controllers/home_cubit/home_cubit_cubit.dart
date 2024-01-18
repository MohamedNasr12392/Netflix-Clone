import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/widgets/main_home.dart';
import 'package:movies_app/presentation/widgets/search.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeCubitInitial());

  int currentIndex = 0;

  List<Widget> body = [
    const MainHome(),
    const SearchScreen(),
    Container(),
    Container(),
  ];

  void tapNavBar(int newIndex) {
    currentIndex = newIndex;
    emit(BottomNavBarClicked());
  }
}
