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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(image, height: 200, fit: BoxFit.cover),
                  const SizedBox(height: 20),

                  Text(
                    question,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // OPTIONS
          Flexible(
            flex: 2,
            child: Column(
              children: List.generate(options.length, (index) {
                final color = getColor(index);

                return Flexible(
                  child: GestureDetector(
                    onTap: () => onPressed(index),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      height: 60, // ✅ tinggi tombol sama semua
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: color ?? Colors.blueAccent,
                      ),
                      child: Text(
                        options[index],
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}