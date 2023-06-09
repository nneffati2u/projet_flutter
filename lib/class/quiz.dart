import 'package:flutter/material.dart';

class Quiz {
  final String texte;
  final IconData icon;

  const Quiz(this.texte, this.icon);

  get upperCaseText => this.texte;

  get illustration => this.icon;
}
