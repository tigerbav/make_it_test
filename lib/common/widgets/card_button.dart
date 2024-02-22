import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/common/app_colors.dart';
import 'package:make_it/common/app_styles.dart';

class CardButton extends StatelessWidget {
  const CardButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(16.sp),
          side: BorderSide(color: AppColors.shared.activeBtn),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.sp),
            //TODO: need to implement color behavior
          ),
        ),
        child: Text(
          text,
          style: AppStyles.shared.body2BoldActive,
        ),
      ),
    );
  }
}
