// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hero _$HeroFromJson(Map<String, dynamic> json) => Hero(
      type: json['type'] as String,
      hand: (json['hand'] as List<dynamic>?)
              ?.map((e) => TreasureCard.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      gold: json['gold'] as int? ?? 0,
    );

Map<String, dynamic> _$HeroToJson(Hero instance) => <String, dynamic>{
      'type': instance.type,
      'hand': instance.hand.map((e) => e.toJson()).toList(),
      'gold': instance.gold,
    };
