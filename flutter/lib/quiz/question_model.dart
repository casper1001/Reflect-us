class QuestionModel {
  final String questionText;
  final List<String> answersList;
  final int correctInx;
  final String video;
  final String model3D;

  QuestionModel(
        {
          required this.questionText,
          required this.answersList,
          required this.correctInx,
          required this.video,
          required this.model3D
        }
      );
}
