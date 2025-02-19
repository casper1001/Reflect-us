class QuestionN {
  final String questionNText;
  final List<AnswerN> answernsList;

  QuestionN(this.questionNText, this.answernsList);
}

class AnswerN {
  final String answernText;
  final bool isCorrect;

  AnswerN(this.answernText, this.isCorrect);
}

List<QuestionN> getQuestions() {
  List<QuestionN> list = [];
  //ADD questions and answer here

  list.add(QuestionN(
    "What does this sign mean?",
    [
      AnswerN("G", false),
      AnswerN("K", false),
      AnswerN("A", true),
      AnswerN("P", false),
    ],
  ));
  list.add(QuestionN(
    "What does this sign mean??",
    [
      AnswerN("1", false),
      AnswerN("6", false),
      AnswerN("7", false),
      AnswerN("4", true),
    ],
  ));
  list.add(QuestionN(
    "What does this sign mean?",
    [
      AnswerN("9", true),
      AnswerN("3", false),
      AnswerN("A", false),
      AnswerN("S", false),
    ],
  ));
  list.add(QuestionN(
    "What does this sign mean?",
    [
      AnswerN("S", false),
      AnswerN("O", true),
      AnswerN("M", false),
      AnswerN("N", false),
    ],
  ));

  list.add(QuestionN(
    "What does this sign mean",
    [
      AnswerN("D", false),
      AnswerN("B", false),
      AnswerN("H", true),
      AnswerN("L", false),
    ],
  ));


  list.add(QuestionN(
    "What does this sign mean",
    [
      AnswerN("I", false),
      AnswerN("6", false),
      AnswerN("T", false),
      AnswerN("3", true),
    ],
  ));

  list.add(QuestionN(
    "Is it a letter 'N'?",
    [
      AnswerN("True", true),
      AnswerN("False", false),
    ],
  ));

  list.add(QuestionN(
    "IS it a number 10?",
    [
      AnswerN("True", false),
      AnswerN("false", true),
    ],
  ));

  return list;
}