import 'package:flutter/material.dart';
import 'package:projet_flutter/widgets/bouton_suivant.dart';
import '../constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    Key key,
    this.questionLength,
    this.result,
    this.onPressed,
  }) : super(key: key);
  final int result;
  final int questionLength;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Resultat',
              style: TextStyle(color: neutral, fontSize: 22.0),
            ),
            const SizedBox(height: 20.0),
            CircleAvatar(
              child: Text(
                '$result/$questionLength',
                style: TextStyle(fontSize: 26.0),
              ),
              radius: 70.0,
            ),
            GestureDetector(
              onTap: onPressed,
              child: const Text('Recommencer'),
            )
          ],
        ),
      ),
    );
  }
}
