import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/data_sources/movie_remote_dat_source.dart';
import 'package:movies/movies/data/repositories/movie_repo.dart';
import 'package:movies/movies/domain/repositories/base_movie_repo.dart';
import 'package:movies/movies/domain/use_cases/get_nowPlayng_movies_usecase.dart';
import 'package:movies/movies/domain/use_cases/get_popular_movies_usecase.dart';
import 'package:movies/movies/presentation/controller/movie_bloc.dart';

import '../../movies/domain/use_cases/get_top_rated_movies_usecase.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerFactory(
      () => MovieBloc(sl(), sl(), sl()),
    );

    /// Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepo>(() => MovieRepo(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
