import 'package:dartz/dartz.dart';
import '../../../core/use_case/base_use_case.dart';
import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repositories/base_movie_repo.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>> {
  final BaseMoviesRepo baseMoviesRepo;

  GetTopRatedMoviesUseCase(this.baseMoviesRepo);
  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMoviesRepo.getTopRatedMovies();
  }
}
