import 'package:json_annotation/json_annotation.dart';

part 'treasure_card.g.dart';

@JsonSerializable(explicitToJson: true)
class TreasureCard {
  final String title;
  final String description;
  final TreasureCardAction action;

  const TreasureCard({
    required this.title,
    required this.description,
    required this.action,
  });

  @override
  String toString() => "$title\n$description\n${action.name}";

  factory TreasureCard.fromJson(Map<String, dynamic> json) => _$TreasureCardFromJson(json);
  Map<String, dynamic> toJson() => _$TreasureCardToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GoldTreasureCard extends TreasureCard {
  final int goldValue;

  const GoldTreasureCard({
    required String title,
    required String description,
    required TreasureCardAction action,
    required this.goldValue,
  }) : super(title: title, description: description, action: action);

  @override
  String toString() => "${super.toString()}\n$goldValue gp";

  factory GoldTreasureCard.fromJson(Map<String, dynamic> json) => _$GoldTreasureCardFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GoldTreasureCardToJson(this);
}

enum TreasureCardAction {
  discard,
  replaceAndShuffle,
  hand,
}