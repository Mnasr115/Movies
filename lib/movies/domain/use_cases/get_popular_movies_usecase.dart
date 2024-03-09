import 'package:dartz/dartz.dart';
import 'package:movies/core/base_usecase/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repositories/base_movie_repo.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>>  {
  final BaseMoviesRepo baseMoviesRepo;

  GetPopularMoviesUseCase(this.baseMoviesRepo);

  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMoviesRepo.getPopularMovies();
  }


}
