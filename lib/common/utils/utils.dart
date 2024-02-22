import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/common/app_colors.dart';
import 'package:make_it/common/app_styles.dart';
import 'package:make_it/generated/locale_keys.g.dart';

class Utils {
  static void showSnackBar(
    BuildContext context,
    String? message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.shared.lightGrey,
        content: Row(
          children: [
            Icon(Icons.error_outline, color: AppColors.shared.red),
            SizedBox(width: 6.sp),
            Text(
              message ?? LocaleKeys.something_went_wrong.tr(),
              style: AppStyles.shared.body2MediumRed,
            ),
          ],
        ),
      ),
    );
  }

  static void showModalBottom(
    BuildContext context,
    Widget child,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Container(
        decoration: BoxDecoration(
          color: AppColors.shared.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.sp)),
          boxShadow: [
            BoxShadow(
              color: AppColors.shared.grey,
              blurRadius: 20,
            ),
          ],
        ),
        padding: EdgeInsets.all(16.sp),
        child: child,
      ),
    );
  }

  static Future<dynamic> openDialog(BuildContext context, Widget child) {
    return showDialog(
      context: context,
      barrierColor: AppColors.shared.blackOpacity,
      barrierDismissible: false,
      builder: (context) => Container(
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
