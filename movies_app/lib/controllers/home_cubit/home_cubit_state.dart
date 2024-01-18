part of 'home_cubit_cubit.dart';

@immutable
sealed class HomeCubitState {}

class HomeCubitInitial extends HomeCubitState {}

class BottomNavBarClicked extends HomeCubitState {}
