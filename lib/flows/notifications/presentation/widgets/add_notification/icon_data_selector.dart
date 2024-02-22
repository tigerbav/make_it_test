import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/common/app_colors.dart';
import 'package:make_it/flows/notifications/presentation/logic/icon_selector/icon_selector_cubit.dart';

class IconDataSelector extends StatelessWidget {
  const IconDataSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.sp,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: IconSelectorCubit.icons.length,
        separatorBuilder: (_, __) => SizedBox(width: 6.sp),
        itemBuilder: (context, i) => _Item(IconSelectorCubit.icons[i]),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(this.icon);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IconSelectorCubit, IconSelectorState>(
      buildWhen: (p, c) => p.icon != c.icon,
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context.read<IconSelectorCubit>().setIcon(icon),
          child: Container(
            width: 70.sp,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: state.icon == icon
                  ? Border.all(
                      color: AppColors.shared.activeBtn,
                      width: 3.sp,
                    )
                  : null,
            ),
            child: Icon(
              icon,
              color: AppColors.shared.activeBtn,
            ),
          ),
        );
      },
    );
  }
}
