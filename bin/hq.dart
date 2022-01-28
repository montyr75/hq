import 'dart:io';

import 'package:console/console.dart';
import 'package:hq/components/console_menu.dart';
import 'package:hq/models/game.dart';
import 'package:hq/models/hero.dart';
import 'package:hq/utils/console_utils.dart';
import 'package:hq/utils/utils.dart';

// TODO: Implement save and load.

const unimplementedMsg = "Not yet implemented.";

Game game = Game.init();

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
  printConsoleMenu([
    const ConsoleMenuOption("Draw a Treasure Card", onSelect: drawTreasureCard),
    ConsoleMenuOption("Show Hero", onSelect: () => printMessage(game[printHeroMenu()].toString())),
    ConsoleMenuOption("Show Discards", onSelect: () => printMessage(game.treasureDeck.discardsToString())),
    const ConsoleMenuOption("Create New Game", onSelect: newGame),
    const ConsoleMenuOption("Load Saved Game", onSelect: loadGame),
    const ConsoleMenuOption("Quit", onSelect: quit),
  ]);

  printMainMenu();
}

void newGame() {
  game = Game.init(promptForStringExt("Enter Game Name: "));

  printMainMenu();
}

void loadGame() {
  printError(unimplementedMsg);

  printMainMenu();
}

void drawTreasureCard() {
  final result = game.treasureDeck.peek().requiresHeroType
      ? game.drawTreasureCard(printHeroMenu())
      : game.drawTreasureCard();

  game = result.game;
  printMessage(result.card.toString());
}

HeroType printHeroMenu() {
  final selectedOption = printConsoleMenu<HeroType>(game.heroTypes.map((type) {
    return ConsoleMenuOption<HeroType>(type, label: type.name.capitalize());
  }).toList());

  return selectedOption.value;
}

void quit() {
  printMessage("GOODBYE!");
  exit(0);
}