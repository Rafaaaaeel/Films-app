import 'package:article_app/src/core/utils/injections/injections.dart';
import 'package:article_app/src/features/movies/presentation/pages/movies_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await injections();
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: const MoviesPage(),
    ),
  );
}
