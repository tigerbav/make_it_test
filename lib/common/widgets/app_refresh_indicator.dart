import 'package:flutter/material.dart';
import 'package:make_it/common/app_colors.dart';

class AppRefreshIndicator extends StatelessWidget {
  const AppRefreshIndicator({
    Key? key,
    required this.onRefresh,
    required this.child,
  }) : super(key: key);

  final RefreshCallback onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.shared.black,
      backgroundColor: AppColors.shared.white,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
