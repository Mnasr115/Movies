import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';
import '../entities/movie.dart';
import '../repositories/base_movie_repo.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>  {
  final BaseMoviesRepo baseMoviesRepo;

  GetPopularMoviesUseCase(this.baseMoviesRepo);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepo.getPopularMovies();
  }


}
