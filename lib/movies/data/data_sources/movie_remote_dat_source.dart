import 'package:dio/dio.dart';
import 'package:movies/movies/data/models/movie_details_model.dart';
import 'package:movies/movies/data/models/recommendation_model.dart';
import 'package:movies/movies/domain/use_cases/get_movie_details_usecase.dart';
import 'package:movies/movies/domain/use_cases/get_recommendation_usecase.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/api_constance.dart';
import '../../../core/network/error_message_model.dart';
import '../models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);

  Future<List<RecommendationModel>> getRecommendationMovie(RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
      ApiConstance.nowPlayingMoviesPath,
    );

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
              (e) {
            return MovieModel.fromJson(
              e,
            );
          },
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(
      ApiConstance.popularMoviesPath,
    );

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
              (e) {
            return MovieModel.fromJson(
              e,
            );
          },
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(
      ApiConstance.topRatedMoviesPath,
    );

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
              (e) {
            return MovieModel.fromJson(
              e,
            );
          },
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters,) async {
    final response = await Dio().get(
      ApiConstance.movieDetailsPath(parameters.movieId),
    );

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendationMovie(RecommendationParameters parameters) async {
    final response = await Dio().get(
      ApiConstance.recommendationPath(parameters.id),
    );

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
        (response.data['results'] as List).map(
              (e) {
            return RecommendationModel.fromJson(
              e,
            );
          },
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }
}
