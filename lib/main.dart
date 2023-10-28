import 'package:flutter/material.dart';
import 'package:tic_tac_toe_frenzy/screens/home_screen.dart';

import 'utils/theme/colors.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen());
  }
}
