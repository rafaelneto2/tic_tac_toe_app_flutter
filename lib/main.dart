import 'package:flutter/material.dart';
import 'package:tic_tac_toe/pages/game_page.dart';

import 'core/constants.dart';
import 'core/theme_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: GAME_TITLE,
      theme: themeApp,
      home: const GamePage(),
    );
  }
}