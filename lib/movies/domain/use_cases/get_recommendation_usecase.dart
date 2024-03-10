import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/use_case/base_use_case.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';
import 'package:movies/movies/domain/repositories/base_movie_repo.dart';

class GetRecommendationMoviesUseCase
    extends BaseUseCase <List<Recommendation>, RecommendationParameters> {

  final BaseMoviesRepo baseMoviesRepo;

  GetRecommendationMoviesUseCase(this.baseMoviesRepo);

  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters)async {
    return await baseMoviesRepo.getRecommendationMovies(parameters);
  }


}

class RecommendationParameters extends Equatable {

  final int id;

  const RecommendationParameters({required this.id});

  @override
  List<Object> get props => [id];
}