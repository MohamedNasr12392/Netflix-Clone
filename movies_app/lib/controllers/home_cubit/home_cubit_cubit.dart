import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api_service.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/models/movie/movie.dart';
import 'package:movies_app/presentation/widgets/main_home.dart';
import 'package:movies_app/presentation/widgets/search.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeCubitInitial());

  final ApiService _apiService = ApiService();

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

  Future<void> getMovies() async {
    emit(LoadingState());

    try {
      var movies = await _apiService.getMovies();

      emit(GetMoviesSuccessState(movies: movies));
    } catch (e) {
      if (e is DioException) {
        emit(GetMoviesErrorState(
            errorMsg: ServerFailure.fromDioError(e).errorMessage));
      }
      emit(GetMoviesErrorState(
          errorMsg: ServerFailure(e.toString()).errorMessage));
    }
  }
}
