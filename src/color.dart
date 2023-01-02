enum Colors {
  RED;

  static String rgb(int r, int g, int b) {
    String rS = r.toRadixString(16).padLeft(2, "0"); // rS - red   String
    String gS = g.toRadixString(16).padLeft(2, "0"); // gS - green String
    String bS = b.toRadixString(16).padLeft(2, "0"); // bS - blue  String
    return "#" + rS + gS + bS;
  }
}
