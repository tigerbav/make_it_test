part of 'trigger_cubit.dart';

enum TriggerStatus { initial, success, failure, idle, loading }

class TriggerState extends Equatable {
  const TriggerState({
    required this.status,
    required this.models,
    this.errorMessage,
  });

  final TriggerStatus status;
  final List<TriggerModel> models;
  final String? errorMessage;

  bool get isLoading => status == TriggerStatus.loading;

  TriggerState copyWith({
    required TriggerStatus status,
    List<TriggerModel>? models,
    String? errorMessage,
  }) {
    return TriggerState(
      status: status,
      models: models ?? this.models,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, models, errorMessage];
}
