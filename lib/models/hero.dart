import 'treasure_card.dart';

class Hero {
  final String type;
  final List<TreasureCard> _hand = [];

  int _gold = 0;
  int get gold => _gold;

  Hero(this.type);

  void addCard(TreasureCard card) => _hand.add(card);
  void removeCard(TreasureCard card) => _hand.remove(card);

  void addGold(int value) => _gold += value;
  bool spendGold(int value) {
    if (value > _gold) {
      return false;
    }

    _gold -= value;

    return true;
  }

  String handToString() {
    if (_hand.isEmpty) {
      return "<NO CARDS>";
    }

    final buffer = StringBuffer();

    for (final card in _hand) {
      buffer.writeln("$card");

      if (card != _hand.last) {
        buffer.writeln();
      }
    }

    return buffer.toString();
  }

  @override
  String toString() => "$type\n$gold gp\n\n${handToString()}";
}