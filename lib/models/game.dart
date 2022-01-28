import 'package:json_annotation/json_annotation.dart';

import 'hero.dart';
import 'treasure_card.dart';
import 'treasure_deck.dart';

part 'game.g.dart';

const defaultName = 'hq_game';

const defaultHeroes = {
  HeroType.barbarian: Hero(type: HeroType.barbarian),
  HeroType.dwarf: Hero(type: HeroType.dwarf),
  HeroType.elf: Hero(type: HeroType.elf),
  HeroType.wizard: Hero(type: HeroType.wizard),
};

@JsonSerializable(explicitToJson: true)
class Game {
  final String name;
  final Map<HeroType, Hero> heroes;
  final TreasureDeck treasureDeck;

  Game({
    this.name = defaultName,
    this.heroes = defaultHeroes,
    this.treasureDeck = const TreasureDeck(),
  });

  factory Game.init([String name = defaultName]) {
    return Game(
      name: name,
      heroes: defaultHeroes,
      treasureDeck: TreasureDeck.init(),
    );
  }

  Game copyWith({
    String? name,
    Map<HeroType, Hero>? heroes,
    TreasureDeck? treasureDeck,
  }) {
    return Game(
      name: name ?? this.name,
      heroes: heroes ?? this.heroes,
      treasureDeck: treasureDeck ?? this.treasureDeck,
    );
  }

  DrawTreasureCardResult drawTreasureCard([HeroType? heroType]) {
    // draw a card
    final result = treasureDeck.draw();

    // convenience variable
    final card = result.card;

    // new game object
    Game game = copyWith(treasureDeck: result.treasureDeck);

    // new deck object
    TreasureDeck deck = game.treasureDeck;

    if (card.action == TreasureCardAction.replaceAndShuffle) {
      deck = deck.replaceAndShuffle(card);
    }
    else {
      assert(heroType != null);

      if (heroType != null) {
        final hero = heroes[heroType];
        assert(hero != null);

        if (hero != null) {
          // clone heroes map
          final heroes = Map<HeroType, Hero>.from(this.heroes);

          if (card.action == TreasureCardAction.discard && card is GoldTreasureCard) {
            deck = deck.discard(card);
            heroes[heroType] = hero.addGold(card.goldValue);
          }
          else if (card.action == TreasureCardAction.hand) {
            heroes[heroType] = hero.addCard(card);
          }

          game = game.copyWith(heroes: Map.unmodifiable(heroes));
        }
      }
    }

    return DrawTreasureCardResult(
      game: game.copyWith(treasureDeck: deck),
      card: card,
    );
  }

  Hero? operator [](HeroType heroType) => heroes[heroType];

  List<HeroType> get heroTypes => heroes.keys.toList();

  bool get isUnnamed => name == defaultName;

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
  Map<String, dynamic> toJson() => _$GameToJson(this);
}

class DrawTreasureCardResult {
  final Game game;
  final TreasureCard card;

  const DrawTreasureCardResult({required this.game, required this.card});
}