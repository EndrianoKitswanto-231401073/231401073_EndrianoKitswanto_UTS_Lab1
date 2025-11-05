import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/start_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';

void main() {
  runApp(const AniQuessApp());
}

class AniQuessApp extends StatelessWidget {
  const AniQuessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AniQuess',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        fontFamily: "Orbitron", 
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.blue,
      ),

      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/start': (_) => const StartScreen(),
        '/quiz': (context) {
          final playerName = ModalRoute.of(context)!.settings.arguments as String;
          return QuestionScreen(playerName: playerName);
        },
        '/result': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;

            return ResultScreen(
              playerName: args["name"], 
              score: args["score"],
              onRestart: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/start',
                );
              },
            );
          },
      },
    );
  }
}
