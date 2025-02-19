class QuestionM {
  final String questionMText;
  final List<AnswerM> answermsList;

  QuestionM(this.questionMText, this.answermsList);
}

class AnswerM {
  final String answermText;
  final bool isCorrect;

  AnswerM(this.answermText, this.isCorrect);
}

List<QuestionM> getQuestions() {
  List<QuestionM> list = [];
  //ADD questions and answer here

  list.add(QuestionM(
    "What does this sign mean?",
    [
      AnswerM("G", false),
      AnswerM("K", false),
      AnswerM("A", true),
      AnswerM("k", false),
    ],
  ));
  list.add(QuestionM(
    "What does this sign mean??",
    [
      AnswerM("1", false),
      AnswerM ("6", false),
      AnswerM("7", false),
      AnswerM("4", true),
    ],
  ));
  list.add(QuestionM(
    "What does this sign mean?",
    [
      AnswerM("9", true),
      AnswerM("3", false),
      AnswerM("A", false),
      AnswerM("S", false),
    ],
  ));
  list.add(QuestionM(
    "What does this sign mean?",
    [
      AnswerM("S", false),
      AnswerM("O", true),
      AnswerM("M", false),
      AnswerM("N", false),
    ],
  ));

  list.add(QuestionM(
    "What does this sign mean",
    [
      AnswerM("D", false),
      AnswerM("B", false),
      AnswerM("H", true),
      AnswerM("L", false),
    ],
  ));


  list.add(QuestionM(
    "What does this sign mean",
    [
      AnswerM("I", false),
      AnswerM("6", false),
      AnswerM("T", false),
      AnswerM("3", true),
    ],
  ));

  list.add(QuestionM(
    "Is it a letter 'N'?",
    [
      AnswerM("True", true),
      AnswerM("False", false),
    ],
  ));

  list.add(QuestionM(
    "IS it a number 10?",
    [
      AnswerM("True", false),
      AnswerM("false", true),
    ],
  ));

  return list;
}