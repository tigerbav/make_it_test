import 'package:equatable/equatable.dart';
import 'package:make_it/services/list_custom_painter/custom_painter_type.dart';

class TriggerModel extends Equatable {
  const TriggerModel({
    required this.id,
    required this.shortTitle,
    required this.longTitle,
    required this.children,
    required this.selected,
    required this.isOpened,
  });

  final int id;
  final String shortTitle;
  final String? longTitle;
  final List<TriggerModel>? children;
  final bool selected;
  final bool? isOpened;

  String get getLongTitle => longTitle ?? shortTitle;

  CustomPainterType customPainterType(bool isLast) {
    if (isLast && children != null) {
      return CustomPainterType.topLineCircle;
    } else {
      return CustomPainterType.allLineCircle;
    }
  }

  bool? isLast(int index) => children?[index].id == children?.lastOrNull?.id;

  TriggerModel copyWith({
    int? id,
    String? shortTitle,
    String? longTitle,
    List<TriggerModel>? children,
    bool? selected,
    bool? isOpened,
  }) {
    return TriggerModel(
      id: id ?? this.id,
      shortTitle: shortTitle ?? this.shortTitle,
      longTitle: longTitle ?? this.longTitle,
      children: children ?? this.children,
      selected: selected ?? this.selected,
      isOpened: isOpened ?? this.isOpened,
    );
  }

  @override
  List<Object?> get props => [
        id,
        shortTitle,
        longTitle,
        children,
        selected,
        isOpened,
      ];
}
