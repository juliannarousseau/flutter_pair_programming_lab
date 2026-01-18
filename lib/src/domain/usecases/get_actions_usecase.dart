import 'package:flutter_pair_programming_lab/src/domain/entities/action_entity.dart';
import 'package:flutter_pair_programming_lab/src/domain/repositories/action_repository_interface.dart';

class GetActionsUsecase {
  final ActionRepositoryInterface _repository;

  const GetActionsUsecase({required ActionRepositoryInterface repository})
    : _repository = repository;

  Future<List<ActionEntity>> call() async {
    return await _repository.getActions();
  }
}
