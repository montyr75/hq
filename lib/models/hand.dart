import 'treasure_card.dart';

class Hand {
  final List<TreasureCard> _cards = [];

  void add(TreasureCard card) => _cards.add(card);
  void remove(TreasureCard card) => _cards.remove(card);

  String cardsToString() {
    if (_cards.isEmpty) {
      return "<NO CARDS>";
    }

    final buffer = StringBuffer();

    for (final TreasureCard card in _cards) {
      buffer.writeln("$card\n");
    }

    return buffer.toString();
  }
}