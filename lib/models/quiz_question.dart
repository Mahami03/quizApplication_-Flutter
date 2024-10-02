class QuizQuestion {
  const QuizQuestion(this.questionHeader, this.answers);

  final String questionHeader;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffeledAnswers = List.of(answers);
    shuffeledAnswers.shuffle();
    return shuffeledAnswers;
  }
}
