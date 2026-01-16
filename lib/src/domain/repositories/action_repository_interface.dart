import 'package:flutter_pair_programming_lab/src/domain/entities/action_entity.dart';

abstract class ActionRepositoryInterface {
  Future<List<ActionEntity>> getActions();
  Future<ActionEntity?> getActionById(int actionId);
  Future<void> toggleActionStatus(ActionEntity action);
}
