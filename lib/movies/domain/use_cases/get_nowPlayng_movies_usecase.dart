import 'package:dartz/dartz.dart';
import 'package:movies/core/base_usecase/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repositories/base_movie_repo.dart';

class GetNowPlayingMovieUseCase extends BaseUseCase<List<Movie>> {
  final BaseMoviesRepo baseMoviesRepo;

  GetNowPlayingMovieUseCase(this.baseMoviesRepo);
  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMoviesRepo.getNowPlayingMovies();
  }
}
