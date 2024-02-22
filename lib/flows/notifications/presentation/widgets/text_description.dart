import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/common/app_styles.dart';

class TextDescription extends StatelessWidget {
  const TextDescription({
    super.key,
    required this.title,
    required this.text,
    this.isExpanded = false,
  });

  final String title;
  final String text;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 4,
      style: AppStyles.shared.body2Bold,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppStyles.shared.body2Regular,
        ),
        SizedBox(width: 4.sp),
        isExpanded ? Expanded(child: textWidget) : textWidget,
      ],
    );
  }
}
