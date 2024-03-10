import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/use_cases/get_movie_details_usecase.dart';
import 'package:movies/movies/domain/use_cases/get_recommendation_usecase.dart';
import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../entities/movie_details.dart';
import '../entities/recommendation.dart';


// just contract
abstract class BaseMoviesRepo {
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure,List<Movie>>> getPopularMovies();
  Future<Either<Failure,List<Movie>>> getTopRatedMovies();

  Future<Either<Failure,MovieDetails>> getMovieDetails(MovieDetailsParameters parameters);

  Future<Either<Failure,List<Recommendation>>> getRecommendationMovies(RecommendationParameters parameters);
}
