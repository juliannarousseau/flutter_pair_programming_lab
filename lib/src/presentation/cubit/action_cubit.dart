import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pair_programming_lab/src/domain/usecases/get_action_by_id_usecase.dart';
import 'package:flutter_pair_programming_lab/src/domain/usecases/get_actions_usecase.dart';
import 'package:flutter_pair_programming_lab/src/domain/usecases/update_action_status_usecase.dart';
import 'package:flutter_pair_programming_lab/src/presentation/cubit/action_state.dart';

class ActionCubit extends Cubit<ActionState> {
  final GetActionByIdUsecase _getActionByIdUsecase;
  final GetActionsUsecase _getActionsUsecase;
  final UpdateActionStatusUsecase _updateActionStatusUsecase;

  ActionCubit({
    required GetActionByIdUsecase getActionByIdUsecase,
    required GetActionsUsecase getActionsUsecase,
    required UpdateActionStatusUsecase updateActionStatusUsecase,
  }) : _getActionByIdUsecase = getActionByIdUsecase,
       _getActionsUsecase = getActionsUsecase,
       _updateActionStatusUsecase = updateActionStatusUsecase,
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
      emit(ActionFailureState(message: e.toString()));
    }
  }

  Future<void> toggleActionStatus(int actionId) async {
    if (state is! ActionSuccessState) return;

    final currentState = state as ActionSuccessState;

    try {
      final action = await _getActionByIdUsecase(actionId);

      final updatedAction = await _updateActionStatusUsecase(action);
      

      final updatedList =
          currentState.actions
              .map(
                (action) =>
                    action.id == updatedAction.id ? updatedAction : action,
              )
              .toList();

      emit(ActionSuccessState(actions: updatedList));
    } catch (e) {
      emit(ActionFailureState(message: e.toString()));
    }
  }
}
