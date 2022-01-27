// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      name: json['name'] as String? ?? defaultName,
      heroes: (json['heroes'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, Hero.fromJson(e as Map<String, dynamic>)),
          ) ??
          defaultHeroes,
      treasureDeck: json['treasureDeck'] == null
          ? const TreasureDeck()
          : TreasureDeck.fromJson(json['treasureDeck'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'name': instance.name,
      'heroes': instance.heroes.map((k, e) => MapEntry(k, e.toJson())),
      'treasureDeck': instance.treasureDeck.toJson(),
    };
