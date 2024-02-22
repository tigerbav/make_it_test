import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/common/utils/utils.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 60.sp,
        width: 60.sp,
        child: CircularProgressIndicator(strokeWidth: 5.sp),
      ),
    );
  }

  static final globalKey = GlobalKey();
  static void pop() {
    final ctx = globalKey.currentContext;
    if (ctx != null) {
      ctx.popRoute();
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      globalKey.currentContext?.popRoute();
    });
  }

  static void show(BuildContext context) {
    /// Prevent for presenting several times the same dialog
    if (globalKey.currentContext != null) return;

    Utils.openDialog(
      context,
      AppLoader(key: globalKey),
    );
  }
}
