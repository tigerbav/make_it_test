import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/common/app_colors.dart';
import 'package:make_it/common/app_styles.dart';
import 'package:make_it/generated/locale_keys.g.dart';

class EditTextField extends StatelessWidget {
  const EditTextField({
    Key? key,
    this.title,
    this.maxLines = 1,
    this.width,
    this.controller,
    this.focus,
    this.onChanged,
    this.action,
    this.onSubmitted,
    this.keyboardType,
    this.inputFormatters,
    this.initialValue,
    this.hintText,
    this.textAlignCenter = false,
  }) : super(key: key);

  final String? title;
  final int maxLines;
  final double? width;
  final TextEditingController? controller;
  final FocusNode? focus;
  final Function(String)? onChanged;
  final TextInputAction? action;
  final VoidCallback? onSubmitted;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final String? hintText;
  final bool textAlignCenter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: AppStyles.shared.body2MediumBlack,
          ),
          SizedBox(height: 6.sp),
        ],
        SizedBox(
          width: width,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: TextFormField(
              scrollPhysics: const NeverScrollableScrollPhysics(),
              textAlign: textAlignCenter ? TextAlign.center : TextAlign.start,
              initialValue: initialValue,
              inputFormatters: inputFormatters,
              controller: controller,
              focusNode: focus,
              onChanged: onChanged,
              textInputAction: action,
              maxLines: maxLines,
              onFieldSubmitted: (_) => onSubmitted?.call(),
              style: AppStyles.shared.body1BoldBlack,
              keyboardType: keyboardType,
              validator: (value) {
                if ((value == null || value == '') && hintText != null) {
                  return LocaleKeys.error_text.tr();
                }
                return null;
              },
              decoration: InputDecoration(
                fillColor: AppColors.shared.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 17.sp,
                  vertical: 12.sp,
                ),
                hintText: hintText,
                hintStyle: AppStyles.shared.body1Regular,
                filled: true,
                enabledBorder: _border(AppColors.shared.lightGrey),
                focusedErrorBorder: _border(AppColors.shared.red),
                errorBorder: _border(AppColors.shared.red),
                focusedBorder: _border(AppColors.shared.activeBtn),
              ),
            ),
          ),
        ),
      ],
    );
  }

  static InputBorder _border(Color borderColor) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.sp),
        borderSide: BorderSide(color: borderColor),
      );
}
