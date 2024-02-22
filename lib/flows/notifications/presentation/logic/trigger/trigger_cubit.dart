import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_it/flows/notifications/data/models/trigger_model.dart';
import 'package:make_it/flows/notifications/domain/repositories/trigger_repository.dart';
import 'package:make_it/flows/notifications/presentation/enums/toggle_trigger_type.dart';

import '../../enums/trigger_type.dart';

part 'trigger_state.dart';

class TriggerCubit extends Cubit<TriggerState> {
  TriggerCubit({
    required this.repository,
    required this.triggerType,
  }) : super(const TriggerState(
          status: TriggerStatus.initial,
          models: [],
        )) {
    _loadTriggers();
  }

  final ITriggerRepository repository;
  final TriggerType triggerType;

  Future<void> _loadTriggers() async {
    emit(state.copyWith(status: TriggerStatus.loading));

    final result = await repository.getTriggers();
    result.fold(
      (l) => emit(state.copyWith(
        status: TriggerStatus.failure,
        errorMessage: l.errorMessage,
      )),
      (r) => emit(state.copyWith(
        status: TriggerStatus.success,
        models: r,
      )),
    );
  }

  void toggleTrigger(int id, ToggleTriggerType triggerType) {
    final triggers = List<TriggerModel>.from(state.models);

    emit(state.copyWith(
      status: TriggerStatus.idle,
      models: _select(triggers, id, triggerType),
    ));
  }

  List<TriggerModel>? _select(
    List<TriggerModel>? models,
    int id,
    ToggleTriggerType triggerType,
  ) {
    if (models == null) return null;

    final triggers = models.map((e) {
      if (e.id == id) {
        if (triggerType == ToggleTriggerType.open && e.isOpened != null) {
          return e.copyWith(isOpened: !e.isOpened!);
        }
        if (triggerType == ToggleTriggerType.select) {
          return e.copyWith(selected: !e.selected);
        }
        return e;
      } //
      else {
        return e.copyWith(children: _select(e.children, id, triggerType));
      }
    }).toList();

    return triggers;
  }
}
