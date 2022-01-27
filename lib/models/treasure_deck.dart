import 'package:json_annotation/json_annotation.dart';

import '../data/treasure_cards.dart';
import 'treasure_card.dart';

part 'treasure_deck.g.dart';

@JsonSerializable(explicitToJson: true)
class TreasureDeck {
  final List<TreasureCard> cards;
  final List<TreasureCard> discards;

  const TreasureDeck({
    this.cards = const [],
    this.discards = const [],
  });

  factory TreasureDeck.init() {
    return TreasureDeck(
      cards: List.unmodifiable(treasureCards.toList()..shuffle()),
    );
  }

  TreasureDeck copyWith({
    List<TreasureCard>? cards,
    List<TreasureCard>? discards,
  }) {
    return TreasureDeck(
      cards: cards ?? this.cards,
      discards: discards ?? this.discards,
    );
  }

  TreasureCard peek() => cards.last;

  DrawResult draw() {
    final card = peek();

    return DrawResult(
      treasureDeck: copyWith(cards: List.unmodifiable(cards.toList()..removeLast())),
      card: card,
    );
  }

  TreasureDeck discard(TreasureCard card) => copyWith(discards: List.unmodifiable([...discards, card]));
  TreasureDeck replaceAndShuffle(TreasureCard card) => copyWith(cards: List.unmodifiable([card, ...cards]..shuffle()));

  String cardsToString() => _cardsToString(cards);
  String discardsToString() => _cardsToString(discards);

  String _cardsToString(List<TreasureCard> cards) {
    if (cards.isEmpty) {
      return "<NO CARDS>";
    }

    final buffer = StringBuffer();

    for (int i = 0; i < cards.length; i++) {
      buffer.writeln("$i: ${cards[i].title}");
    }

    return buffer.toString();
  }

  factory TreasureDeck.fromJson(Map<String, dynamic> json) => _$TreasureDeckFromJson(json);
  Map<String, dynamic> toJson() => _$TreasureDeckToJson(this);
}

class DrawResult {
  final TreasureDeck treasureDeck;
  final TreasureCard card;

  const DrawResult({required this.treasureDeck, required this.card});
}