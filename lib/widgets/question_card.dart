import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String image;
  final String question;
  final List options;
  final int answerIndex;
  final int? selectedIndex;
  final Function(int) onPressed;

  const QuestionCard({
    super.key,
    required this.image,
    required this.question,
    required this.options,
    required this.answerIndex,
    required this.selectedIndex,
    required this.onPressed,
  });

  Color? getColor(int index) {
    if (selectedIndex == null) return null;
    if (index == answerIndex) return Colors.green;
    if (index == selectedIndex) return Colors.red;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // Ambil ukuran layar
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.02,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Gambar responsif
          Image.asset(
            image,
            height: screenHeight * 0.25,
            fit: BoxFit.contain,
          ),
          SizedBox(height: screenHeight * 0.03),

          // Pertanyaan
          Text(
            question,
            style: TextStyle(
              fontSize: screenWidth * 0.06, // responsif terhadap lebar layar
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight * 0.03),

          // Daftar opsi
          ...List.generate(options.length, (index) {
            final color = getColor(index);

            return GestureDetector(
              onTap: () => onPressed(index),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.02,
                  horizontal: screenWidth * 0.04,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: color ?? Colors.blueAccent,
                  border: Border.all(color: Colors.black12),
                ),
                child: Text(
                  options[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
