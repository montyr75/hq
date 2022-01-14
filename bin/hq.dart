import 'package:console/console.dart';
import 'package:hq/components/console_menu.dart';
import 'package:hq/models/hero.dart';
import 'package:hq/models/treasure_card.dart';
import 'package:hq/models/treasure_deck.dart';
import 'package:hq/utils/console_utils.dart';

// TODO: Make a Game class that houses all of our models.

const unimplementedMsg = "Not yet implemented.";

const heroTypes = [
  'Barbarian',
  'Dwarf',
  'Elf',
  'Wizard',
];

final treasureDeck = TreasureDeck();

final Map<String, Hero> heroes = {};

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

  printConsoleMenu(const [
    ConsoleMenuOption("New Game", newGame),
    ConsoleMenuOption("Load Game", loadGame),
  ]);
}

void newGame() {
  treasureDeck.init();

  for (final type in heroTypes) {
    heroes[type] = Hero(type);
  }

  printMainMenu();
}

void loadGame() {
  printError(unimplementedMsg);
  printIntroMenu();
}

void printMainMenu() {
  void showHero() => printMessage(heroes[printHeroMenu()]!.toString());
  void showDiscards() => printMessage(treasureDeck.cardsToString(showDiscards: true));
  void quit() => printMessage("GOODBYE!");

  final selectedOption = printConsoleMenu([
    const ConsoleMenuOption("Draw a card", drawTreasureCard),
    ConsoleMenuOption("Show hero", showHero),
    ConsoleMenuOption("Show discards", showDiscards),
    ConsoleMenuOption("Quit", quit),
  ]);

  // if user is not quitting, show the main menu again
  if (selectedOption.onSelect != quit) {
    printMainMenu();
  }
}

String printHeroMenu() {
  consoleNewLine();

  final listOfHeroes = heroes.keys.toList();

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

  // printError(badMenuSelectionMsg);
  return printHeroMenu();
}

void drawTreasureCard() {
  final card = treasureDeck.draw();

  if (card.action == TreasureCardAction.hand) {
    heroes[printHeroMenu()]!.addCard(card);
  }

  if (card is GoldTreasureCard) {
    heroes[printHeroMenu()]!.addGold(card.goldValue);
  }

  printMessage(card.toString());
}
