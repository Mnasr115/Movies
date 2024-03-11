import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/presentation/controller/movie_details_bloc.dart';
import '../../../core/services/services_locator.dart';
import '../widgets/movie_details_content.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieDetailsBloc>()
        ..add(GetMovieDetailsEvent(id))
        ..add(GetRecomandtionMoviesEvent(id)),
      child: const Scaffold(
        body: MovieDetailContent(),
      ),
    );
  }
}
