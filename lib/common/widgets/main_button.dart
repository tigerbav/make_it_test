import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/common/app_colors.dart';
import 'package:make_it/common/app_styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isSmall = false,
    this.deleteVerticalPadding = false,
  });

  final VoidCallback? onPressed;
  final String text;
  final bool isSmall;
  final bool deleteVerticalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: deleteVerticalPadding ? 0.sp : 32.sp,
        horizontal: 16.sp,
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.all(isSmall ? 12.sp : 16.sp),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return AppColors.shared.pressedBtn;
              } //
              else if (states.contains(MaterialState.disabled)) {
                return AppColors.shared.grey;
              }

              return AppColors.shared.activeBtn;
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.sp)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isSmall) ...[
              Icon(
                Icons.add_circle_outlined,
                color: AppColors.shared.white,
              ),
              SizedBox(width: 10.sp),
            ],
            Text(
              text,
              style: AppStyles.shared.body1Bold,
            ),
          ],
        ),
      ),
    );
  }
}
