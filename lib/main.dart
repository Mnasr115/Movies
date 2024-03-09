import 'package:flutter/material.dart';
import 'package:movies/core/services/services_locator.dart';
import 'package:movies/movies/presentation/screens/movies_screen.dart';


void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MoviesScreen(),
    );
  }
}
