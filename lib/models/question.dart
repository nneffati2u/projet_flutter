class Question {
  final String id;
  final String titre;
  final Map<String, bool> options;

  Question({
    String id,
    String titre,
    Map<String, bool> options,
  })  : id = id,
        titre = titre,
        options = options;

  @override
  String toString() {
    return 'Question(id: $id, titre: $titre, options: $options)';
  }
}
