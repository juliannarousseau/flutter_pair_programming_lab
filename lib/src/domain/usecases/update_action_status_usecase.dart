import 'package:flutter_pair_programming_lab/src/commons/enum/status_enum.dart';
import 'package:flutter_pair_programming_lab/src/domain/entities/action_entity.dart';
import 'package:flutter_pair_programming_lab/src/domain/repositories/action_repository_interface.dart';

class UpdateActionStatusUsecase {
  final ActionRepositoryInterface _repository;

  const UpdateActionStatusUsecase({
    required ActionRepositoryInterface repository,
  }) : _repository = repository;

  Future<ActionEntity> call(ActionEntity action) async {
    final updatedAction = action.copyWith(
      status:
          action.status == StatusEnum.pending
              ? StatusEnum.done
              : StatusEnum.pending,
    );

    await _repository.updateActionStatus(updatedAction);
    return updatedAction;
  }
}
