import 'package:flutter_pair_programming_lab/src/data/models/action_model.dart';

abstract class ActionDatasourceInterface {
  Future<List<ActionModel>> getActions();
  Future<ActionModel?> getActionById(int actionId);
  Future<void> updateAction(ActionModel action);
}
