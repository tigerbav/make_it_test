import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/common/app_colors.dart';
import 'package:make_it/flows/notifications/presentation/logic/icon_selector/icon_selector_cubit.dart';

class IconBgSelector extends StatelessWidget {
  const IconBgSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.sp,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: IconSelectorCubit.colors.length,
        separatorBuilder: (_, __) => SizedBox(width: 6.sp),
        itemBuilder: (context, i) => _Item(IconSelectorCubit.colors[i]),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IconSelectorCubit, IconSelectorState>(
      buildWhen: (p, c) => p.color != c.color,
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context.read<IconSelectorCubit>().setColor(color),
          child: Container(
            width: 70.sp,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: state.color == color
                  ? Border.all(
                      color: AppColors.shared.activeBtn,
                      width: 3.sp,
                    )
                  : null,
            ),
          ),
        );
      },
    );
  }
}
