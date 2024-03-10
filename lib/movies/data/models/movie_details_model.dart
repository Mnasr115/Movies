import 'package:movies/movies/data/models/geners_model.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.overview,
    required super.genres,
    required super.voteAverage,
    required super.releaseDate,
    required super.runTime,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
          id: json['id'],
          title: json['title'],
          backdropPath: json['backdrop_path'],
          overview: json['overview'],
          genres: List<GenresModel>.from(
            json['genres'].map(
              (x) => GenresModel.fromJson(x),
            ),
          ),
          voteAverage: json['vote_average'].toDouble(),
          releaseDate: json['release_date'],
          runTime: json['runtime']);
}
