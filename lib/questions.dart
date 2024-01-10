class Question{
  String quesText;
  List<Answer> ansList;

  Question.name(this.quesText,this.ansList);
}

class Answer{

  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);

}