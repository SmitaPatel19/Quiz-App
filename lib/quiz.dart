
import 'package:quiz_app/questions.dart';
import 'package:flutter/material.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});


  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  int qi=0;
  Answer? selectedAnswer;

  List QuestionBank= [
    Question.name("Which K-drama is known for its iconic finger heart gesture "
        "and features a romance between a military officer and a doctor?",
    [
      Answer("Descendants of the Sun", true),
      Answer("My Love from the Star", false),
      Answer("Goblin", false),
      Answer("Itaewon Class",false),
    ]),
    Question.name("In which K-drama does the female lead often work as a secretary"
        " and falls in love with her boss, who is usually a wealthy CEO?",
    [
      Answer("Boys Over Flowers", false),
      Answer("Healer", false),
      Answer("What's Wrong with Secretary Kim", true),
      Answer("W - Two Worlds", false),
    ]),
    Question.name("Which K-drama genre typically revolves around the"
        " lives and struggles of medical professionals in a hospital setting?",
    [
      Answer("Romantic Comedy", false),
      Answer("Historical", false),
      Answer("Medical Drama", true),
      Answer("Fantasy", false),
    ]),
    Question.name("Which K-drama is based on the popular webtoon of the same name and revolves around a young"
        " woman's quest for revenge in the competitive world of a food company?",
    [
      Answer("It's Okay to Not Be Okay", false),
      Answer("Start-Up", true),
      Answer("Weightlifting Fairy Kim Bok-joo", false),
      Answer("Signal", false),
    ]),
    Question.name("Which K-drama features a time-traveling female lead who finds herself"
        " in the Joseon Dynasty and becomes entangled in political intrigue?",
    [
      Answer("Moon Lovers: Scarlet Heart Ryeo", true),
      Answer("Strong Woman Do Bong-soon", false),
      Answer("Love Alarm", false),
      Answer("Reply 1988", false),
    ]),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.purple.shade50,
      body: Column(
        children: [
          Center(child: Icon(Icons.quiz,size: 200,color: Colors.purple.shade800,),),

          Text("Did you Know?",style: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),),

          SizedBox(height: 10,),

          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.purple,
                style: BorderStyle.solid,
              )
            ),

            child: Center(
              child: Text(QuestionBank[qi].quesText,textAlign: TextAlign.center,style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.purple,
              ),),
            ),
          ),

          SizedBox(height: 10,),

          ElevatedButton(onPressed: (){

            checkAns(QuestionBank[qi].ansList[0], context);
          }, child: Text(QuestionBank[qi].ansList[0].answerText,textAlign: TextAlign.center,style: CommonStyle(),)),

          ElevatedButton(onPressed: (){

            checkAns(QuestionBank[qi].ansList[1], context);
          }, child: Text(QuestionBank[qi].ansList[1].answerText,textAlign: TextAlign.center,style: CommonStyle(),)),

          ElevatedButton(onPressed: (){

            checkAns(QuestionBank[qi].ansList[2], context);
          }, child: Text(QuestionBank[qi].ansList[2].answerText,textAlign: TextAlign.center,style: CommonStyle(),)),

          ElevatedButton(onPressed: (){

            checkAns(QuestionBank[qi].ansList[3], context);
          }, child: Text(QuestionBank[qi].ansList[3].answerText,textAlign: TextAlign.center,style: CommonStyle(),)),

          SizedBox(
            height: 2,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: (){
                    prevQuiz();
                  }, icon: Icon(Icons.navigate_before,size: 30,color: Colors.purple,)),

                  Text("Previous",style: CommonStyle(),),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Text("Next",style: CommonStyle(),),

                  IconButton(onPressed: (){
                    nextQuize();
                  }, icon: Icon(Icons.navigate_next,size: 30,color: Colors.purple,)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  TextStyle CommonStyle() {
    return TextStyle(
      fontSize: 18,
      color: Colors.purple,
    );
  }

  void checkAns( Answer ans,BuildContext context) {

    if(selectedAnswer == null){
      if(ans.isCorrect){
        final snackBar = SnackBar(
          content: Text("Correct"),
          duration: Duration(milliseconds: 600),
          backgroundColor: Colors.green,
        );
        ScaffoldMessenger.of(context ).showSnackBar(snackBar);
        nextQuize();
      }
      else{
        final snackBar = SnackBar(
          content: Text("InCorrect"),
          duration: Duration(milliseconds: 600),
          backgroundColor: Colors.red,
        );
        //Scaffold.of(context).showSnackBar(snackBar);
        ScaffoldMessenger.of(context ).showSnackBar(snackBar);
        nextQuize();
      }
    }

  }

  nextQuize(){
    setState(() {
      qi = (qi+1)% QuestionBank.length;
    });
  }

  prevQuiz(){
    setState(() {
      if(qi <= 0){
        qi=0;
      }else{
        qi--;
      }
    });
  }
}
