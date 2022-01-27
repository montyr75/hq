import 'package:json_annotation/json_annotation.dart';

import 'treasure_card.dart';

part 'hero.g.dart';

@JsonSerializable(explicitToJson: true)
class Hero {
  final String type;
  final List<TreasureCard> hand;
  final int gold;

  const Hero({
    required this.type,
    this.hand = const [],
    this.gold = 0,
  });

  Hero copyWith({
    String? type,
    List<TreasureCard>? hand,
    int? gold,
  }) {
    return Hero(
      type: type ?? this.type,
      hand: hand ?? this.hand,
      gold: gold ?? this.gold,
    );
  }

  Hero addCard(TreasureCard card) => copyWith(hand: List.unmodifiable([...hand, card]));
  Hero removeCard(TreasureCard card) => copyWith(hand: List.unmodifiable(hand.toList()..remove(card)));

  Hero addGold(int value) => copyWith(gold: gold + value);
  Hero spendGold(int value) => copyWith(gold: gold - value);
  bool hasGold(int value) => gold >= value;

  String handToString() {
    if (hand.isEmpty) {
      return "<NO CARDS>";
    }

    final buffer = StringBuffer();

    for (final card in hand) {
      buffer.writeln("$card");

      if (card != hand.last) {
        buffer.writeln();
      }
    }

    return buffer.toString();
  }

  @override
  String toString() => "$type\n$gold gp\n\n${handToString()}";

  factory Hero.fromJson(Map<String, dynamic> json) => _$HeroFromJson(json);
  Map<String, dynamic> toJson() => _$HeroToJson(this);
}