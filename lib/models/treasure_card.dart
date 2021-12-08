// TODO: Make [action] enum with values [discard], [replaceAndShuffle], [hand]

class TreasureCard {
  final String title;
  final String description;
  final bool shouldDiscard;

  const TreasureCard({
    required this.title,
    required this.description,
    required this.shouldDiscard,
  });

  @override
  String toString() => "$title\n$description";
}