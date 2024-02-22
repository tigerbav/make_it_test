import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/common/app_colors.dart';
import 'package:make_it/common/widgets/custom_app_bar.dart';
import 'package:make_it/flows/notifications/data/datasources/trigger_datasource.dart';
import 'package:make_it/flows/notifications/domain/repositories/trigger_repository.dart';
import 'package:make_it/flows/notifications/presentation/enums/toggle_trigger_type.dart';
import 'package:make_it/flows/notifications/presentation/enums/trigger_type.dart';
import 'package:make_it/flows/notifications/presentation/logic/trigger/trigger_cubit.dart';
import 'package:make_it/flows/notifications/presentation/widgets/trigger/trigger_item.dart';

@RoutePage()
class TriggerScreen extends StatelessWidget {
  const TriggerScreen({super.key, required this.triggerType});

  final TriggerType triggerType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TriggerCubit(
        repository: TriggerRepository(TriggerDataSource()),
        triggerType: triggerType,
      ),
      child: const _TriggerView(),
    );
  }
}

class _TriggerView extends StatelessWidget {
  const _TriggerView();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TriggerCubit>();
    return Scaffold(
      appBar: CustomAppBar(text: cubit.triggerType.title),
      backgroundColor: AppColors.shared.white,
      body: BlocBuilder<TriggerCubit, TriggerState>(
        buildWhen: (p, c) => p.models != c.models || p.isLoading != c.isLoading,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: state.models.length,
            itemBuilder: (_, index) => TriggerItem(
              model: state.models[index],
              type: cubit.triggerType,
              isFirstTime: true,
              onTapSelect: () => cubit.toggleTrigger(
                state.models[index].id,
                ToggleTriggerType.select,
              ),
              onTapOpen: () => cubit.toggleTrigger(
                state.models[index].id,
                ToggleTriggerType.open,
              ),
            ),
          );
        },
      ),
    );
  }
}
