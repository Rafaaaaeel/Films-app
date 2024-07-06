import 'package:article_app/src/core/shared/settings/settings.dart';
import 'package:article_app/src/core/utils/injections/injections.dart';
import 'package:article_app/src/features/home/presentation/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

Settings get _settings {
  switch (const String.fromEnvironment('env')) {
    case 'mock':
      return MockSettings();
    default:
      return ProdSettings(
        apiKey: 'edc2152165299261835d73c2a0848d24',
        language: 'en-US&page=1',
      );
  }
}

Future<void> main() async {
  await injections(_settings);
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: const HomePage(),
    ),
  );
}
