import 'package:flutter/material.dart';
import '../data/quiz_data.dart';
import '../widgets/question_card.dart';

class QuestionScreen extends StatefulWidget {
  final String playerName;
  const QuestionScreen({super.key, required this.playerName});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentIndex = 0;
  int? selectedIndex;
  bool isAnswered = false;

  void handleAnswer(int index) {
    if (isAnswered) return;

    setState(() {
      selectedIndex = index;
      isAnswered = true;
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (currentIndex < quizData.length - 1) {
        setState(() {
          currentIndex++;
          selectedIndex = null;
          isAnswered = false;
        });
      } else {
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = quizData[currentIndex];

    return PopScope(
    canPop: false,
    child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Player: ${widget.playerName}"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
            Text(
              "Question ${currentIndex + 1}/5",
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color:Colors.white,
              ),
            ),

          Expanded(
            child: Center(
              child: QuestionCard(
                image: question.image,
                question: question.question,
                options: question.options,
                answerIndex: question.correctIndex,
                selectedIndex: selectedIndex,
                onPressed: handleAnswer,
              ),
            ),
          ),
        ],
      ),
    ),
  );
  }
}
