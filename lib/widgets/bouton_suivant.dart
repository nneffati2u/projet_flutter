import 'package:flutter/material.dart';
import 'package:projet_flutter/constants.dart';

class BoutonSuivant extends StatelessWidget {
  const BoutonSuivant({Key key, this.boutonSuivant}) : super(key: key);
  final VoidCallback boutonSuivant;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: boutonSuivant,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: neutral,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          'Suivant',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
