extension EnumExtension on Enum {
  String get rawValue {
    String value = toString();
    List<String> arr = value.split(".");
    return arr[1];
  }
}
