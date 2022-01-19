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
  printConsoleMenu(const [
    ConsoleMenuOption("New Game", onSelect: newGame),
    ConsoleMenuOption("Load Game", onSelect: loadGame),
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
  final selectedOption = printConsoleMenu([
    const ConsoleMenuOption("Draw a card", onSelect: drawTreasureCard),
    ConsoleMenuOption("Show hero", onSelect: () => printMessage(printHeroMenu().toString())),
    ConsoleMenuOption("Show discards", onSelect: () => printMessage(treasureDeck.cardsToString(showDiscards: true))),
    ConsoleMenuOption("Quit", onSelect: () => printMessage("GOODBYE!")),
  ]);

  // if user is not quitting, show the main menu again
  if (selectedOption.label != "Quit") {
    printMainMenu();
  }
}

Hero printHeroMenu() {
  final selectedOption = printConsoleMenu(heroes.keys.map(ConsoleMenuOption.new).toList());
  return heroes[selectedOption.label]!;
}

void drawTreasureCard() {
  final card = treasureDeck.draw();

  if (card.action == TreasureCardAction.hand) {
    printHeroMenu().addCard(card);
  }

  if (card is GoldTreasureCard) {
    printHeroMenu().addGold(card.goldValue);
  }

  printMessage(card.toString());
}
