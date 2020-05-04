extension StringExt on String {
  bool startsWithIgnoreCase(String pattern) {
    return this.toLowerCase().startsWith(pattern.toLowerCase());
  }
}
