import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/data_sources/movie_remote_dat_source.dart';
import 'package:movies/movies/data/repositories/movie_repo.dart';
import 'package:movies/movies/domain/repositories/base_movie_repo.dart';
import 'package:movies/movies/domain/use_cases/get_nowPlayng_movies_usecase.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    getIt.registerLazySingleton(
      () => GetNowPlayingMovieUseCase(
        getIt(),
      ),
    );

    getIt.registerLazySingleton<BaseMoviesRepo>(
      () => MovieRepo(
        getIt(),
      ),
    );

    /// USE CASE
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource(),
    );
  }
}
