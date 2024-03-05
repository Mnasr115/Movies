import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final String overview;
  final List<int> geneIds;
  final double voteAverage;
  final String releaseData;

  const Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.geneIds,
    required this.voteAverage,
    required this.releaseData,
  });

  @override
  List<Object> get props => [
        id,
        title,
        backdropPath,
        overview,
        geneIds,
        voteAverage,
        releaseData,
      ];
}
