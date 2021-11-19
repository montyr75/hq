import 'package:hq/data/treasure_cards.dart';

void main() {
  final deck = List.from(treasureCards);
  deck.shuffle();

  print("DRAW: ${deck.last.title}\n${deck.last.description}");
}