import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api_service.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/models/movie/movie.dart';
import 'package:movies_app/presentation/pages/search_screen.dart';
import 'package:movies_app/presentation/widgets/main_home.dart';

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

  Future<void> getHomeMovies() async {
    emit(LoadingState());

    try {
      var trendingMovies = await _apiService.getSpecificMovies('all');
      var recommendedMovies = await _apiService.getSpecificMovies('action');
      var comedyMovies = await _apiService.getSpecificMovies('comedy');

      List<List<MovieModel>> moviesLists = [
        trendingMovies,
        recommendedMovies,
        comedyMovies
      ];
      emit(GetMoviesSuccessState(moviesLists: moviesLists));
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
