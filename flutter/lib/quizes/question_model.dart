class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question(
    "What does this sign mean?",
    [
      Answer("G", false),
      Answer("K", false),
      Answer("A", true),
      Answer("P", false),
    ],
  ));
  list.add(Question(
    "What does this sign mean??",
    [
      Answer("1", false),
      Answer("6", false),
      Answer("7", false),
      Answer("4", true),
    ],
  ));
  list.add(Question(
    "What does this sign mean?",
    [
      Answer("9", true),
      Answer("3", false),
      Answer("A", false),
      Answer("S", false),
    ],
  ));
  list.add(Question(
    "What does this sign mean?",
    [
      Answer("S", false),
      Answer("O", true),
      Answer("M", false),
      Answer("N", false),
    ],
  ));

  list.add(Question(
    "What does this sign mean",
    [
      Answer("D", false),
      Answer("B", false),
      Answer("H", true),
      Answer("L", false),
    ],
  ));


  list.add(Question(
    "What does this sign mean",
    [
      Answer("I", false),
      Answer("6", false),
      Answer("T", false),
      Answer("3", true),
    ],
  ));

  list.add(Question(
    "Is it a letter 'N'?",
    [
      Answer("True", true),
      Answer("False", false),
    ],
  ));

  list.add(Question(
    "IS it a number 10?",
    [
      Answer("True", false),
      Answer("false", true),
    ],
  ));

  return list;
}