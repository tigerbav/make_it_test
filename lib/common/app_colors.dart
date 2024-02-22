import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static final AppColors shared = AppColors._();
  final _colors = LightColors();

  Color get transparent => _colors.transparent;
  Color get black => _colors.blackColor;
  Color get blackOpacity => _colors.blackColor.withOpacity(0.2);
  Color get white => _colors.whiteColor;
  Color get grey => _colors.greyColor;
  Color get lightGrey => _colors.lightGreyColor;
  Color get red => _colors.redColor;
  Color get activeBtn => _colors.activeBtn;
  Color get pressedBtn => _colors.pressedBtn;
}

abstract class IColor {
  late final Color transparent;
  late final Color blackColor;
  late final Color whiteColor;
  late final Color greyColor;
  late final Color lightGreyColor;
  late final Color redColor;
  late final Color activeBtn;
  late final Color pressedBtn;
}

class LightColors implements IColor {
  @override
  Color transparent = Colors.transparent;

  @override
  Color blackColor = const Color(0xFF1A1717);

  @override
  Color whiteColor = const Color(0xFFFFFFFF);

  @override
  Color greyColor = const Color(0xFF747377);

  @override
  Color lightGreyColor = const Color(0xFFF3F3F4);

  @override
  Color redColor = const Color(0xFFF43528);

  @override
  Color activeBtn = const Color(0xFF6A4DBA);

  @override
  Color pressedBtn = const Color(0xFF4B2AA5);
}
