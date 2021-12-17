import 'package:console/console.dart';
import 'package:hq/models/hand.dart';
import 'package:hq/models/treasure_card.dart';
import 'package:hq/models/treasure_deck.dart';
import 'package:hq/utils/console_utils.dart';

final deck = TreasureDeck();
final hand = Hand();

void main() {
  Console.init();

  printTitle();
  printMenu();
}

void printTitle() {
  Console.setTextColor(ConsoleColor.blue.index);
  Console.write("\n**************");
  Console.write("\nTREASURE CARDS");
  Console.write("\n**************\n");
}

void printMenu() {
  consoleNewLine();

  printMenuItem(phrase: "Draw a card");
  printMenuItem(phrase: "Show hand", highlightIndex: 5);
  printMenuItem(phrase: "Show discards");
  printMenuItem(phrase: "Quit");

  final input = promptForString("Selection: ")!.toLowerCase();

  switch (input) {
    case 'd': drawCard(); break;
    case 'h': printMessage(hand.cardsToString()); break;
    case 's': printMessage(deck.cardsToString(showDiscards: true)); break;
    case 'q': printMessage("GOODBYE!"); return;
    default: printError("What the hell are you talking about? Try again, pal!"); break;
  }

  // show the menu again to prevent program exit
  printMenu();
}

void drawCard() {
  final card = deck.draw();

  if (card.action == TreasureCardAction.hand) {
    hand.add(card);
  }

  printMessage(card.toString());
}