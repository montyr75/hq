import '../utils/console_utils.dart';

const maxOptions = 10;
const badMenuSelectionMsg = "What the hell are you talking about? Try again, pal!";

ConsoleMenuOption<T> printConsoleMenu<T>(List<ConsoleMenuOption<T>> options, {String prompt = "Selection"}) {
  assert(options.length < maxOptions, "TOO MANY OPTIONS");

  consoleNewLine();

  for (int i = 0; i < options.length; i++) {
    printMenuItem(phrase: "${i + 1}. ${options[i]}");
  }

  final input = promptForInt("$prompt: ");

  // check that we have a valid integer
  if (input != null) {
    final index = input - 1;

    // check for valid index range
    if (index >= 0 && index < options.length) {
      final selectedOption = options[index];
      selectedOption.onSelect?.call();
      return selectedOption;
    }
  }

  printError(badMenuSelectionMsg);
  return printConsoleMenu(options);
}

class ConsoleMenuOption<T> {
  final T value;
  final String? label;
  final Function? onSelect;

  const ConsoleMenuOption(this.value, {this.label, this.onSelect});

  @override
  String toString() => label ?? value.toString();
}