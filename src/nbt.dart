import 'text.dart';

class NBT {
  String text = "{";
  Map? custom;
  String? formatted_nbt;
  NBT({List<Text>? displayName, String? id, int? count, Map? custom}) {
    // {display:{Name:'[{"text":"Mud","color":"#4F3200"},{"text":"hi"}]'}} 1
    if (displayName != null)
      this.text += "display:{Name:'" + Text.fromArray(displayName) + "'}";
    if (custom != null) {
      this.formatted_nbt =
          custom.toString().replaceAllMapped(RegExp(r'( \d+)'), (match) {
        return '${match.group(0)}b';
      });
    }
    if (this.formatted_nbt == null) this.text += "}";
    this.custom = custom;
  }

  String getNBTTag() {
    String result = this.text;
    if (this.custom != null) result += this.formatted_nbt!.replaceAll('{', '');
    print(result);
    return result;
  }
}
