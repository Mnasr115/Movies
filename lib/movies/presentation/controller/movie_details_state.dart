part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsRequestState;
  final String movieDetailsMessage;
  final List<Recommendation> recommendationMovies;
  final RequestState recommendationMoviesRequestState;
  final String recommendationMoviesMessage;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsRequestState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.recommendationMovies = const [],
    this.recommendationMoviesMessage = '',
    this.recommendationMoviesRequestState = RequestState.loading,
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsRequestState,
    String? movieDetailsMessage,
    List<Recommendation>? recommendationMovies,
    RequestState? recommendationMoviesRequestState,
    String? recommendationMoviesMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsRequestState:
      movieDetailsRequestState ?? this.movieDetailsRequestState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendationMovies:
      recommendationMovies ?? this.recommendationMovies,
      recommendationMoviesRequestState:
      recommendationMoviesRequestState ??
          this.recommendationMoviesRequestState,
      recommendationMoviesMessage: recommendationMoviesMessage ??
          this.recommendationMoviesMessage,
    );
  }

  @override
  List<Object?> get props =>
      [
        movieDetails,
        movieDetailsRequestState,
        movieDetailsMessage,
        recommendationMovies,
        recommendationMoviesRequestState,
        recommendationMoviesMessage,
      ];
}
