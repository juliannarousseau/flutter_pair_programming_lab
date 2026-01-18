import 'package:flutter_pair_programming_lab/src/domain/entities/action_entity.dart';
import 'package:flutter_pair_programming_lab/src/domain/repositories/action_repository_interface.dart';

class GetActionByIdUsecase {
  final ActionRepositoryInterface _repository;

  const GetActionByIdUsecase({required ActionRepositoryInterface repository})
    : _repository = repository;

  Future<ActionEntity> call(int actionId) async {
    return await _repository.getActionById(actionId);
  }
}
