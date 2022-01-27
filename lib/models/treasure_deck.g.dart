// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treasure_deck.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreasureDeck _$TreasureDeckFromJson(Map<String, dynamic> json) => TreasureDeck(
      cards: (json['cards'] as List<dynamic>?)
              ?.map((e) => TreasureCard.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      discards: (json['discards'] as List<dynamic>?)
              ?.map((e) => TreasureCard.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TreasureDeckToJson(TreasureDeck instance) =>
    <String, dynamic>{
      'cards': instance.cards.map((e) => e.toJson()).toList(),
      'discards': instance.discards.map((e) => e.toJson()).toList(),
    };
