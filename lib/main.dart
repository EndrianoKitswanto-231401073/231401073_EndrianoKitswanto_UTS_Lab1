import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/start_screen.dart';

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
        fontFamily: "Poppins", // nanti diganti Orbitron kalau mau
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.blue,
      ),

      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/start': (_) => const StartScreen(),
        '/quiz': (_) => const Placeholder(), // nanti diganti ke Quiz Screen
      },
    );
  }
}
