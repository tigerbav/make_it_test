import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/common/app_colors.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({
    super.key,
    required this.isActive,
    required this.onTap,
  });

  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 24.sp,
        width: 24.sp,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.shared.activeBtn
              : AppColors.shared.lightGrey,
          border: Border.all(color: AppColors.shared.grey),
          shape: BoxShape.circle,
        ),
        child: isActive
            ? Icon(
                Icons.check,
                color: AppColors.shared.white,
                size: 16,
              )
            : null,
      ),
    );
  }
}
