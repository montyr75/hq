class TreasureCard {
  final String title;
  final String description;
  final bool isGood;

  const TreasureCard({
    required this.title,
    required this.description,
    required this.isGood,
  });

  bool get isBad => !isGood;
}