class Condition {
  List<String>? conditions;
  String? value;

  Condition({required List<String>? conditions, String? value}) {
    this.conditions = conditions;
    this.value = value;
  }

  String toText() {
    for (String condition in this.conditions!) {
      print(condition);
    }
    return "NON-IMPLEMENTED";
  }
}
