import 'alignment.dart';
import 'condition.dart';
import 'entity.dart';
import 'item.dart';
import 'text.dart';

enum Command {
  EMPTY;

  static List<String> execute({
    Entity? as,
    Entity? at,
    Condition? condition,
    Alignment? align,
    List<List<String>>? events,
    required List<String> commands,
  }) {
    String prefix = "execute ";
    List<String> result_list = [];
    // execute if entity @s run say hi
    if (as != null) prefix += "as " + Entity.toText(entity: as) + " ";
    if (at != null) prefix += "at " + Entity.toText(entity: at) + " ";
    if (align != null) prefix += "align " + align.name.toLowerCase() + " ";
    if (condition != null) {
      for (int i = 0; i < condition.conditions!.length; i++) {
        prefix += "if " + condition.conditions![i].toString() + " ";
        if (i != condition.conditions!.length - 1) prefix += "execute ";
      }
    }
    prefix += "run ";
    for (String cmd in commands) {
      result_list.add(prefix + cmd);
    }
    for (List<String> event in events!) {
      for (String event_text in event) {
        result_list.add(prefix + event_text);
      }
    }
    return result_list;
  }

  static String say(String text) {
    return "say " + text;
  }

  static String tellraw({required Entity player, required List<Text> text}) {
    return "tellraw " +
        Entity.toText(entity: player) +
        " " +
        Text.fromArray(text);
  }

  static String teleport({required Entity entity, required String location}) {
    return "tp " + Entity.toText(entity: entity) + " " + location;
  }

  static String kill({required Entity entity}) {
    return "kill " + Entity.toText(entity: entity);
  }

  static String setblock({required String location, required String block}) {
    return "setblock " + location + " " + block;
  }

  static String give({required Entity player, required Item item}) {
    return "give " + Entity.toText(entity: player) + " " + item.toText();
  }
}
