import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

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
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
      },
    );
  }
}
