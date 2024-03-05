import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/data/data_sources/movie_remote_dat_source.dart';
import 'package:movies/movies/data/repositories/movie_repo.dart';
import 'package:movies/movies/domain/repositories/base_movie_repo.dart';
import 'package:movies/movies/domain/use_cases/get_nowPlayng_movies_usecase.dart';
import 'package:movies/movies/presentation/controller/movie_event.dart';
import 'package:movies/movies/presentation/controller/movie_state.dart';

class MovieBloc extends Bloc<MoviesEvent, MoviesState> {
  MovieBloc() : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      BaseMovieRemoteDataSource baseMovieRemoteDataSource =
          MovieRemoteDataSource();

      BaseMoviesRepo baseMoviesRepo = MovieRepo(baseMovieRemoteDataSource);

      final result = await GetNowPlayingMovieUseCase(baseMoviesRepo).execute();
    });
  }
}
