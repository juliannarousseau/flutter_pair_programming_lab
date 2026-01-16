import 'package:flutter_pair_programming_lab/src/domain/entities/action_entity.dart';

sealed class ActionState {}

class ActionInitialState extends ActionState {}

class ActionLoadingState extends ActionState {}

class ActionSuccessState extends ActionState {
  final List<ActionEntity> actions;

  ActionSuccessState({required this.actions});
}

class ActionEmptyState extends ActionState {}

class ActionErrorState extends ActionState {
  final String message;

  ActionErrorState({required this.message});
}
