import 'hero.dart';
import 'treasure_card.dart';
import 'treasure_deck.dart';

class Game {
  final Map<String, Hero> _heroes = {
    'Barbarian': Hero('Barbarian'),
    'Dwarf': Hero('Dwarf'),
    'Elf': Hero('Elf'),
    'Wizard': Hero('Wizard'),
  };

  final treasureDeck = TreasureDeck();

  TreasureCard drawTreasureCard(String heroType) {
    final hero = _heroes[heroType];

    assert(hero != null);

    final card = treasureDeck.draw();

    if (hero != null) {
      if (card.action == TreasureCardAction.hand) {
        hero.addCard(card);
      }

      if (card is GoldTreasureCard) {
        hero.addGold(card.goldValue);
      }
    }

    return card;
  }

  Hero? operator [](String heroType) => _heroes[heroType];

  List<String> get heroTypes => _heroes.keys.toList();
}
