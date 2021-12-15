class TreasureCard {
  final String title;
  final String description;
  final TreasureCardAction action;

  const TreasureCard({
    required this.title,
    required this.description,
    required this.action,
  });

  @override
  String toString() => "$title\n$description\n${action.name}";
}

enum TreasureCardAction {
  discard,
  replaceAndShuffle,
  hand,
}