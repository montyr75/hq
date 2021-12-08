import 'package:hq/models/treasure_deck.dart';

void main() {
  final deck = TreasureDeck();

  final card = deck.draw;

  print("DRAW: $card");

  print("PEEK: ${deck.peek}");
  print("PEEK: ${deck.peek}");
}