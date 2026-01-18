import 'package:flutter_pair_programming_lab/src/commons/enum/status_enum.dart';
import 'package:flutter_pair_programming_lab/src/domain/entities/action_entity.dart';
import 'package:flutter_pair_programming_lab/src/domain/repositories/action_repository_interface.dart';

class ToggleActionStatusUsecase {
  final ActionRepositoryInterface _repository;

  ToggleActionStatusUsecase({required ActionRepositoryInterface repository})
    : _repository = repository;

  Future<ActionEntity> call(ActionEntity action) async {
    final updatedAction = action.copyWith(
      status: _updateStatus(action.status),
    );

    await _repository.toggleActionStatus(updatedAction);
    return updatedAction;
  }

  StatusEnum _updateStatus(StatusEnum currentStatus) {
    return currentStatus == StatusEnum.pending
        ? StatusEnum.done
        : StatusEnum.pending;
  }
}
