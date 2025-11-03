import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/background_wrapper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/start');
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
    body: BackgroundWrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sports_esports, size: width * 0.28, color: Colors.white),
            SizedBox(height: height * 0.03),
            Text("AniQuess", style: TextStyle(
              fontSize: width * 0.1,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
            SizedBox(height: height * 0.025),
            Text("Loading", style: TextStyle(
              fontSize: width * 0.05,
              color: Colors.white70,
            )),
            SizedBox(height: height * 0.015),
            const CircularProgressIndicator(color: Colors.blueAccent),
          ],
        ),
      ),
    ),
  );

  }
}
