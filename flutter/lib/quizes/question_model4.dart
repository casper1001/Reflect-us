class QuestionV {
  final String questionVText;
  final List<AnswerV> answersVList;

  QuestionV(this.questionVText, this.answersVList);
}

class AnswerV {
  final String answerVText;
  final bool isCorrect;

  AnswerV(this.answerVText, this.isCorrect);
}

List<QuestionV> getQuestions() {
  List<QuestionV> list = [];
  //ADD questions and answer here

  list.add(QuestionV(
    "What does this sign mean?",
    [
      AnswerV("G", false),
      AnswerV("K", false),
      AnswerV("A", true),
      AnswerV("P", false),
    ],
  ));
  list.add(QuestionV(
    "What does this sign mean??",
    [
      AnswerV("1", false),
      AnswerV("6", false),
      AnswerV("7", false),
      AnswerV("4", true),
    ],
  ));
  list.add(QuestionV(
    "What does this sign mean?",
    [
      AnswerV("9", true),
      AnswerV("3", false),
      AnswerV("A", false),
      AnswerV("S", false),
    ],
  ));
  list.add(QuestionV(
    "What does this sign mean?",
    [
      AnswerV("S", false),
      AnswerV("O", true),
      AnswerV("M", false),
      AnswerV("N", false),
    ],
  ));

  list.add(QuestionV(
    "What does this sign mean",
    [
      AnswerV("D", false),
      AnswerV("B", false),
      AnswerV("H", true),
      AnswerV("L", false),
    ],
  ));


  list.add(QuestionV(
    "What does this sign mean",
    [
      AnswerV("I", false),
      AnswerV("6", false),
      AnswerV("T", false),
      AnswerV("3", true),
    ],
  ));

  list.add(QuestionV(
    "Is it a letter 'N'?",
    [
      AnswerV("True", true),
      AnswerV("False", false),
    ],
  ));

  list.add(QuestionV(
    "IS it a number 10?",
    [
      AnswerV("True", false),
      AnswerV("false", true),
    ],
  ));

  return list;
}