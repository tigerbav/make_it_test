part of 'icon_selector_cubit.dart';

class IconSelectorState extends Equatable {
  const IconSelectorState({
    required this.color,
    required this.icon,
  });

  final Color color;
  final IconData icon;
  @override
  List<Object?> get props => [color, icon];
}
