import 'package:quiz_app/questions.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int qi = 0;
  bool isAnswered = false;

  final List<Question> questionBank = [
    Question.name(
        "Which K-drama is known for its iconic finger heart gesture and features a romance between a military officer and a doctor?",
        [
          Answer("Descendants of the Sun", true),
          Answer("My Love from the Star", false),
          Answer("Goblin", false),
          Answer("Itaewon Class", false),
        ]),
    Question.name(
        "In which K-drama does the female lead often work as a secretary and falls in love with her boss, who is usually a wealthy CEO?",
        [
          Answer("Boys Over Flowers", false),
          Answer("Healer", false),
          Answer("What's Wrong with Secretary Kim", true),
          Answer("W - Two Worlds", false),
        ]),
    Question.name(
        "Which K-drama genre typically revolves around the lives and struggles of medical professionals in a hospital setting?",
        [
          Answer("Romantic Comedy", false),
          Answer("Historical", false),
          Answer("Medical Drama", true),
          Answer("Fantasy", false),
        ]),
    Question.name(
        "Which K-drama is based on the popular webtoon of the same name and revolves around a young woman's quest for revenge in the competitive world of a food company?",
        [
          Answer("It's Okay to Not Be Okay", false),
          Answer("Start-Up", true),
          Answer("Weightlifting Fairy Kim Bok-joo", false),
          Answer("Signal", false),
        ]),
    Question.name(
        "Which K-drama features a time-traveling female lead who finds herself in the Joseon Dynasty and becomes entangled in political intrigue?",
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
        title: const Text(
          "Quiz",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.purple.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const Center(
                child: Icon(Icons.quiz, size: 200, color: Colors.purple),
              ),
              const Text(
                "Did you Know?",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purple),
              ),
              const SizedBox(height: 10),
              _buildQuestionContainer(),
              const SizedBox(height: 10),
              _buildAnswerOptions(),
              const SizedBox(height: 10),
              _buildNavigationButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionContainer() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.purple),
      ),
      child: Center(
        child: Text(
          questionBank[qi].quesText,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.purple),
        ),
      ),
    );
  }

  Widget _buildAnswerOptions() {
    return Column(
      children: List.generate(4, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: ElevatedButton(
            onPressed: isAnswered ? null : () => checkAns(questionBank[qi].ansList[index]),
            child: Text(
              questionBank[qi].ansList[index].answerText,
              textAlign: TextAlign.center,
              style: _commonStyle(),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _navigationButton(Icons.navigate_before, "Previous", prevQuiz),
        _navigationButton(Icons.navigate_next, "Next", nextQuiz),
      ],
    );
  }

  Widget _navigationButton(IconData icon, String label, VoidCallback onPressed) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 30, color: Colors.purple),
      label: Text(label, style: _commonStyle()),
    );
  }

  void checkAns(Answer ans) {
    setState(() {
      isAnswered = true;
    });

    final snackBar = SnackBar(
      content: Text(ans.isCorrect ? "Correct!" : "Incorrect!"),
      duration: const Duration(milliseconds: 600),
      backgroundColor: ans.isCorrect ? Colors.green : Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() {
        isAnswered = false;
        nextQuiz();
      });
    });
  }

  void nextQuiz() {
    setState(() {
      qi = (qi + 1) % questionBank.length;
      isAnswered = false;
    });
  }

  void prevQuiz() {
    setState(() {
      if (qi > 0) qi--;
      isAnswered = false;
    });
  }

  TextStyle _commonStyle() {
    return const TextStyle(fontSize: 18, color: Colors.purple);
  }
}
