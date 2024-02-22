import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/flows/notifications/presentation/enums/trigger_type.dart';
import 'package:make_it/services/list_custom_painter/custom_painter_type.dart';
import 'package:make_it/services/list_custom_painter/list_custom_painter.dart';

class TriggerLines extends StatelessWidget {
  const TriggerLines({
    super.key,
    required this.customPainterTypes,
    required this.triggerType,
  });
  final List<CustomPainterType> customPainterTypes;
  final TriggerType triggerType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58.sp,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: customPainterTypes.length,
        itemBuilder: (context, index) {
          if (triggerType == TriggerType.trigger2) {
            return SizedBox(height: 58.sp, width: 48.sp);
          }
          return CustomPaint(
            painter: ListCustomPainter(
              type: customPainterTypes[index],
            ),
            size: Size(48.sp, double.infinity),
          );
        },
      ),
    );
  }
}
