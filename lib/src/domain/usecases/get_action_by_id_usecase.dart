import 'package:flutter_pair_programming_lab/src/domain/entities/action_entity.dart';
import 'package:flutter_pair_programming_lab/src/domain/repositories/action_repository_interface.dart';

class GetActionByIdUsecase {
  final ActionRepositoryInterface repository;

  GetActionByIdUsecase({required this.repository});

  Future<ActionEntity> call(int actionId) async {
    try {
      final action = await repository.getActionById(actionId);
      if (action == null) {
        throw Exception('Ação com ID $actionId não encontrada');
      }
      return action;
    } catch (e) {
      throw Exception('Falha ao obter ação com ID $actionId: $e');
    }
  }
}
