import 'package:flutter_pair_programming_lab/src/data/datasources/action_datasource_interface.dart';
import 'package:flutter_pair_programming_lab/src/data/models/action_model.dart';
import 'package:flutter_pair_programming_lab/src/domain/entities/action_entity.dart';
import 'package:flutter_pair_programming_lab/src/domain/repositories/action_repository_interface.dart';

class ActionRepositoryImpl implements ActionRepositoryInterface {
  final ActionDatasourceInterface _datasource;

  ActionRepositoryImpl({required ActionDatasourceInterface datasource})
    : _datasource = datasource;

  @override
  Future<List<ActionEntity>> getActions() async {
    final models = await _datasource.getActions();
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<ActionEntity?> getActionById(int actionId) async {
    final model = await _datasource.getActionById(actionId);
    return model?.toEntity();
  }

  @override
  Future<void> toggleActionStatus(ActionEntity action) async {
    final model = ActionModel.fromEntity(action);
    await _datasource.updateAction(model);
  }
}
