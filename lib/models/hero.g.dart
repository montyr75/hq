// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hero _$HeroFromJson(Map<String, dynamic> json) => Hero(
      type: $enumDecode(_$HeroTypeEnumMap, json['type']),
      hand: (json['hand'] as List<dynamic>?)
              ?.map((e) => TreasureCard.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      gold: json['gold'] as int? ?? 0,
    );

Map<String, dynamic> _$HeroToJson(Hero instance) => <String, dynamic>{
      'type': _$HeroTypeEnumMap[instance.type],
      'hand': instance.hand.map((e) => e.toJson()).toList(),
      'gold': instance.gold,
    };

const _$HeroTypeEnumMap = {
  HeroType.barbarian: 'barbarian',
  HeroType.dwarf: 'dwarf',
  HeroType.elf: 'elf',
  HeroType.wizard: 'wizard',
};
