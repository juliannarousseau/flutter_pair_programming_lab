import 'package:flutter_pair_programming_lab/src/domain/entities/action_entity.dart';
import 'package:flutter_pair_programming_lab/src/domain/repositories/action_repository_interface.dart';

class GetActionsUsecase {
  final ActionRepositoryInterface repository;

  GetActionsUsecase({required this.repository});

  Future<List<ActionEntity>> call() async {
    try {
      return await repository.getActions();
    } catch (e) {
      throw Exception('Falha ao obter ações: $e');
    }
  }
}
