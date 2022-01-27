import 'dart:io';

import 'package:console/console.dart';
import 'package:hq/components/console_menu.dart';
import 'package:hq/models/game.dart';
import 'package:hq/utils/console_utils.dart';

const unimplementedMsg = "Not yet implemented.";

Game game = Game.init();

// TODO: Make Game serializable.

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
  final result = game.drawTreasureCard(printHeroMenu());
  game = result.game;
  printMessage(result.card.toString());
}

String printHeroMenu() {
  final selectedOption = printConsoleMenu(game.heroTypes.map(ConsoleMenuOption.new).toList());
  return selectedOption.label;
}

void quit() {
  printMessage("GOODBYE!");
  exit(0);
}