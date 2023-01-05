import 'entity.dart';
import 'item.dart';

enum Event {
  EMPTY;

  static List<String> onHoldItem({
    required Entity entity,
    required Item item,
    required List<String> commands,
  }) {
    String prefix = "execute if entity " +
        Entity.toText(entity: entity) +
        "[nbt={SelectedItem:{id:\"minecraft:" +
        item.item! +
        "\"";
    if (item.nbt != null) prefix += ", tag:" + item.nbt!.getNBTTag();
    if (item.count != null) prefix += ", Count:" + item.count.toString() + "b";
    prefix += "}}] run";
    List<String> result = [];
    for (String command in commands) {
      result.add(prefix + " " + command);
    }
    return result;
  }
}
