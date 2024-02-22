import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/common/app_colors.dart';
import 'package:make_it/common/app_styles.dart';
import 'package:make_it/common/widgets/app_check_box.dart';
import 'package:make_it/flows/notifications/data/models/trigger_model.dart';
import 'package:make_it/flows/notifications/presentation/enums/trigger_type.dart';
import 'dart:math';

import 'package:make_it/flows/notifications/presentation/widgets/trigger/trigger_dropdown.dart';
import 'package:make_it/flows/notifications/presentation/widgets/trigger/trigger_lines.dart';
import 'package:make_it/services/list_custom_painter/custom_painter_type.dart';

class TriggerItem extends StatelessWidget {
  const TriggerItem({
    super.key,
    required this.model,
    required this.type,
    this.isFirstTime = false,
    required this.onTapOpen,
    required this.onTapSelect,
    this.customPainterTypes = const [],
    this.isLast = true,
  });

  final TriggerModel model;
  final TriggerType type;

  //for left padding
  final bool isFirstTime;
  final VoidCallback onTapOpen;
  final VoidCallback onTapSelect;

  //for multi lines
  final List<CustomPainterType> customPainterTypes;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final text =
        type == TriggerType.trigger1 ? model.shortTitle : model.getLongTitle;
    final hasChildren = model.children != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTapOpen,
          child: Container(
            color: AppColors.shared.transparent,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TriggerLines(
                  customPainterTypes: customPainterTypes,
                  triggerType: type,
                ),
                if (hasChildren)
                  Container(
                    width: 48.sp,
                    padding: EdgeInsets.all(12.sp),
                    child: Transform.rotate(
                      angle: model.isOpened == true ? pi : 0,
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.shared.activeBtn,
                      ),
                    ),
                  ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16.sp).copyWith(
                      left: isFirstTime && hasChildren == false ? 16.sp : 0.sp,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppColors.shared.grey),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            text,
                            maxLines: TriggerType.trigger1 == type ? 1 : 4,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.shared.body1BoldBlack,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16.sp),
                          child: AppCheckBox(
                            isActive: model.selected,
                            onTap: onTapSelect,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (model.children != null && model.isOpened == true)
          TriggerDropdown(
            model: model,
            type: type,
            customPainterTypes: customPainterTypes,
          ),
      ],
    );
  }
}
