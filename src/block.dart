enum Block {
  EMPTY;

  static String at({required String location, required String block}) {
    return "block " + location + " " + block;
  }
}
