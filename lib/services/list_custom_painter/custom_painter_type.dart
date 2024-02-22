enum CustomPainterType { line, allLineCircle, topLineCircle }

extension CustomPainterTypeEx on CustomPainterType {
  static List<CustomPainterType> updateList({
    required int oldListLength,
    required CustomPainterType lastType,
  }) {
    final emptyLines = List.generate(
      oldListLength,
      (_) => CustomPainterType.line,
    );
    emptyLines.add(lastType);

    return emptyLines;
  }
}
