import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_it/flows/notifications/data/models/trigger_model.dart';
import 'package:make_it/flows/notifications/presentation/enums/toggle_trigger_type.dart';
import 'package:make_it/flows/notifications/presentation/enums/trigger_type.dart';
import 'package:make_it/flows/notifications/presentation/logic/trigger/trigger_cubit.dart';
import 'package:make_it/flows/notifications/presentation/widgets/trigger/trigger_item.dart';
import 'package:make_it/services/list_custom_painter/custom_painter_type.dart';

class TriggerDropdown extends StatelessWidget {
  const TriggerDropdown({
    super.key,
    required this.model,
    required this.type,
    required this.customPainterTypes,
  });

  final TriggerModel model;
  final TriggerType type;
  final List<CustomPainterType> customPainterTypes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: model.children!.length,
      itemBuilder: (context, index) {
        final cubit = context.read<TriggerCubit>();

        final checkLast = model.isLast(index) == true;
        final types = CustomPainterTypeEx.updateList(
          oldListLength: customPainterTypes.length,
          lastType: model.customPainterType(checkLast),
        );

        return TriggerItem(
          model: model.children![index],
          type: type,
          customPainterTypes: types,
          isLast: checkLast,
          onTapSelect: () => cubit.toggleTrigger(
            model.children![index].id,
            ToggleTriggerType.select,
          ),
          onTapOpen: () => cubit.toggleTrigger(
            model.children![index].id,
            ToggleTriggerType.open,
          ),
        );
      },
    );
  }
}
