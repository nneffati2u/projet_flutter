import 'package:flutter/material.dart';
import 'package:projet_flutter/models/question.dart';
import 'package:projet_flutter/widgets/bouton_suivant.dart';
import 'package:projet_flutter/widgets/option_card.dart';
import '../constants.dart';
import '../widgets/question_widget.dart';
import '../widgets/result_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Question> _questions = [
    Question(
      id: '10',
      titre: ' Quel est le plus grand océan du monde ?',
      options: {
        'Océan Atlantique': false,
        'Océan Arctique': false,
        'Océan Pacifique': true
      },
    ),
    Question(
      id: '11',
      titre: 'Quel est le plus haut sommet du monde ?',
      options: {
        'Mont Everest': true,
        'Mont Kilimandjaro': false,
        'Mont McKinley': false
      },
    ),
    Question(
      id: '12',
      titre: 'Quelle est la plus grande île du monde ?',
      options: {'Madagascar': false, 'Groenland': true, 'Bornéo': false},
    ),
  ];

  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAlreadySelected = false;
  void boutonSuivant() {
    if (index == _questions.length - 1) {
      showDialog(
          context: context,
          builder: (ctx) => ResultBox(
                result: score,
                questionLength: _questions.length,
                onPressed: restart,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Veuillez sélectionner une réponse'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  void restart() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Quiz'),
        backgroundColor: background,
        shadowColor: Colors.transparent,
        actions: [
          Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Score: $score',
                style: TextStyle(fontSize: 18.0),
              ))
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Questionwidget(
              indexAction: index,
              questions: _questions[index].titre,
              totalQuestions: _questions.length,
            ),
            const Divider(color: neutral),
            const SizedBox(height: 25.0),
            for (int i = 0; i < _questions.length; i++)
              GestureDetector(
                onTap: () => checkAnswerAndUpdate(
                    _questions[index].options.values.toList()[i]),
                child: OptionCard(
                  option: _questions[index].options.keys.toList()[i],
                  color: isPressed
                      ? _questions[index].options.values.toList()[i] == true
                          ? correct
                          : incorrect
                      : neutral,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: BoutonSuivant(
          boutonSuivant: boutonSuivant,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
