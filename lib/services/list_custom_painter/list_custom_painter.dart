import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/common/app_colors.dart';
import 'package:make_it/services/list_custom_painter/custom_painter_type.dart';

class ListCustomPainter extends CustomPainter {
  ListCustomPainter({super.repaint, required this.type});

  final CustomPainterType type;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.shared.grey
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    final pTopMiddle = Offset(size.width / 2, 0);
    late final pBottomMiddle = Offset(size.width / 2, size.height);
    late final pCenter = Offset(size.width / 2, size.height / 2);
    late final pRightHalfMiddle = Offset(size.width * 0.75, size.height / 2);

    late final path = Path();
    path.addOval(Rect.fromCircle(
      center: pCenter,
      radius: 4.sp,
    ));

    switch (type) {
      case CustomPainterType.line:
        canvas.drawLine(pTopMiddle, pBottomMiddle, paint);
      case CustomPainterType.allLineCircle:
        canvas.drawLine(pTopMiddle, pBottomMiddle, paint);
        canvas.drawLine(pCenter, pRightHalfMiddle, paint);
        canvas.drawPath(path, paint);
        canvas.drawCircle(pCenter, 3.sp, paint..color = AppColors.shared.white);
      case CustomPainterType.topLineCircle:
        canvas.drawLine(pTopMiddle, pCenter, paint);
        canvas.drawLine(pCenter, pRightHalfMiddle, paint);
        canvas.drawPath(path, paint);
        canvas.drawCircle(pCenter, 3.sp, paint..color = AppColors.shared.white);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
