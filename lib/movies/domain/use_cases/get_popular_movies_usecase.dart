import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';
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
