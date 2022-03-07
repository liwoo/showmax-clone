import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showmax_clone/bloc/movie_cubit.dart';
import 'package:showmax_clone/screens/movie.dart';
import 'package:showmax_clone/screens/root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieCubit>(
      create: (context) => MovieCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Showmax Clone',
          theme: ThemeData(
              primarySwatch: Colors.pink, canvasColor: Colors.black87),
          routes: {
            '/movieDetails': (context) => const MovieScreen(),
          },
          home: const RootScreen()),
    );
  }
}
