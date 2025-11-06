import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String playerName;
  final int score;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.playerName,
    required this.score,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Well Done!",
                style: TextStyle(
                  fontSize: screenWidth * 0.09,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              Text(
                playerName,
                style: TextStyle(
                  fontSize: screenWidth * 0.07,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueAccent,
                ),
              ),

              SizedBox(height: screenHeight * 0.05),

              Text(
                "$score / 5",
                style: TextStyle(
                  fontSize: screenWidth * 0.12,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent,
                ),
              ),

              SizedBox(height: screenHeight * 0.08),

              ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.25,
                    vertical: screenHeight * 0.02,
                  ),
                ),
                child: Text(
                  "Play Again",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
