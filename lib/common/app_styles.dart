import 'package:flutter/material.dart';
import 'package:make_it/common/app_colors.dart';

class AppStyles {
  static final shared = AppStyles._();

  AppStyles._()
      : body1Bold = _body1Bold,
        body1BoldBlack = _body1Bold.copyWith(color: AppColors.shared.black),
        body1Regular = _body1Regular,
        body1Medium = _body1Regular.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.shared.black,
        ),
        body2Medium = _body2Medium,
        body2MediumBlack = _body2Medium.copyWith(color: AppColors.shared.black),
        body2MediumRed = _body2Medium.copyWith(color: AppColors.shared.red),
        body2Regular = _body2Regular,
        body2Bold = _body2Bold,
        body2BoldActive =
            _body2Bold.copyWith(color: AppColors.shared.activeBtn),
        h1Bold = _h1Bold,
        h1BoldGrey = _h1Bold.copyWith(color: AppColors.shared.grey),
        h2Bold = _h2Bold,
        h3Bold = _h3Bold;

  final TextStyle body1Bold;
  final TextStyle body1BoldBlack;
  final TextStyle body1Regular;
  final TextStyle body1Medium;

  final TextStyle body2Medium;
  final TextStyle body2MediumBlack;
  final TextStyle body2MediumRed;
  final TextStyle body2Regular;
  final TextStyle body2Bold;
  final TextStyle body2BoldActive;

  final TextStyle h1Bold;
  final TextStyle h1BoldGrey;

  final TextStyle h2Bold;

  final TextStyle h3Bold;

  static const _roboto = 'Roboto';

  static final TextStyle _body1Bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.shared.white,
    fontFamily: _roboto,
  );

  static final TextStyle _body1Regular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.shared.grey,
    fontFamily: _roboto,
  );

  static final TextStyle _body2Medium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.shared.grey,
    fontFamily: _roboto,
  );

  static final TextStyle _body2Regular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.shared.grey,
    fontFamily: _roboto,
  );

  static final TextStyle _body2Bold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.shared.black,
    fontFamily: _roboto,
  );

  static final TextStyle _h1Bold = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.shared.black,
    fontFamily: _roboto,
  );

  static final TextStyle _h2Bold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.shared.black,
    fontFamily: _roboto,
  );

  static final TextStyle _h3Bold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.shared.black,
    fontFamily: _roboto,
  );
}
