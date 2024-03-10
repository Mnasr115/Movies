import 'package:equatable/equatable.dart';

import 'geners.dart';

class MovieDetails extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final String overview;
  final List<Genres> genres;
  final double voteAverage;
  final String releaseDate;
  final int runTime;

  const MovieDetails({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.genres,
    required this.voteAverage,
    required this.releaseDate,
    required this.runTime,
  });

  @override
  List<Object> get props =>
      [
        id,
        title,
        backdropPath,
        overview,
        genres,
        voteAverage,
        releaseDate,
        runTime,
      ];
}


