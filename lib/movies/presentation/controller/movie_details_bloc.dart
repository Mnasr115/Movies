import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';

import '../../domain/use_cases/get_movie_details_usecase.dart';
import '../../domain/use_cases/get_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationMoviesUseCase getRecommendationMoviesUseCase;

  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationMoviesUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);

    on<GetRecomandtionMoviesEvent>(_getRecommendationMovies);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(MovieDetailsParameters(
      event.id,
    ));

    result.fold(
      (l) => state.copyWith(
        movieDetailsRequestState: RequestState.error,
        movieDetailsMessage: l.errorMessage,
      ),
      (r) => state.copyWith(
        movieDetailsRequestState: RequestState.loaded,
        movieDetails: r,
      ),
    );
  }

  FutureOr<void> _getRecommendationMovies(
      GetRecomandtionMoviesEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationMoviesUseCase(RecommendationParameters(
      event.id,
    ));

    result.fold(
          (l) => state.copyWith(
        recommendationMoviesRequestState: RequestState.error,
        recommendationMoviesMessage: l.errorMessage,
      ),
          (r) => state.copyWith(
        recommendationMoviesRequestState: RequestState.loaded,
        recommendationMovies: r,
      ),
    );
  }
}
