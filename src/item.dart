import 'items.dart';
import 'nbt.dart';

class Item {
  String? item;
  NBT? nbt;
  int? count;

  Item({required Items item, NBT? nbt, int? count}) {
    this.item = Items.toText(item: item);
    this.nbt = nbt;
    this.count = count;
  }

  String toText() {
    String result = this.item!;
    if (this.nbt != null) result += this.nbt!.getNBTTag();
    if (this.count != null) result += " " + this.count.toString();
    return result;
  }
}
