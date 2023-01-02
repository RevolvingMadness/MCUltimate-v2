enum Location {
  EMPTY;

  static String relative({double? x, double? y, double? z}) {
    String result = "~";
    if (x != null) result += x.toString();
    result += " ~";
    if (y != null) result += y.toString();
    result += " ~";
    if (z != null) result += z.toString();
    return result;
  }
}
