import 'package:console/console.dart';
import 'package:hq/models/hand.dart';
import 'package:hq/models/treasure_card.dart';
import 'package:hq/models/treasure_deck.dart';
import 'package:hq/utils/console_utils.dart';

// TODO: Create a Hero class that contains the hand and tracks gold.

const badMenuSelectionMsg = "What the hell are you talking about? Try again, pal!";
const unimplementedMsg = "Not yet implemented.";

const heroes = [
  'Barbarian',
  'Dwarf',
  'Elf',
  'Wizard',
];

final treasureDeck = TreasureDeck();

final Map<String, Hand> hands = {};

void main() {
  Console.init();

  printTitle();
  printIntroMenu();
}

void printTitle() {
  Console.setTextColor(ConsoleColor.blue.index);
  Console.write("\n**************");
  Console.write("\nTREASURE CARDS");
  Console.write("\n**************\n");
}

void printIntroMenu() {
  consoleNewLine();

  printMenuItem(phrase: "New Game");
  printMenuItem(phrase: "Load Game");

  final input = promptForString("Selection: ")!.toLowerCase();

  switch (input) {
    case 'n': newGame(); printMainMenu(); break;
    case 'l': printError(unimplementedMsg); printIntroMenu(); break;
    default: printError(badMenuSelectionMsg); printIntroMenu(); break;
  }
}

void newGame() {
  treasureDeck.init();

  for (final hero in heroes) {
    hands[hero] = Hand();
  }
}

void printMainMenu() {
  consoleNewLine();

  printMenuItem(phrase: "Draw a card");
  printMenuItem(phrase: "Show hand", highlightIndex: 5);
  printMenuItem(phrase: "Show discards");
  printMenuItem(phrase: "Quit");

  final input = promptForString("Selection: ")!.toLowerCase();

  switch (input) {
    case 'd': drawTreasureCard(); break;
    case 'h': printMessage(hands[printHeroMenu()]!.cardsToString()); break;
    case 's': printMessage(treasureDeck.cardsToString(showDiscards: true)); break;
    case 'q': printMessage("GOODBYE!"); return;
    default: printError(badMenuSelectionMsg); break;
  }

  // show the menu again to prevent program exit
  printMainMenu();
}

String printHeroMenu() {
  consoleNewLine();

  final listOfHeroes = hands.keys.toList();

  for (int i = 0; i < listOfHeroes.length; i++) {
    printMenuItem(phrase: "${i + 1}. ${listOfHeroes[i]}");
  }

  final input = promptForInt("Selection: ");

  if (input != null) {
    final index = input - 1;

    if (index >= 0 && index < listOfHeroes.length) {
      return listOfHeroes[index];
    }
  }

  printError(badMenuSelectionMsg);
  return printHeroMenu();
}

void drawTreasureCard() {
  final card = treasureDeck.draw();

  if (card.action == TreasureCardAction.hand) {
    hands[printHeroMenu()]!.add(card);
  }

  printMessage(card.toString());
}