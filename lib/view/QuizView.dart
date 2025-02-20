import 'package:flutter/material.dart';
import '../Model/Question.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final tickIcon = const Icon(Icons.check, color: Colors.green, size: 28);
  final crossIcon = const Icon(Icons.clear, color: Colors.red, size: 28);
  int count = 0;
  List<Icon> iconsList = [];

  final List<Question> questionsList = [
    Question('The Great Wall of China is visible from space.', false),
    Question('Bananas are berries, but strawberries are not.', true),
    Question('Octopuses have three hearts.', true),
    Question('Water boils at 100°C at all altitudes.', false),
    Question('Lightning never strikes the same place twice.', false),
    Question('The Eiffel Tower can grow taller in the summer.', true),
    Question('Humans share about 50% of their DNA with bananas.', true),
    Question('Goldfish only have a memory span of three seconds.', false),
    Question('There are more stars in the universe than grains of sand on Earth.', true),
    Question('A day on Venus is longer than a year on Venus.', true),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF222831),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  child: Text(
                    questionsList[count].question,
                    key: ValueKey<int>(count),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              _buildButton('True', Colors.green, true),
              SizedBox(height: 15),
              _buildButton('False', Colors.red, false),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: iconsList,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color color, bool answer) {
    return ElevatedButton(
      onPressed: () => _checkAnswer(answer),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 80),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  void _checkAnswer(bool selectedAnswer) {
    if (selectedAnswer == questionsList[count].correctAnswer) {
      setState(() {
        iconsList.add(tickIcon);
        if (count < questionsList.length - 1) count++;
      });
    } else {
      setState(() {
        iconsList.add(crossIcon);
        if (count < questionsList.length - 1) count++;
      });
    }
  }
}
