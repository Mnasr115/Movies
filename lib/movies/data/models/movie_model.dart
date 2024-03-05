

import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.overview,
    required super.geneIds,
    required super.voteAverage,
    required super.releaseData,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        overview: json['overview'],
        geneIds: List<int>.from((json['genre_ids']).map((e) => e)),
        voteAverage: json['vote_average'].toDouble(),
        releaseData: json['release_date'],
      );
}
