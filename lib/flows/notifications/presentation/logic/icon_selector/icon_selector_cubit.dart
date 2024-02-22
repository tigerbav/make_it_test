import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'icon_selector_state.dart';

class IconSelectorCubit extends Cubit<IconSelectorState> {
  IconSelectorCubit({
    required Color? bgColor,
    required IconData? icon,
  }) : super(IconSelectorState(
          color: bgColor ?? colors[0],
          icon: icon ?? icons[0],
        ));

  void setColor(Color color) {
    emit(IconSelectorState(icon: state.icon, color: color));
  }

  void setIcon(IconData icon) {
    emit(IconSelectorState(icon: icon, color: state.color));
  }

  static final colors = [
    Colors.lightGreen.shade200,
    Colors.lightBlue.shade200,
    Colors.yellowAccent.shade100,
    Colors.pink.shade200,
    Colors.purple.shade200,
    Colors.grey.shade200,
    Colors.amber.shade200,
    Colors.brown.shade200,
    Colors.green.shade200,
    Colors.lime.shade200,
  ];

  static const icons = [
    Icons.business_center_outlined,
    Icons.list_alt_outlined,
    Icons.person_add_alt_1_sharp,
    Icons.notifications_active,
    Icons.edit,
    Icons.print,
    Icons.folder_open_outlined,
    Icons.remove_circle_rounded,
    Icons.search,
    Icons.settings,
  ];
}
