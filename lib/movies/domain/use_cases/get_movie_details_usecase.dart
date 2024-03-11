import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/use_case/base_use_case.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';
import 'package:movies/movies/domain/repositories/base_movie_repo.dart';


class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails, MovieDetailsParameters> {

  final BaseMoviesRepo baseMoviesRepo;

  GetMovieDetailsUseCase(this.baseMoviesRepo);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameters parameters) async {
    return await baseMoviesRepo.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {

  final int movieId;

  const MovieDetailsParameters(this.movieId);

  @override
  List<Object> get props => [movieId];

}
