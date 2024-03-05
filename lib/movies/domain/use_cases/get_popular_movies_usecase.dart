import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repositories/base_movie_repo.dart';

class GetPopularMoviesUseCase {
  final BaseMoviesRepo baseMoviesRepo;

  GetPopularMoviesUseCase(this.baseMoviesRepo);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMoviesRepo.getPopularMovies();
  }
}
