import 'package:console/console.dart';
import 'package:hq/models/hand.dart';
import 'package:hq/models/treasure_card.dart';
import 'package:hq/models/treasure_deck.dart';
import 'package:hq/utils/console_utils.dart';

const badMenuSelectionMsg = "What the hell are you talking about? Try again, pal!";

final treasureDeck = TreasureDeck();

final Map<String, Hand> hands = {
  'Russell': Hand(),
  'Kieran': Hand(),
};

void main() {
  Console.init();

  printTitle();
  printMainMenu();
}

void printTitle() {
  Console.setTextColor(ConsoleColor.blue.index);
  Console.write("\n**************");
  Console.write("\nTREASURE CARDS");
  Console.write("\n**************\n");
}

void printMainMenu() {
  consoleNewLine();

  printMenuItem(phrase: "Draw a card");
  printMenuItem(phrase: "Show hand", highlightIndex: 5);
  printMenuItem(phrase: "Show discards");
  printMenuItem(phrase: "Quit");

  final input = promptForString("Selection: ")!.toLowerCase();

  switch (input) {
    case 'd': drawTreasureCard(printPlayerMenu()); break;
    case 'h': printMessage(hands[printPlayerMenu()]!.cardsToString()); break;
    case 's': printMessage(treasureDeck.cardsToString(showDiscards: true)); break;
    case 'q': printMessage("GOODBYE!"); return;
    default: printError(badMenuSelectionMsg); break;
  }

  // show the menu again to prevent program exit
  printMainMenu();
}

String printPlayerMenu() {
  consoleNewLine();

  final listOfPlayers = hands.keys.toList();

  for (int i = 0; i < listOfPlayers.length; i++) {
    printMenuItem(phrase: "${i + 1}. ${listOfPlayers[i]}");
  }

  final input = promptForInt("Selection: ");

  if (input != null) {
    final index = input - 1;

    if (index >= 0 && index < listOfPlayers.length) {
      return listOfPlayers[index];
    }
  }

  printError(badMenuSelectionMsg);
  return printPlayerMenu();
}

void drawTreasureCard(String player) {
  final card = treasureDeck.draw();

  if (card.action == TreasureCardAction.hand) {
    hands[player]!.add(card);
  }

  printMessage(card.toString());
}