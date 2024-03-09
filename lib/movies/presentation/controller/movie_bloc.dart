import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/use_cases/get_nowPlayng_movies_usecase.dart';
import 'package:movies/movies/domain/use_cases/get_popular_movies_usecase.dart';
import 'package:movies/movies/domain/use_cases/get_top_rated_movies_usecase.dart';
import 'package:movies/movies/presentation/controller/movie_event.dart';
import 'package:movies/movies/presentation/controller/movie_state.dart';

class MovieBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMovieUseCase getNowPlayingMovieUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MovieBloc(
    this.getNowPlayingMovieUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  Future<FutureOr<void>> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMovieUseCase();

    result.fold(
      (failure) => emit(
        state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: failure.errorMessage,
        ),
      ),
      (movies) => emit(state.copyWith(
        nowPlayingState: RequestState.loaded,
        nowPlayingMovies: movies,
      )),
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          popularState: RequestState.error,
          popularMessage: failure.errorMessage,
        ),
      ),
      (movies) => emit(
        state.copyWith(
          popularState: RequestState.loaded,
          popularMovies: movies,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase();
    result.fold(
          (failure) => emit(
        state.copyWith(
          topRatedState: RequestState.error,
          topRatedMessage: failure.errorMessage,
        ),
      ),
          (movies) => emit(
        state.copyWith(
          topRatedState: RequestState.loaded,
          topRatedMovies: movies,
        ),
      ),
    );
  }
}
