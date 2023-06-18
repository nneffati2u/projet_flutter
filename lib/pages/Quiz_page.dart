import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String userAnswer = '';

  void submitAnswer() {
    // Vérifier la réponse de l'utilisateur ici et effectuer les actions nécessaires
    // par exemple, vous pouvez comparer userAnswer avec la réponse attendue
    // et mettre à jour le score en conséquence, afficher une boîte de dialogue de résultat, etc.
    // Vous pouvez également enregistrer la réponse de l'utilisateur dans une liste pour un suivi ultérieur.

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Résultat'),
        content: Text('Votre réponse : $userAnswer'),
        actions: [
          ElevatedButton(
            onPressed: () {
              // Effectuer les actions nécessaires après avoir affiché le résultat
              // par exemple, passer à la prochaine question, réinitialiser le quiz, etc.
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz à réponse unique'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question : Quelle est la capitale du Canada ?',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  userAnswer = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Saisissez votre réponse',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: submitAnswer,
              child: Text('Valider'),
            ),
          ],
        ),
      ),
    );
  }
}
