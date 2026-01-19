import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pair_programming_lab/src/domain/usecases/get_actions_usecase.dart';
import 'package:flutter_pair_programming_lab/src/domain/usecases/toggle_action_status_usecase.dart';
import 'package:flutter_pair_programming_lab/src/presentation/cubit/action_state.dart';

class ActionCubit extends Cubit<ActionState> {
  final GetActionsUsecase _getActionsUsecase;
  final ToggleActionStatusUsecase _toggleActionStatusUsecase;

  ActionCubit({
    required GetActionsUsecase getActionsUsecase,
    required ToggleActionStatusUsecase toggleActionStatusUsecase,
  }) : _getActionsUsecase = getActionsUsecase,
       _toggleActionStatusUsecase = toggleActionStatusUsecase,
       super(ActionInitialState());

  Future<void> fetchActions() async {
    emit(ActionLoadingState());

    try {
      final actions = await _getActionsUsecase();

      if (actions.isEmpty) {
        emit(ActionEmptyState());
      } else {
        emit(ActionSuccessState(actions: actions));
      }
    } catch (e) {
      emit(ActionErrorState(message: e.toString()));
    }
  }

  Future<void> toggleActionStatus(int actionId) async {
    if (state is! ActionSuccessState) return;

    final currentState = state as ActionSuccessState;

    final actionToToggleStatus = currentState.actions.firstWhere(
      (action) => action.id == actionId,
    );

    try {
      final updatedAction = await _toggleActionStatusUsecase(
        actionToToggleStatus,
      );

      final updatedList =
          currentState.actions
              .map(
                (action) =>
                    action.id == updatedAction.id ? updatedAction : action,
              )
              .toList();
      emit(ActionSuccessState(actions: updatedList));
    } catch (e) {
      emit(ActionErrorState(message: e.toString()));
    }
  }
}
