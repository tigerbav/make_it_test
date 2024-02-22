import 'package:flutter/material.dart';
import 'package:make_it/common/app_colors.dart';
import 'package:make_it/common/app_styles.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    required String text,
    double? height,
    Widget? widget,
  }) : super(
          backgroundColor: AppColors.shared.black,
          iconTheme: IconThemeData(color: AppColors.shared.white),
          scrolledUnderElevation: 0,
          toolbarHeight: height,
          title: Column(
            children: [
              Text(
                text,
                style: AppStyles.shared.body1Bold,
              ),
              if (widget != null) widget,
            ],
          ),
        );
}
