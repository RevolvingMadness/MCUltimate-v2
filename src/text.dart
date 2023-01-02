import 'dart:io';

class Text {
  String? text;
  String? color;
  bool? italic;
  bool? obfuscated;
  bool? bold;
  bool? underlined;
  bool? strikethrough;

  Text({
    required String text,
    String color = "#ffffff",
    bool? italic = false,
    bool? obfuscated = false,
    bool? bold = false,
    bool? underlined = false,
    bool? strikethrough = false,
  }) {
    this.text = text;
    this.color = color;
    this.italic = italic;
    this.obfuscated = obfuscated;
    this.bold = bold;
    this.underlined = underlined;
    this.strikethrough = strikethrough;
  }

  String toStringList() {
    String result = "{\"text\": \"" + text.toString() + "\"";
    if (color != null) result += ', "color": "' + this.color! + '"';
    if (italic != null) result += ', "italic": ' + this.italic.toString();
    if (obfuscated != null && obfuscated != false)
      result += ', "obfuscated": ' + this.obfuscated.toString();
    if (bold != null && bold != false)
      result += ', "bold": ' + this.bold.toString();
    if (underlined != null && underlined != false)
      result += ', "underlined": ' + this.underlined.toString();
    if (strikethrough != null && strikethrough != false)
      result += ', "strikethrough": ' + this.strikethrough.toString();
    return result + "}";
  }

  static String fromArray(List<Text>? text_list) {
    if (text_list == null) {
      print("Text.fromArray text_list arg is null");
      exit(-1);
    }
    String result = "[";
    for (int i = 0; i < text_list.length; i++) {
      result += text_list[i].toStringList();
      if (i != text_list.length - 1) result += ", ";
    }
    return result + "]";
  }
}
