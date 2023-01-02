import 'dart:io';

import 'command.dart';

class MCFunction {
  List<List<String>>? commands;
  String? name;

  MCFunction(
      {List<List<String>> commands = const [],
      required String name,
      bool log = true}) {
    this.commands = commands;
    this.name = name;
    if (log)
      print("Initalized function with name: " +
          name +
          ". And commands: " +
          commands.toString());
  }

  void generate(String location) async {
    File file = new File(
        location + "/" + name.toString().toLowerCase() + ".mcfunction");
    file.create();
    if (commands == null) {
      print("Text.fromArray text_list arg is null");
      exit(-1);
    }
    for (int i = 0; i < commands!.length; i++) {
      for (int j = 0; j < commands![i].length; j++) {
        await file.writeAsString(commands![i][j] + "\n", mode: FileMode.append);
      }
    }
  }
}
