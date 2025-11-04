class QuizQuestion {
  final String image;
  final String question;
  final List<String> options;
  final int correctIndex;

  QuizQuestion({
    required this.image,
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}
