extension StringEx on String {
  String replaceCharAt(int index, String newChar) {
    if (index > length) return this;
    return substring(0, index) + newChar + substring(index + 1);
  }
}
