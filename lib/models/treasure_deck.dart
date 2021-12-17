import '../data/treasure_cards.dart';
import 'treasure_card.dart';

class TreasureDeck {
  final List<TreasureCard> _cards = [];
  final List<TreasureCard> _discards = [];

  TreasureDeck() {
    _cards.addAll(treasureCards);
    _cards.shuffle();
  }

  TreasureCard peek() => _cards.last;

  TreasureCard draw() {
    final card = _cards.removeLast();

    if (card.action == TreasureCardAction.replaceAndShuffle) {
      _cards.insert(0, card);
      _cards.shuffle();
    }
    else if (card.action == TreasureCardAction.discard) {
     discard(card);
    }

    return card;
  }

  void discard(TreasureCard card) => _discards.add(card);

  String cardsToString({bool showDiscards = false}) {
    final cards = !showDiscards ? _cards : _discards;

    if (cards.isEmpty) {
      return "<NO CARDS>";
    }

    final buffer = StringBuffer();

    for (int i = 0; i < cards.length; i++) {
      buffer.writeln("$i: ${cards[i].title}");
    }

    return buffer.toString();
  }
}