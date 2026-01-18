import 'package:flutter_pair_programming_lab/src/domain/entities/action_entity.dart';

sealed class ActionState {}

final class ActionInitialState extends ActionState {}

final class ActionLoadingState extends ActionState {}

final class ActionSuccessState extends ActionState {
  final List<ActionEntity> actions;

  ActionSuccessState({required this.actions});
}

final class ActionEmptyState extends ActionState {}

final class ActionFailureState extends ActionState {
  final String message;

  ActionFailureState({required this.message});
}
