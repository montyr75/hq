// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treasure_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreasureCard _$TreasureCardFromJson(Map<String, dynamic> json) => TreasureCard(
      title: json['title'] as String,
      description: json['description'] as String,
      action: $enumDecode(_$TreasureCardActionEnumMap, json['action']),
    );

Map<String, dynamic> _$TreasureCardToJson(TreasureCard instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'action': _$TreasureCardActionEnumMap[instance.action],
    };

const _$TreasureCardActionEnumMap = {
  TreasureCardAction.discard: 'discard',
  TreasureCardAction.replaceAndShuffle: 'replaceAndShuffle',
  TreasureCardAction.hand: 'hand',
};

GoldTreasureCard _$GoldTreasureCardFromJson(Map<String, dynamic> json) =>
    GoldTreasureCard(
      title: json['title'] as String,
      description: json['description'] as String,
      action: $enumDecode(_$TreasureCardActionEnumMap, json['action']),
      goldValue: json['goldValue'] as int,
    );

Map<String, dynamic> _$GoldTreasureCardToJson(GoldTreasureCard instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'action': _$TreasureCardActionEnumMap[instance.action],
      'goldValue': instance.goldValue,
    };
