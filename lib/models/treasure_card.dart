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

class GoldTreasureCard extends TreasureCard {
  final int goldValue;

  const GoldTreasureCard({
    required String title,
    required String description,
    required TreasureCardAction action,
    required this.goldValue,
  }) : super(title: title, description: description, action: action);

  @override
  String toString() => "${super.toString()}\n$goldValue gp";
}

enum TreasureCardAction {
  discard,
  replaceAndShuffle,
  hand,
}