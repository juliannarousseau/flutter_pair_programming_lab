import 'package:flutter_pair_programming_lab/src/domain/entities/action_entity.dart';
import 'package:flutter_pair_programming_lab/src/domain/repositories/action_repository_interface.dart';
import 'package:flutter_pair_programming_lab/src/commons/enum/status_enum.dart';

class ToggleActionStatusUsecase {
  final ActionRepositoryInterface _repository;

  ToggleActionStatusUsecase({required ActionRepositoryInterface repository})
    : _repository = repository;

  Future<ActionEntity> call(int actionId) async {
    try {
      final action = await _repository.getActionById(actionId);

      if (action == null) {
        throw Exception('Ação com ID $actionId não encontrada');
      }

      final updatedAction = action.copyWith(
        status: _updateStatus(action.status),
      );

      await _repository.toggleActionStatus(updatedAction);
      return updatedAction;
    } catch (e) {
      throw Exception('Falha ao atualizar o status da ação: $e');
    }
  }

  StatusEnum _updateStatus(StatusEnum currentStatus) {
    return currentStatus == StatusEnum.pending
        ? StatusEnum.done
        : StatusEnum.pending;
  }
}
