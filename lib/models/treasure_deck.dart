import '../data/treasure_cards.dart';
import 'treasure_card.dart';

class TreasureDeck {
  final List<TreasureCard> _cards = [];
  final List<TreasureCard> _discards = [];

  TreasureDeck() {
    _cards.addAll(treasureCards);
  }
}