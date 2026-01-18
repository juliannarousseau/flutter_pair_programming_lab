import 'package:flutter_pair_programming_lab/src/data/models/action_model.dart';

abstract class ActionDatasourceInterface {
  Future<ActionModel> getActionById({required int id});
  Future<List<ActionModel>> getActions();
  Future<void> updateAction({required ActionModel action});
}
